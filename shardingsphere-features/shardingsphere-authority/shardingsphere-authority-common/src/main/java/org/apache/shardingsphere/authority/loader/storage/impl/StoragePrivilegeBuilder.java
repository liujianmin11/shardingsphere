/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.apache.shardingsphere.authority.loader.storage.impl;

import lombok.AccessLevel;
import lombok.NoArgsConstructor;
import org.apache.shardingsphere.authority.model.ShardingSpherePrivileges;
import org.apache.shardingsphere.infra.database.type.DatabaseType;
import org.apache.shardingsphere.infra.exception.ShardingSphereException;
import org.apache.shardingsphere.infra.metadata.ShardingSphereMetaData;
import org.apache.shardingsphere.infra.metadata.user.ShardingSphereUser;
import org.apache.shardingsphere.infra.spi.ShardingSphereServiceLoader;
import org.apache.shardingsphere.infra.spi.typed.TypedSPIRegistry;

import javax.sql.DataSource;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Optional;
import java.util.Properties;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

/**
 * Storage privilege builder.
 */
@NoArgsConstructor(access = AccessLevel.PRIVATE)
public final class StoragePrivilegeBuilder {
    
    private static final int CPU_CORES = Runtime.getRuntime().availableProcessors();
    
    private static final long FUTURE_GET_TIME_OUT_MILLISECONDS = 5000L;
    
    static {
        ShardingSphereServiceLoader.register(StoragePrivilegeLoader.class);
    }
    
    /**
     * Build privileges.
     *
     * @param databaseType database type
     * @param metaDataList meta data list
     * @param users users
     * @return privileges
     */
    public static Map<ShardingSphereUser, ShardingSpherePrivileges> build(final DatabaseType databaseType,
                                                                          final Collection<ShardingSphereMetaData> metaDataList, final Collection<ShardingSphereUser> users) {
        if (metaDataList.isEmpty()) {
            return buildDefaultPrivileges(users);
        }
        Optional<StoragePrivilegeLoader> loader = TypedSPIRegistry.findRegisteredService(StoragePrivilegeLoader.class, databaseType.getName(), new Properties());
        return loader.map(optional -> build(metaDataList, users, optional)).orElseGet(() -> buildDefaultPrivileges(users));
    }
    
    private static Map<ShardingSphereUser, ShardingSpherePrivileges> build(final Collection<ShardingSphereMetaData> metaDataList,
                                                                           final Collection<ShardingSphereUser> users, final StoragePrivilegeLoader loader) {
        Map<ShardingSphereUser, ShardingSpherePrivileges> result = new LinkedHashMap<>();
        for (ShardingSphereMetaData each : metaDataList) {
            result.putAll(build(each, users, loader));
        }
        return result;
    }
    
    private static Map<ShardingSphereUser, ShardingSpherePrivileges> build(final ShardingSphereMetaData metaData, final Collection<ShardingSphereUser> users, final StoragePrivilegeLoader loader) {
        Map<ShardingSphereUser, Collection<ShardingSpherePrivileges>> result = load(metaData.getResource().getAllInstanceDataSources(), users, loader);
        checkPrivileges(result);
        return StoragePrivilegeMerger.merge(result, metaData.getName(), metaData.getRuleMetaData().getRules());
    }
    
    private static Map<ShardingSphereUser, Collection<ShardingSpherePrivileges>> load(final Collection<DataSource> dataSources,
                                                                                      final Collection<ShardingSphereUser> users, final StoragePrivilegeLoader loader) {
        Map<ShardingSphereUser, Collection<ShardingSpherePrivileges>> result = new LinkedHashMap<>(users.size(), 1);
        ExecutorService executorService = Executors.newFixedThreadPool(Math.min(CPU_CORES * 2, dataSources.isEmpty() ? 1 : dataSources.size()));
        Collection<Future<Map<ShardingSphereUser, ShardingSpherePrivileges>>> futures = new HashSet<>(dataSources.size(), 1);
        for (DataSource each : dataSources) {
            futures.add(executorService.submit(() -> loader.load(users, each)));
        }
        futures.forEach(each -> {
            try {
                fillPrivileges(result, each);
            } catch (final InterruptedException | ExecutionException | TimeoutException ex) {
                throw new IllegalStateException(String.format("Error while loading privilege with %s", each), ex);
            }
        });
        executorService.shutdownNow();
        return result;
    }
    
    /**
     * Build default privileges.
     * 
     * @param users users
     * @return privileges
     */
    public static Map<ShardingSphereUser, ShardingSpherePrivileges> buildDefaultPrivileges(final Collection<ShardingSphereUser> users) {
        Map<ShardingSphereUser, ShardingSpherePrivileges> result = new LinkedHashMap<>(users.size(), 1);
        ShardingSpherePrivileges privileges = new ShardingSpherePrivileges();
        privileges.setSuperPrivilege();
        users.forEach(each -> result.put(each, privileges));
        return result;
    }
    
    private static void fillPrivileges(final Map<ShardingSphereUser, Collection<ShardingSpherePrivileges>> userPrivilegeMap,
                                       final Future<Map<ShardingSphereUser, ShardingSpherePrivileges>> future) throws InterruptedException, ExecutionException, TimeoutException {
        for (Entry<ShardingSphereUser, ShardingSpherePrivileges> entry : future.get(FUTURE_GET_TIME_OUT_MILLISECONDS, TimeUnit.MILLISECONDS).entrySet()) {
            if (!userPrivilegeMap.containsKey(entry.getKey())) {
                userPrivilegeMap.put(entry.getKey(), new LinkedHashSet<>());
            }
            userPrivilegeMap.get(entry.getKey()).add(entry.getValue());
        }
    }
    
    private static void checkPrivileges(final Map<ShardingSphereUser, Collection<ShardingSpherePrivileges>> userPrivilegeMap) {
        userPrivilegeMap.forEach(StoragePrivilegeBuilder::checkPrivileges);
    }
    
    private static void checkPrivileges(final ShardingSphereUser user, final Collection<ShardingSpherePrivileges> privileges) {
        Iterator<ShardingSpherePrivileges> iterator = privileges.iterator();
        ShardingSpherePrivileges current = iterator.next();
        while (iterator.hasNext()) {
            if (!current.equals(iterator.next())) {
                throw new ShardingSphereException("Different physical instances have different privileges for user %s", user.getGrantee().toString().replaceAll("%", "%%"));
            }
        }
    }
}

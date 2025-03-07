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

package org.apache.shardingsphere.proxy.backend.text.admin.mysql.executor;

import lombok.Getter;
import org.apache.shardingsphere.infra.check.SQLCheckEngine;
import org.apache.shardingsphere.infra.check.SQLCheckException;
import org.apache.shardingsphere.infra.executor.sql.execute.result.query.QueryResultMetaData;
import org.apache.shardingsphere.infra.executor.sql.execute.result.query.impl.raw.metadata.RawQueryResultColumnMetaData;
import org.apache.shardingsphere.infra.executor.sql.execute.result.query.impl.raw.metadata.RawQueryResultMetaData;
import org.apache.shardingsphere.infra.merge.result.MergedResult;
import org.apache.shardingsphere.infra.metadata.ShardingSphereMetaData;
import org.apache.shardingsphere.infra.metadata.rule.ShardingSphereRuleMetaData;
import org.apache.shardingsphere.proxy.backend.communication.jdbc.connection.BackendConnection;
import org.apache.shardingsphere.proxy.backend.context.ProxyContext;
import org.apache.shardingsphere.proxy.backend.text.admin.executor.DatabaseAdminQueryExecutor;
import org.apache.shardingsphere.sharding.merge.dal.common.SingleLocalDataMergedResult;
import org.apache.shardingsphere.sql.parser.sql.dialect.statement.mysql.dal.MySQLShowDatabasesStatement;

import java.sql.Types;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.LinkedList;

/**
 * Show databases executor.
 */
@Getter
public final class ShowDatabasesExecutor implements DatabaseAdminQueryExecutor {
    
    private MergedResult mergedResult;
    
    @Override
    public void execute(final BackendConnection backendConnection) {
        mergedResult = new SingleLocalDataMergedResult(getSchemaNames(backendConnection));
    }
    
    private Collection<Object> getSchemaNames(final BackendConnection backendConnection) {
        try {
            SQLCheckEngine.check(new MySQLShowDatabasesStatement(), Collections.emptyList(), getMetaData(), backendConnection.getGrantee());
            return new ArrayList<>(ProxyContext.getInstance().getAllSchemaNames());
        } catch (final SQLCheckException ex) {
            Collection<Object> result = new LinkedList<>();
            for (String each : ProxyContext.getInstance().getAllSchemaNames()) {
                if (SQLCheckEngine.check(each, ProxyContext.getInstance().getMetaData(each), backendConnection.getGrantee())) {
                    result.add(each);
                }
            }
            return result;
        }
    }
    
    // TODO the metadata is first one, we need to confirm which schema should use.
    private ShardingSphereMetaData getMetaData() {
        return ProxyContext.getInstance().getAllSchemaNames().isEmpty()
                ? new ShardingSphereMetaData("", null, new ShardingSphereRuleMetaData(Collections.emptyList(), Collections.emptyList()), null)
                : ProxyContext.getInstance().getMetaData(ProxyContext.getInstance().getAllSchemaNames().get(0));
    }
    
    @Override
    public QueryResultMetaData getQueryResultMetaData() {
        return new RawQueryResultMetaData(Collections.singletonList(new RawQueryResultColumnMetaData("SCHEMATA", "Database", "SCHEMA_NAME", Types.VARCHAR, "VARCHAR", 255, 0)));
    }
}

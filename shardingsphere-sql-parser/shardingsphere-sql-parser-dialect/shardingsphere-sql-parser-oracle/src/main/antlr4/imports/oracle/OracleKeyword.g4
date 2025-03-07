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

lexer grammar OracleKeyword;

import Alphabet;

BINARY
    : B I N A R Y
    ;

ESCAPE
    : E S C A P E
    ;

MOD
    : M O D
    ;

XOR
    : X O R
    ;

ROW
    : R O W
    ;

ROWS
    : R O W S
    ;

UNKNOWN
    : U N K N O W N
    ;

ALWAYS
    : A L W A Y S
    ;

CASCADE
    : C A S C A D E
    ;

CHECK
    : C H E C K
    ;

GENERATED
    : G E N E R A T E D
    ;

PRIVILEGES
    : P R I V I L E G E S
    ;

READ
    : R E A D
    ;

WRITE
    : W R I T E
    ;

REFERENCES
    : R E F E R E N C E S
    ;

START
    : S T A R T
    ;

TRANSACTION
    : T R A N S A C T I O N
    ;

USER
    : U S E R
    ;

ROLE
    : R O L E
    ;

VISIBLE
    : V I S I B L E
    ;

INVISIBLE
    : I N V I S I B L E
    ;

EXECUTE
    : E X E C U T E
    ;

USE
    : U S E
    ;

DEBUG
    : D E B U G
    ;

UNDER
    : U N D E R
    ;

FLASHBACK
    : F L A S H B A C K
    ;

ARCHIVE
    : A R C H I V E
    ;

REFRESH
    : R E F R E S H
    ;

QUERY
    : Q U E R Y
    ;

REWRITE
    : R E W R I T E
    ;

KEEP
    : K E E P
    ;

SEQUENCE
    : S E Q U E N C E
    ;

INHERIT
    : I N H E R I T
    ;

TRANSLATE
    : T R A N S L A T E
    ;

MERGE
    : M E R G E
    ;

AT
    : A T
    ;

BITMAP
    : B I T M A P
    ;

CACHE
    : C A C H E
    ;

NOCACHE
    : N O C A C H E
    ;

CHECKPOINT
    : C H E C K P O I N T
    ;

CONNECT
    : C O N N E C T
    ;

CONSTRAINTS
    : C O N S T R A I N T S
    ;

CYCLE
    : C Y C L E
    ;

NOCYCLE
    : N O C Y C L E
    ;

DBTIMEZONE
    : D B T I M E Z O N E
    ;

ENCRYPT
    : E N C R Y P T
    ;

DECRYPT
    : D E C R Y P T
    ;

DEFERRABLE
    : D E F E R R A B L E
    ;

DEFERRED
    : D E F E R R E D
    ;

DIRECTORY
    : D I R E C T O R Y
    ;

EDITION
    : E D I T I O N
    ;

ELEMENT
    : E L E M E N T
    ;

END
    : E N D
    ;

EXCEPT
    : E X C E P T
    ;

EXCEPTIONS
    : E X C E P T I O N S
    ;

FORCE
    : F O R C E
    ;

GLOBAL
    : G L O B A L
    ;

IDENTIFIED
    : I D E N T I F I E D
    ;

IDENTITY
    : I D E N T I T Y
    ;

IMMEDIATE
    : I M M E D I A T E
    ;

INCREMENT
    : I N C R E M E N T
    ;

INITIALLY
    : I N I T I A L L Y
    ;

INVALIDATE
    : I N V A L I D A T E
    ;

JAVA
    : J A V A
    ;

LEVELS
    : L E V E L S
    ;

MAXVALUE
    : M A X V A L U E
    ;

MINVALUE
    : M I N V A L U E
    ;

NOMAXVALUE
    : N O M A X V A L U E
    ;

NOMINVALUE
    : N O M I N V A L U E
    ;

NOSORT
    : N O S O R T
    ;

MINING
    : M I N I N G
    ;

MODEL
    : M O D E L
    ;

MODIFY
    : M O D I F Y
    ;

NATIONAL
    : N A T I O N A L
    ;

NEW
    : N E W
    ;

NOORDER
    : N O O R D E R
    ;

NORELY
    : N O R E L Y
    ;

OF
    : O F
    ;

ONLY
    : O N L Y
    ;

PRIOR
    : P R I O R
    ;

PROFILE
    : P R O F I L E
    ;

REF
    : R E F
    ;

REKEY
    : R E K E Y
    ;

RELY
    : R E L Y
    ;

RENAME
    : R E N A M E
    ;

REPLACE
    : R E P L A C E
    ;

RESOURCE
    : R E S O U R C E
    ;

REVERSE
    : R E V E R S E
    ;

ROWID
    : R O W I D
    ;

SALT
    : S A L T
    ;

SCOPE
    : S C O P E
    ;

SORT
    : S O R T
    ;

SOURCE
    : S O U R C E
    ;

SUBSTITUTABLE
    : S U B S T I T U T A B L E
    ;

TABLESPACE
    : T A B L E S P A C E
    ;

TEMPORARY
    : T E M P O R A R Y
    ;

TRANSLATION
    : T R A N S L A T I O N
    ;

TREAT
    : T R E A T
    ;

NO
    : N O
    ;

UNUSED
    : U N U S E D
    ;

VALIDATE
    : V A L I D A T E
    ;

NOVALIDATE
    : N O V A L I D A T E
    ;

VALUE
    : V A L U E
    ;

VARYING
    : V A R Y I N G
    ;

VIRTUAL
    : V I R T U A L
    ;

ZONE
    : Z O N E
    ;

PUBLIC
    : P U B L I C
    ;

SESSION
    : S E S S I O N
    ;

COMMENT
    : C O M M E N T
    ;

LOCK
    : L O C K
    ;

ADVISOR
    : A D V I S O R
    ;

ADMINISTER
    : A D M I N I S T E R
    ;

TUNING
    : T U N I N G
    ;

MANAGE
    : M A N A G E
    ;

MANAGEMENT
    : M A N A G E M E N T
    ;

OBJECT
    : O B J E C T
    ;

CLUSTER
    : C L U S T E R
    ;

CONTEXT
    : C O N T E X T
    ;

EXEMPT
    : E X E M P T
    ;

REDACTION
    : R E D A C T I O N
    ;

POLICY
    : P O L I C Y
    ;

DATABASE
    : D A T A B A S E
    ;

SYSTEM
    : S Y S T E M
    ;

AUDIT
    : A U D I T
    ;

LINK
    : L I N K
    ;

ANALYZE
    : A N A L Y Z E
    ;

DICTIONARY
    : D I C T I O N A R Y
    ;

DIMENSION
    : D I M E N S I O N
    ;

INDEXTYPE
    : I N D E X T Y P E
    ;

EXTERNAL
    : E X T E R N A L
    ;

JOB
    : J O B
    ;

CLASS
    : C L A S S
    ;

PROGRAM
    : P R O G R A M
    ;

SCHEDULER
    : S C H E D U L E R
    ;

LIBRARY
    : L I B R A R Y
    ;

LOGMINING
    : L O G M I N I N G
    ;

MATERIALIZED
    : M A T E R I A L I Z E D
    ;

CUBE
    : C U B E
    ;

MEASURE
    : M E A S U R E
    ;

FOLDER
    : F O L D E R
    ;

BUILD
    : B U I L D
    ;

PROCESS
    : P R O C E S S
    ;

OPERATOR
    : O P E R A T O R
    ;

OUTLINE
    : O U T L I N E
    ;

PLUGGABLE
    : P L U G G A B L E
    ;

CONTAINER
    : C O N T A I N E R
    ;

SEGMENT
    : S E G M E N T
    ;

RESTRICTED
    : R E S T R I C T E D
    ;

COST
    : C O S T
    ;

SYNONYM
    : S Y N O N Y M
    ;

BACKUP
    : B A C K U P
    ;

UNLIMITED
    : U N L I M I T E D
    ;

BECOME
    : B E C O M E
    ;

CHANGE
    : C H A N G E
    ;

NOTIFICATION
    : N O T I F I C A T I O N
    ;

ACCESS
    : A C C E S S
    ;

PRIVILEGE
    : P R I V I L E G E
    ;

PURGE
    : P U R G E
    ;

RESUMABLE
    : R E S U M A B L E
    ;

SYSGUID
    : S Y S G U I D
    ;

SYSBACKUP
    : S Y S B A C K U P
    ;

SYSDBA
    : S Y S D B A
    ;

SYSDG
    : S Y S D G
    ;

SYSKM
    : S Y S K M
    ;

SYSOPER
    : S Y S O P E R
    ;

DBA_RECYCLEBIN
    : D B A UL_ R E C Y C L E B I N
    ;

FIRST
    : F I R S T
    ;

NCHAR
    : N C H A R
    ;

RAW
    : R A W
    ;

VARCHAR
    : V A R C H A R
    ;

VARCHAR2
    : V A R C H A R [2]
    ;

NVARCHAR2
    : N V A R C H A R [2]
    ;

LONG
    : L O N G
    ;
    
BLOB
    : B L O B
    ;

CLOB
    : C L O B
    ;

NCLOB
    : N C L O B
    ;

BINARY_FLOAT
    : B I N A R Y UL_ F L O A T
    ;

BINARY_DOUBLE
    : B I N A R Y UL_ D O U B L E
    ;

PLS_INTEGER
    : P L S UL_ I N T E G E R
    ;

BINARY_INTEGER
    : B I N A R Y UL_ I N T E G E R
    ;

NUMBER
    : N U M B E R
    ;

NATURALN
    : N A T U R A L N
    ;

POSITIVE
    : P O S I T I V E
    ;

POSITIVEN
    : P O S I T I V E N
    ;

SIGNTYPE
    : S I G N T Y P E
    ;

SIMPLE_INTEGER
    : S I M P L E UL_ I N T E G E R
    ;

BFILE
    : B F I L E
    ;

MLSLABEL
    : M L S L A B E L
    ;

UROWID
    : U R O W I D
    ;

JSON
    : J S O N
    ;

DEC
    : D E C
    ;

SHARING
    : S H A R I N G
    ;

PRIVATE
    : P R I V A T E
    ;

SHARDED
    : S H A R D E D
    ;

DUPLICATED
    : D U P L I C A T E D
    ;

METADATA
    : M E T A D A T A
    ;

DATA
    : D A T A
    ;

EXTENDED
    : E X T E N D E D
    ;

NONE
    : N O N E
    ;

MEMOPTIMIZE
    : M E M O P T I M I Z E
    ;

PARENT
    : P A R E N T
    ;

IDENTIFIER
    : I D E N T I F I E R
    ;

WORK
    : W O R K
    ;

CONTAINER_MAP
    : C O N T A I N E R UL_ M A P
    ;

CONTAINERS_DEFAULT
    : C O N T A I N E R S UL_ D E F A U L T
    ;

WAIT
    : W A I T
    ;

NOWAIT
    : N O W A I T
    ;

BATCH
    : B A T C H
    ;

BLOCK
    : B L O C K
    ;

REBUILD
    : R E B U I L D
    ;

INVALIDATION
    : I N V A L I D A T I O N
    ;

COMPILE
    : C O M P I L E
    ;

USABLE
    : U S A B L E
    ;

UNUSABLE
    : U N U S A B L E
    ;

ONLINE
    : O N L I N E
    ;

MONITORING
    : M O N I T O R I N G
    ;

NOMONITORING
    : N O M O N I T O R I N G
    ;

USAGE
    : U S A G E
    ;

COALESCE
    : C O A L E S C E
    ;

CLEANUP
    : C L E A N U P
    ;

PARALLEL
    : P A R A L L E L
    ;

LOG
    : L O G
    ;

REUSE
    : R E U S E
    ;

STORAGE
    : S T O R A G E
    ;

MATCHED
    : M A T C H E D
    ;

ERRORS
    : E R R O R S
    ;

REJECT
    : R E J E C T
    ;

RETENTION
    : R E T E N T I O N
    ;

CHUNK
    : C H U N K
    ;

PCTVERSION
    : P C T V E R S I O N
    ;

FREEPOOLS
    : F R E E P O O L S
    ;

AUTO
    : A U T O
    ;

DEDUPLICATE
    : D E D U P L I C A T E
    ;

KEEP_DUPLICATES
    : K E E P UL_ D U P L I C A T E S
    ;

COMPRESS
    : C O M P R E S S
    ;

HIGH
    : H I G H
    ;

MEDIUM
    : M E D I U M
    ;

LOW
    : L O W
    ;

NOCOMPRESS
    : N O C O M P R E S S
    ;

READS
    : R E A D S
    ;

CREATION
    : C R E A T I O N
    ;

PCTFREE
    : P C T F R E E
    ;

PCTUSED
    : P C T U S E D
    ;

INITRANS
    : I N I T R A N S
    ;

LOGGING
    : L O G G I N G
    ;

NOLOGGING
    : N O L O G G I N G
    ;

FILESYSTEM_LIKE_LOGGING
    : F I L E S Y S T E M UL_ L I K E UL_ L O G G I N G
    ;

INITIAL
    : I N I T I A L
    ;

MINEXTENTS
    : M I N E X T E N T S
    ;

MAXEXTENTS
    : M A X E X T E N T S
    ;

BASIC
    : B A S I C
    ;

ADVANCED
    : A D V A N C E D
    ;

PCTINCREASE
    : P C T I N C R E A S E
    ;

FREELISTS
    : F R E E L I S T S
    ;

DML
    : D M L
    ;

CAPACITY
    : C A P A C I T Y
    ;

FREELIST
    : F R E E L I S T
    ;

GROUPS
    : G R O U P S
    ;

OPTIMAL
    : O P T I M A L
    ;

BUFFER_POOL
    : B U F F E R UL_ P O O L
    ;

RECYCLE
    : R E C Y C L E
    ;

FLASH_CACHE
    : F L A S H UL_ C A C H E
    ;

CELL_FLASH_CACHE
    : C E L L UL_ F L A S H UL_ C A C H E
    ;

MAXSIZE
    : M A X S I Z E
    ;

STORE
    : S T O R E
    ;

LEVEL
    : L E V E L
    ;

LOCKING
    : L O C K I N G
    ;

INMEMORY
    : I N M E M O R Y
    ;

MEMCOMPRESS
    : M E M C O M P R E S S
    ;

PRIORITY
    : P R I O R I T Y
    ;

CRITICAL
    : C R I T I C A L
    ;

DISTRIBUTE
    : D I S T R I B U T E
    ;

RANGE
    : R A N G E
    ;

PARTITION
    : P A R T I T I O N
    ;

SUBPARTITION
    : S U B P A R T I T I O N
    ;

SERVICE
    : S E R V I C E
    ;

DUPLICATE
    : D U P L I C A T E
    ;

ILM
    : I L M
    ;

DELETE_ALL
    : D E L E T E UL_ A L L
    ;

ENABLE_ALL
    : E N A B L E UL_ A L L
    ;

DISABLE_ALL
    : D I S A B L E UL_ A L L
    ;

AFTER
    : A F T E R
    ;

MODIFICATION
    : M O D I F I C A T I O N
    ;

DAYS
    : D A Y S
    ;

MONTHS
    : M O N T H S
    ;

YEARS
    : Y E A R S
    ;

TIER
    : T I E R
    ;

ORGANIZATION
    : O R G A N I Z A T I O N
    ;

HEAP
    : H E A P
    ;

PCTTHRESHOLD
    : P C T T H R E S H O L D
    ;

PARAMETERS
    : P A R A M E  T E R S
    ;

LOCATION
    : L O C A T I O N
    ;

MAPPING
    : M A P P I N G
    ;

NOMAPPING
    : N O M A P P I N G
    ;

INCLUDING
    : I N C L U D I N G
    ;

OVERFLOW
    : O V E R F L O W
    ;

ATTRIBUTES
    : A T T R I B U T E S
    ;

RESULT_CACHE
    : R E S U L T UL_ C A C H E
    ;

ROWDEPENDENCIES
    : R O W D E P E N D E N C I E S
    ;

NOROWDEPENDENCIES
    : N O R O W D E P E N D E N C I E S
    ; 

ARCHIVAL
    : A R C H I V A L
    ;

EXCHANGE
    : E X C H A N G E
    ;

INDEXING
    : I N D E X I N G
    ;

OFF
    : O F F
    ;

LESS
    : L E S S
    ;

INTERNAL
    : I N T E R N A L
    ;

VARRAY
    : V A R R A Y
    ;

NESTED
    : N E S T E D
    ;

COLUMN_VALUE
    : C O L U M N UL_ V A L U E
    ;

RETURN
    : R E T U R N
    ;

LOCATOR
    : L O C A  T O R
    ;

MODE
    : M O D E
    ;

LOB
    : L O B
    ;

SECUREFILE
    : S E C U R E F I L E
    ;

BASICFILE
    : B A S I C F I L E
    ;

THAN
    : T H A N
    ;

LIST
    : L I S T
    ;

AUTOMATIC
    : A U T O M A T I C
    ;

HASH
    : H A S H
    ;

PARTITIONS
    : P A R T I T I O N S
    ;

SUBPARTITIONS
    : S U B P A R T I T I O N S
    ;

TEMPLATE
    : T E M P L A T E
    ;

PARTITIONSET
    : P A R T I T I O N S E T
    ;

REFERENCE
    : R E F E R E N C E
    ;

CONSISTENT
    : C O N S I S T E N T
    ;

CLUSTERING
    : C L U S T E R I N G
    ;

LINEAR
    : L I N E A R
    ;

INTERLEAVED
    : I N T E R L E A V E D
    ;

YES
    : Y E S
    ;

LOAD
    : L O A D
    ;

MOVEMENT
    : M O V E M E N T
    ;

ZONEMAP
    : Z O N E M A P
    ;

WITHOUT
    : W I T H O U T
    ;

EDITIONABLE
    : E D I T I O N A B L E
    ;

NONEDITIONABLE
    : N O N E D I T I O N A B L E
    ;

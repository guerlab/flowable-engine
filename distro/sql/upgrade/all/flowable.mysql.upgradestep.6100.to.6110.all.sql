
CREATE TABLE ACT_DMN_HI_DECISION_EXECUTION (ID_ varchar(191) NOT NULL, DECISION_DEFINITION_ID_ varchar(191) NULL, DEPLOYMENT_ID_ varchar(191) NULL, START_TIME_ datetime NULL, END_TIME_ datetime NULL, INSTANCE_ID_ varchar(191) NULL, EXECUTION_ID_ varchar(191) NULL, ACTIVITY_ID_ varchar(191) NULL, FAILED_ BIT(1) DEFAULT 0 NULL, TENANT_ID_ varchar(191) NULL, EXECUTION_JSON_ LONGTEXT NULL, CONSTRAINT PK_ACT_DMN_HI_DECISION_EXECUTION PRIMARY KEY (ID_));

INSERT INTO ACT_DMN_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('2', 'flowable', 'changelog-xml/dmn/6110.xml', NOW(), 3, '7:15a6bda1fce898a58e04fe6ac2d89f54', 'createTable tableName=ACT_DMN_HI_DECISION_EXECUTION', '', 'EXECUTED', NULL, NULL, '3.5.3', '7878887968');

update ACT_GE_PROPERTY set VALUE_ = '6.1.1.0' where NAME_ = 'schema.version';

alter table ACT_RU_JOB add column CREATE_TIME_ timestamp(3) NULL;
alter table ACT_RU_TIMER_JOB add column CREATE_TIME_ timestamp(3) NULL;
alter table ACT_RU_SUSPENDED_JOB add column CREATE_TIME_ timestamp(3) NULL;
alter table ACT_RU_DEADLETTER_JOB add column CREATE_TIME_ timestamp(3) NULL;

update ACT_RU_JOB set CREATE_TIME_=CURRENT_TIMESTAMP;
update ACT_RU_TIMER_JOB set CREATE_TIME_=CURRENT_TIMESTAMP;
update ACT_RU_SUSPENDED_JOB set CREATE_TIME_=CURRENT_TIMESTAMP;
update ACT_RU_DEADLETTER_JOB set CREATE_TIME_=CURRENT_TIMESTAMP;


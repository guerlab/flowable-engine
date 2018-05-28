
CREATE TABLE ACT_DMN_HI_DECISION_EXECUTION (ID_ varchar(191) NOT NULL, DECISION_DEFINITION_ID_ varchar(191), DEPLOYMENT_ID_ varchar(191), START_TIME_ TIMESTAMP, END_TIME_ TIMESTAMP, INSTANCE_ID_ varchar(191), EXECUTION_ID_ varchar(191), ACTIVITY_ID_ varchar(191), FAILED_ SMALLINT DEFAULT 0, TENANT_ID_ varchar(191), EXECUTION_JSON_ CLOB, CONSTRAINT PK_ACT_DMN_HI_DEC PRIMARY KEY (ID_));

INSERT INTO ACT_DMN_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('2', 'flowable', 'changelog-xml/dmn/6110.xml', CURRENT TIMESTAMP, 3, '7:15a6bda1fce898a58e04fe6ac2d89f54', 'createTable tableName=ACT_DMN_HI_DECISION_EXECUTION', '', 'EXECUTED', NULL, NULL, '3.5.3', '7878886363');

update ACT_GE_PROPERTY set VALUE_ = '6.1.1.0' where NAME_ = 'schema.version';

alter table ACT_RU_JOB add column CREATE_TIME_ timestamp;
alter table ACT_RU_TIMER_JOB add column CREATE_TIME_ timestamp;
alter table ACT_RU_SUSPENDED_JOB add column CREATE_TIME_ timestamp;
alter table ACT_RU_DEADLETTER_JOB add column CREATE_TIME_ timestamp;

update ACT_RU_JOB set CREATE_TIME_=CURRENT_TIMESTAMP;
update ACT_RU_TIMER_JOB set CREATE_TIME_=CURRENT_TIMESTAMP;
update ACT_RU_SUSPENDED_JOB set CREATE_TIME_=CURRENT_TIMESTAMP;
update ACT_RU_DEADLETTER_JOB set CREATE_TIME_=CURRENT_TIMESTAMP;



CREATE TABLE ACT_CMMN_HI_PLAN_ITEM_INST (ID_ varchar(191) NOT NULL, REV_ INTEGER NOT NULL, NAME_ varchar(191), STATE_ varchar(191), CASE_DEF_ID_ varchar(191), CASE_INST_ID_ varchar(191), STAGE_INST_ID_ varchar(191), IS_STAGE_ SMALLINT, ELEMENT_ID_ varchar(191), ITEM_DEFINITION_ID_ varchar(191), ITEM_DEFINITION_TYPE_ varchar(191), CREATED_TIME_ TIMESTAMP, LAST_AVAILABLE_TIME_ TIMESTAMP, LAST_ENABLED_TIME_ TIMESTAMP, LAST_DISABLED_TIME_ TIMESTAMP, LAST_STARTED_TIME_ TIMESTAMP, LAST_SUSPENDED_TIME_ TIMESTAMP, COMPLETED_TIME_ TIMESTAMP, OCCURRED_TIME_ TIMESTAMP, TERMINATED_TIME_ TIMESTAMP, EXIT_TIME_ TIMESTAMP, ENDED_TIME_ TIMESTAMP, LAST_UPDATED_TIME_ TIMESTAMP, START_USER_ID_ varchar(191), REFERENCE_ID_ varchar(191), REFERENCE_TYPE_ varchar(191), TENANT_ID_ varchar(191) DEFAULT '', CONSTRAINT PK_ACT_CMMN_HI_PL PRIMARY KEY (ID_));

ALTER TABLE ACT_CMMN_RU_MIL_INST ADD TENANT_ID_ varchar(191) DEFAULT '';

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ACT_CMMN_RU_MIL_INST');

ALTER TABLE ACT_CMMN_HI_MIL_INST ADD TENANT_ID_ varchar(191) DEFAULT '';

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ACT_CMMN_HI_MIL_INST');

INSERT INTO ACT_CMMN_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('4', 'flowable', 'changelog-xml/cmmn/6310.xml', CURRENT TIMESTAMP, 7, '8:e40d29cb79345b7fb5afd38a7f0ba8fc', 'createTable tableName=ACT_CMMN_HI_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_MIL_INST; addColumn tableName=ACT_CMMN_HI_MIL_INST', '', 'EXECUTED', NULL, NULL, '3.6.1', '6984985934');


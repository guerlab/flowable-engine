
CREATE TABLE act_dmn_databasechangelog (ID varchar(191) NOT NULL, AUTHOR varchar(191) NOT NULL, FILENAME varchar(191) NOT NULL, DATEEXECUTED TIMESTAMP WITHOUT TIME ZONE NOT NULL, ORDEREXECUTED INTEGER NOT NULL, EXECTYPE VARCHAR(10) NOT NULL, MD5SUM VARCHAR(35), DESCRIPTION varchar(191), COMMENTS varchar(191), TAG varchar(191), LIQUIBASE VARCHAR(20), CONTEXTS varchar(191), LABELS varchar(191), DEPLOYMENT_ID VARCHAR(10));

CREATE TABLE ACT_DMN_DEPLOYMENT (ID_ varchar(191) NOT NULL, NAME_ varchar(191), CATEGORY_ varchar(191), DEPLOY_TIME_ TIMESTAMP WITHOUT TIME ZONE, TENANT_ID_ varchar(191), PARENT_DEPLOYMENT_ID_ varchar(191), CONSTRAINT ACT_DMN_DEPLOYMENT_PKEY PRIMARY KEY (ID_));

CREATE TABLE ACT_DMN_DEPLOYMENT_RESOURCE (ID_ varchar(191) NOT NULL, NAME_ varchar(191), DEPLOYMENT_ID_ varchar(191), RESOURCE_BYTES_ BYTEA, CONSTRAINT ACT_DMN_DEPLOYMENT_RESOURCE_PKEY PRIMARY KEY (ID_));

CREATE TABLE ACT_DMN_DECISION_TABLE (ID_ varchar(191) NOT NULL, NAME_ varchar(191), VERSION_ INTEGER, KEY_ varchar(191), CATEGORY_ varchar(191), DEPLOYMENT_ID_ varchar(191), PARENT_DEPLOYMENT_ID_ varchar(191), TENANT_ID_ varchar(191), RESOURCE_NAME_ varchar(191), DESCRIPTION_ varchar(191), CONSTRAINT ACT_DMN_DECISION_TABLE_PKEY PRIMARY KEY (ID_));

INSERT INTO act_dmn_databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1', 'activiti', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', NOW(), 1, '8:c8701f1c71018b55029f450b2e9a10a1', 'createTable tableName=ACT_DMN_DEPLOYMENT; createTable tableName=ACT_DMN_DEPLOYMENT_RESOURCE; createTable tableName=ACT_DMN_DECISION_TABLE', '', 'EXECUTED', NULL, NULL, '3.6.1', '6986086207');

CREATE TABLE ACT_DMN_HI_DECISION_EXECUTION (ID_ varchar(191) NOT NULL, DECISION_DEFINITION_ID_ varchar(191), DEPLOYMENT_ID_ varchar(191), START_TIME_ TIMESTAMP WITHOUT TIME ZONE, END_TIME_ TIMESTAMP WITHOUT TIME ZONE, INSTANCE_ID_ varchar(191), EXECUTION_ID_ varchar(191), ACTIVITY_ID_ varchar(191), FAILED_ BOOLEAN DEFAULT FALSE, TENANT_ID_ varchar(191), EXECUTION_JSON_ TEXT, CONSTRAINT ACT_DMN_HI_DECISION_EXECUTION_PKEY PRIMARY KEY (ID_));

INSERT INTO act_dmn_databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('2', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', NOW(), 3, '8:47f94b27feb7df8a30d4e338c7bd5fb8', 'createTable tableName=ACT_DMN_HI_DECISION_EXECUTION', '', 'EXECUTED', NULL, NULL, '3.6.1', '6986086207');

ALTER TABLE ACT_DMN_HI_DECISION_EXECUTION ADD SCOPE_TYPE_ varchar(191);

INSERT INTO act_dmn_databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('3', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', NOW(), 5, '8:ac17eae89fbdccb6e08daf3c7797b579', 'addColumn tableName=ACT_DMN_HI_DECISION_EXECUTION', '', 'EXECUTED', NULL, NULL, '3.6.1', '6986086207');

ALTER TABLE ACT_DMN_DECISION_TABLE DROP COLUMN PARENT_DEPLOYMENT_ID_;

INSERT INTO act_dmn_databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('4', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', NOW(), 7, '8:f73aabc4529e7292c2942073d1cff6f9', 'dropColumn columnName=PARENT_DEPLOYMENT_ID_, tableName=ACT_DMN_DECISION_TABLE', '', 'EXECUTED', NULL, NULL, '3.6.1', '6986086207');


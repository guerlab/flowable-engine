
CREATE TABLE ACT_DMN_DATABASECHANGELOG (ID varchar(191) NOT NULL, AUTHOR varchar(191) NOT NULL, FILENAME varchar(191) NOT NULL, DATEEXECUTED datetime NOT NULL, ORDEREXECUTED INT NOT NULL, EXECTYPE VARCHAR(10) NOT NULL, MD5SUM VARCHAR(35) NULL, DESCRIPTION varchar(191) NULL, COMMENTS varchar(191) NULL, TAG varchar(191) NULL, LIQUIBASE VARCHAR(20) NULL, CONTEXTS varchar(191) NULL, LABELS varchar(191) NULL, DEPLOYMENT_ID VARCHAR(10) NULL);

CREATE TABLE ACT_DMN_DEPLOYMENT (ID_ varchar(191) NOT NULL, NAME_ varchar(191) NULL, CATEGORY_ varchar(191) NULL, DEPLOY_TIME_ datetime NULL, TENANT_ID_ varchar(191) NULL, PARENT_DEPLOYMENT_ID_ varchar(191) NULL, CONSTRAINT PK_ACT_DMN_DEPLOYMENT PRIMARY KEY (ID_));

CREATE TABLE ACT_DMN_DEPLOYMENT_RESOURCE (ID_ varchar(191) NOT NULL, NAME_ varchar(191) NULL, DEPLOYMENT_ID_ varchar(191) NULL, RESOURCE_BYTES_ LONGBLOB NULL, CONSTRAINT PK_ACT_DMN_DEPLOYMENT_RESOURCE PRIMARY KEY (ID_));

CREATE TABLE ACT_DMN_DECISION_TABLE (ID_ varchar(191) NOT NULL, NAME_ varchar(191) NULL, VERSION_ INT NULL, KEY_ varchar(191) NULL, CATEGORY_ varchar(191) NULL, DEPLOYMENT_ID_ varchar(191) NULL, PARENT_DEPLOYMENT_ID_ varchar(191) NULL, TENANT_ID_ varchar(191) NULL, RESOURCE_NAME_ varchar(191) NULL, DESCRIPTION_ varchar(191) NULL, CONSTRAINT PK_ACT_DMN_DECISION_TABLE PRIMARY KEY (ID_));

INSERT INTO ACT_DMN_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1', 'activiti', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', NOW(), 1, '8:c8701f1c71018b55029f450b2e9a10a1', 'createTable tableName=ACT_DMN_DEPLOYMENT; createTable tableName=ACT_DMN_DEPLOYMENT_RESOURCE; createTable tableName=ACT_DMN_DECISION_TABLE', '', 'EXECUTED', NULL, NULL, '3.6.1', '6986085275');

CREATE TABLE ACT_DMN_HI_DECISION_EXECUTION (ID_ varchar(191) NOT NULL, DECISION_DEFINITION_ID_ varchar(191) NULL, DEPLOYMENT_ID_ varchar(191) NULL, START_TIME_ datetime NULL, END_TIME_ datetime NULL, INSTANCE_ID_ varchar(191) NULL, EXECUTION_ID_ varchar(191) NULL, ACTIVITY_ID_ varchar(191) NULL, FAILED_ BIT(1) DEFAULT 0 NULL, TENANT_ID_ varchar(191) NULL, EXECUTION_JSON_ LONGTEXT NULL, CONSTRAINT PK_ACT_DMN_HI_DECISION_EXECUTION PRIMARY KEY (ID_));

INSERT INTO ACT_DMN_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('2', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', NOW(), 3, '8:47f94b27feb7df8a30d4e338c7bd5fb8', 'createTable tableName=ACT_DMN_HI_DECISION_EXECUTION', '', 'EXECUTED', NULL, NULL, '3.6.1', '6986085275');

ALTER TABLE ACT_DMN_HI_DECISION_EXECUTION ADD SCOPE_TYPE_ varchar(191) NULL;

INSERT INTO ACT_DMN_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('3', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', NOW(), 5, '8:ac17eae89fbdccb6e08daf3c7797b579', 'addColumn tableName=ACT_DMN_HI_DECISION_EXECUTION', '', 'EXECUTED', NULL, NULL, '3.6.1', '6986085275');

ALTER TABLE ACT_DMN_DECISION_TABLE DROP COLUMN PARENT_DEPLOYMENT_ID_;

INSERT INTO ACT_DMN_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('4', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', NOW(), 7, '8:f73aabc4529e7292c2942073d1cff6f9', 'dropColumn columnName=PARENT_DEPLOYMENT_ID_, tableName=ACT_DMN_DECISION_TABLE', '', 'EXECUTED', NULL, NULL, '3.6.1', '6986085275');


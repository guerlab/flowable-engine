
ALTER TABLE PUBLIC.ACT_FO_FORM_INSTANCE ADD SCOPE_ID_ varchar(191);

ALTER TABLE PUBLIC.ACT_FO_FORM_INSTANCE ADD SCOPE_TYPE_ varchar(191);

ALTER TABLE PUBLIC.ACT_FO_FORM_INSTANCE ADD SCOPE_DEFINITION_ID_ varchar(191);

INSERT INTO PUBLIC.ACT_DMN_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('2', 'flowable', 'changelog-xml/form/6200.xml', NOW, 3, '7:4850f9311e7503d7ea30a372e79b4ea2', 'addColumn tableName=ACT_FO_FORM_INSTANCE', '', 'EXECUTED', NULL, NULL, '3.5.3', '7878887327');


alter table ACT_ID_USER add TENANT_ID_ varchar(191) default '';

alter table ACT_ID_PRIV alter column NAME_ set not null;
alter table ACT_ID_PRIV add constraint ACT_UNIQ_PRIV_NAME unique (NAME_);

update ACT_ID_PROPERTY set VALUE_ = '6.3.0.0' where NAME_ = 'schema.version';
ALTER TABLE ACT_CO_CONTENT_ITEM ADD SCOPE_ID_ varchar(191);

ALTER TABLE ACT_CO_CONTENT_ITEM ADD SCOPE_TYPE_ varchar(191);

CREATE INDEX idx_contitem_scope ON ACT_CO_CONTENT_ITEM(SCOPE_ID_, SCOPE_TYPE_);

INSERT INTO act_dmn_databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('2', 'flowable', 'changelog-xml/content/6300.xml', NOW(), 3, '7:5aa445d140a638ee432a00c23134dd98', 'addColumn tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_scope, tableName=ACT_CO_CONTENT_ITEM', '', 'EXECUTED', NULL, NULL, '3.5.3', '2784597305');


ALTER TABLE ACT_DMN_HI_DECISION_EXECUTION ADD SCOPE_TYPE_ varchar(191);

INSERT INTO act_dmn_databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('3', 'flowable', 'changelog-xml/dmn/6300.xml', NOW(), 5, '7:eed5dec2f94778b62d0b0b4beebc191d', 'addColumn tableName=ACT_DMN_HI_DECISION_EXECUTION', '', 'EXECUTED', NULL, NULL, '3.5.3', '2784597095');

update ACT_GE_PROPERTY set VALUE_ = '6.3.0.0' where NAME_ = 'identitylink.schema.version';

alter table ACT_RU_IDENTITYLINK add column SCOPE_ID_ varchar(191);
alter table ACT_RU_IDENTITYLINK add column SCOPE_TYPE_ varchar(191);
alter table ACT_RU_IDENTITYLINK add column SCOPE_DEFINITION_ID_ varchar(191);

create index ACT_IDX_IDENT_LNK_SCOPE on ACT_RU_IDENTITYLINK(SCOPE_ID_, SCOPE_TYPE_);
create index ACT_IDX_IDENT_LNK_SCOPE_DEF on ACT_RU_IDENTITYLINK(SCOPE_DEFINITION_ID_, SCOPE_TYPE_);

alter table ACT_RU_TASK add column SUB_TASK_COUNT_ integer;
update ACT_RU_TASK t set SUB_TASK_COUNT_ = (select count(*) from (select * from ACT_RU_TASK where IS_COUNT_ENABLED_ = true) as count_table where PARENT_TASK_ID_ = t.ID_) where t.IS_COUNT_ENABLED_ = true;

update ACT_GE_PROPERTY set VALUE_ = '6.3.0.0' where NAME_ = 'task.schema.version';

update ACT_GE_PROPERTY set VALUE_ = '6.3.0.0' where NAME_ = 'variable.schema.version';

update ACT_RU_TIMER_JOB set HANDLER_TYPE_ = 'cmmn-trigger-timer' where HANDLER_TYPE_ = 'trigger-timer' and SCOPE_TYPE_ = 'cmmn';

update ACT_GE_PROPERTY set VALUE_ = '6.3.0.0' where NAME_ = 'job.schema.version';
update ACT_GE_PROPERTY set VALUE_ = '6.3.0.0' where NAME_ = 'schema.version';

alter table ACT_HI_IDENTITYLINK add column SCOPE_ID_ varchar(191);
alter table ACT_HI_IDENTITYLINK add column SCOPE_TYPE_ varchar(191);
alter table ACT_HI_IDENTITYLINK add column SCOPE_DEFINITION_ID_ varchar(191);

create index ACT_IDX_HI_IDENT_LNK_SCOPE on ACT_HI_IDENTITYLINK(SCOPE_ID_, SCOPE_TYPE_);
create index ACT_IDX_HI_IDENT_LNK_SCOPE_DEF on ACT_HI_IDENTITYLINK(SCOPE_DEFINITION_ID_, SCOPE_TYPE_);


ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD IS_COMPLETEABLE_ BOOLEAN;

ALTER TABLE ACT_CMMN_RU_CASE_INST ADD IS_COMPLETEABLE_ BOOLEAN;

CREATE INDEX ACT_IDX_PLAN_ITEM_STAGE_INST ON ACT_CMMN_RU_PLAN_ITEM_INST(STAGE_INST_ID_);

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD IS_COUNT_ENABLED_ BOOLEAN;

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD VAR_COUNT_ INT;

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD SENTRY_PART_INST_COUNT_ INT;

INSERT INTO act_cmmn_databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('3', 'flowable', 'changelog-xml/cmmn/6300.xml', NOW(), 5, '7:1c0c14847bb4a891aaf91668d14240c1', 'addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_CASE_INST; createIndex indexName=ACT_IDX_PLAN_ITEM_STAGE_INST, tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableNam...', '', 'EXECUTED', NULL, NULL, '3.5.3', '2784596952');


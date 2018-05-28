create table ACT_GE_PROPERTY (
    NAME_ varchar(64),
    VALUE_ varchar(300),
    REV_ integer,
    primary key (NAME_)
);

create table ACT_GE_BYTEARRAY (
    ID_ varchar(64),
    REV_ integer,
    NAME_ varchar(191),
    DEPLOYMENT_ID_ varchar(64),
    BYTES_ longvarbinary,
    GENERATED_ bit,
    primary key (ID_)
);

insert into ACT_GE_PROPERTY
values ('common.schema.version', '6.3.1.0', 1);

insert into ACT_GE_PROPERTY
values ('next.dbid', '1', 1);

create table ACT_RU_IDENTITYLINK (
    ID_ varchar(64),
    REV_ integer,
    GROUP_ID_ varchar(191),
    TYPE_ varchar(191),
    USER_ID_ varchar(191),
    TASK_ID_ varchar(64),
    PROC_INST_ID_ varchar(64) null,
    PROC_DEF_ID_ varchar(64),
    SCOPE_ID_ varchar(191),
    SCOPE_TYPE_ varchar(191),
    SCOPE_DEFINITION_ID_ varchar(191),
    primary key (ID_)
);

create index ACT_IDX_IDENT_LNK_USER on ACT_RU_IDENTITYLINK(USER_ID_);
create index ACT_IDX_IDENT_LNK_GROUP on ACT_RU_IDENTITYLINK(GROUP_ID_);
create index ACT_IDX_IDENT_LNK_SCOPE on ACT_RU_IDENTITYLINK(SCOPE_ID_, SCOPE_TYPE_);
create index ACT_IDX_IDENT_LNK_SCOPE_DEF on ACT_RU_IDENTITYLINK(SCOPE_DEFINITION_ID_, SCOPE_TYPE_);

insert into ACT_GE_PROPERTY values ('identitylink.schema.version', '6.3.1.0', 1);
create table ACT_RU_TASK (
    ID_ varchar(64),
    REV_ integer,
    EXECUTION_ID_ varchar(64),
    PROC_INST_ID_ varchar(64),
    PROC_DEF_ID_ varchar(64),
    TASK_DEF_ID_ varchar(64),
    SCOPE_ID_ varchar(191),
    SUB_SCOPE_ID_ varchar(191),
    SCOPE_TYPE_ varchar(191),
    SCOPE_DEFINITION_ID_ varchar(191),
    NAME_ varchar(191),
    PARENT_TASK_ID_ varchar(64),
    DESCRIPTION_ varchar(4000),
    TASK_DEF_KEY_ varchar(191),
    OWNER_ varchar(191),
    ASSIGNEE_ varchar(191),
    DELEGATION_ varchar(64),
    PRIORITY_ integer,
    CREATE_TIME_ timestamp,
    DUE_DATE_ timestamp,
    CATEGORY_ varchar(191),
    SUSPENSION_STATE_ integer,
    TENANT_ID_ varchar(191) default '',
    FORM_KEY_ varchar(191),
    CLAIM_TIME_ timestamp,
    IS_COUNT_ENABLED_ bit,
    VAR_COUNT_ integer, 
    ID_LINK_COUNT_ integer,
    SUB_TASK_COUNT_ integer,
    primary key (ID_)
);

create index ACT_IDX_TASK_CREATE on ACT_RU_TASK(CREATE_TIME_);
create index ACT_IDX_TASK_SCOPE on ACT_RU_TASK(SCOPE_ID_, SCOPE_TYPE_);
create index ACT_IDX_TASK_SUB_SCOPE on ACT_RU_TASK(SUB_SCOPE_ID_, SCOPE_TYPE_);
create index ACT_IDX_TASK_SCOPE_DEF on ACT_RU_TASK(SCOPE_DEFINITION_ID_, SCOPE_TYPE_);

insert into ACT_GE_PROPERTY values ('task.schema.version', '6.3.1.0', 1);
create table ACT_RU_VARIABLE (
    ID_ varchar(64) not null,
    REV_ integer,
    TYPE_ varchar(191) not null,
    NAME_ varchar(191) not null,
    EXECUTION_ID_ varchar(64),
    PROC_INST_ID_ varchar(64),
    TASK_ID_ varchar(64),
    SCOPE_ID_ varchar(191),
    SUB_SCOPE_ID_ varchar(191),
    SCOPE_TYPE_ varchar(191),
    BYTEARRAY_ID_ varchar(64),
    DOUBLE_ double,
    LONG_ bigint,
    TEXT_ varchar(4000),
    TEXT2_ varchar(4000),
    primary key (ID_)
);

create index ACT_IDX_RU_VAR_SCOPE_ID_TYPE on ACT_RU_VARIABLE(SCOPE_ID_, SCOPE_TYPE_);
create index ACT_IDX_RU_VAR_SUB_ID_TYPE on ACT_RU_VARIABLE(SUB_SCOPE_ID_, SCOPE_TYPE_);

alter table ACT_RU_VARIABLE
    add constraint ACT_FK_VAR_BYTEARRAY
    foreign key (BYTEARRAY_ID_)
    references ACT_GE_BYTEARRAY;

insert into ACT_GE_PROPERTY values ('variable.schema.version', '6.3.1.0', 1);
create table ACT_RU_JOB (
    ID_ varchar(64) NOT NULL,
    REV_ integer,
    TYPE_ varchar(191) NOT NULL,
    LOCK_EXP_TIME_ timestamp,
    LOCK_OWNER_ varchar(191),
    EXCLUSIVE_ boolean,
    EXECUTION_ID_ varchar(64),
    PROCESS_INSTANCE_ID_ varchar(64),
    PROC_DEF_ID_ varchar(64),
    SCOPE_ID_ varchar(191),
    SUB_SCOPE_ID_ varchar(191),
    SCOPE_TYPE_ varchar(191),
    SCOPE_DEFINITION_ID_ varchar(191),
    RETRIES_ integer,
    EXCEPTION_STACK_ID_ varchar(64),
    EXCEPTION_MSG_ varchar(4000),
    DUEDATE_ timestamp,
    REPEAT_ varchar(191),
    HANDLER_TYPE_ varchar(191),
    HANDLER_CFG_ varchar(4000),
    CUSTOM_VALUES_ID_ varchar(64),
    CREATE_TIME_ timestamp,
    TENANT_ID_ varchar(191) default '',
    primary key (ID_)
);

create table ACT_RU_TIMER_JOB (
    ID_ varchar(64) NOT NULL,
    REV_ integer,
    TYPE_ varchar(191) NOT NULL,
    LOCK_EXP_TIME_ timestamp,
    LOCK_OWNER_ varchar(191),
    EXCLUSIVE_ boolean,
    EXECUTION_ID_ varchar(64),
    PROCESS_INSTANCE_ID_ varchar(64),
    PROC_DEF_ID_ varchar(64),
    SCOPE_ID_ varchar(191),
    SUB_SCOPE_ID_ varchar(191),
    SCOPE_TYPE_ varchar(191),
    SCOPE_DEFINITION_ID_ varchar(191),
    RETRIES_ integer,
    EXCEPTION_STACK_ID_ varchar(64),
    EXCEPTION_MSG_ varchar(4000),
    DUEDATE_ timestamp,
    REPEAT_ varchar(191),
    HANDLER_TYPE_ varchar(191),
    HANDLER_CFG_ varchar(4000),
    CUSTOM_VALUES_ID_ varchar(64),
    CREATE_TIME_ timestamp,
    TENANT_ID_ varchar(191) default '',
    primary key (ID_)
);

create table ACT_RU_SUSPENDED_JOB (
    ID_ varchar(64) NOT NULL,
    REV_ integer,
    TYPE_ varchar(191) NOT NULL,
    EXCLUSIVE_ boolean,
    EXECUTION_ID_ varchar(64),
    PROCESS_INSTANCE_ID_ varchar(64),
    PROC_DEF_ID_ varchar(64),
    SCOPE_ID_ varchar(191),
    SUB_SCOPE_ID_ varchar(191),
    SCOPE_TYPE_ varchar(191),
    SCOPE_DEFINITION_ID_ varchar(191),
    RETRIES_ integer,
    EXCEPTION_STACK_ID_ varchar(64),
    EXCEPTION_MSG_ varchar(4000),
    DUEDATE_ timestamp,
    REPEAT_ varchar(191),
    HANDLER_TYPE_ varchar(191),
    HANDLER_CFG_ varchar(4000),
    CUSTOM_VALUES_ID_ varchar(64),
    CREATE_TIME_ timestamp,
    TENANT_ID_ varchar(191) default '',
    primary key (ID_)
);

create table ACT_RU_DEADLETTER_JOB (
    ID_ varchar(64) NOT NULL,
    REV_ integer,
    TYPE_ varchar(191) NOT NULL,
    EXCLUSIVE_ boolean,
    EXECUTION_ID_ varchar(64),
    PROCESS_INSTANCE_ID_ varchar(64),
    PROC_DEF_ID_ varchar(64),
    SCOPE_ID_ varchar(191),
    SUB_SCOPE_ID_ varchar(191),
    SCOPE_TYPE_ varchar(191),
    SCOPE_DEFINITION_ID_ varchar(191),
    EXCEPTION_STACK_ID_ varchar(64),
    EXCEPTION_MSG_ varchar(4000),
    DUEDATE_ timestamp,
    REPEAT_ varchar(191),
    HANDLER_TYPE_ varchar(191),
    HANDLER_CFG_ varchar(4000),
    CUSTOM_VALUES_ID_ varchar(64),
    CREATE_TIME_ timestamp,
    TENANT_ID_ varchar(191) default '',
    primary key (ID_)
);

create table ACT_RU_HISTORY_JOB (
    ID_ varchar(64) NOT NULL,
    REV_ integer,
    LOCK_EXP_TIME_ timestamp,
    LOCK_OWNER_ varchar(191),
    RETRIES_ integer,
    EXCEPTION_STACK_ID_ varchar(64),
    EXCEPTION_MSG_ varchar(4000),
    HANDLER_TYPE_ varchar(191),
    HANDLER_CFG_ varchar(4000),
    CUSTOM_VALUES_ID_ varchar(64),
    ADV_HANDLER_CFG_ID_ varchar(64),
    CREATE_TIME_ timestamp,
    SCOPE_TYPE_ varchar(191),
    TENANT_ID_ varchar(191) default '',
    primary key (ID_)
);

create index ACT_IDX_JOB_EXCEPTION_STACK_ID on ACT_RU_JOB(EXCEPTION_STACK_ID_);
create index ACT_IDX_JOB_CUSTOM_VALUES_ID on ACT_RU_JOB(CUSTOM_VALUES_ID_);

create index ACT_IDX_TIMER_JOB_EXCEPTION_STACK_ID on ACT_RU_TIMER_JOB(EXCEPTION_STACK_ID_);
create index ACT_IDX_TIMER_JOB_CUSTOM_VALUES_ID on ACT_RU_TIMER_JOB(CUSTOM_VALUES_ID_);

create index ACT_IDX_SUSPENDED_JOB_EXCEPTION_STACK_ID on ACT_RU_SUSPENDED_JOB(EXCEPTION_STACK_ID_);
create index ACT_IDX_SUSPENDED_JOB_CUSTOM_VALUES_ID on ACT_RU_SUSPENDED_JOB(CUSTOM_VALUES_ID_);

create index ACT_IDX_DEADLETTER_JOB_EXCEPTION_STACK_ID on ACT_RU_DEADLETTER_JOB(EXCEPTION_STACK_ID_);
create index ACT_IDX_DEADLETTER_JOB_CUSTOM_VALUES_ID on ACT_RU_DEADLETTER_JOB(CUSTOM_VALUES_ID_);

alter table ACT_RU_JOB
    add constraint ACT_FK_JOB_EXCEPTION
    foreign key (EXCEPTION_STACK_ID_)
    references ACT_GE_BYTEARRAY (ID_);

alter table ACT_RU_JOB
    add constraint ACT_FK_JOB_CUSTOM_VALUES
    foreign key (CUSTOM_VALUES_ID_)
    references ACT_GE_BYTEARRAY (ID_);

alter table ACT_RU_TIMER_JOB
    add constraint ACT_FK_TIMER_JOB_EXCEPTION
    foreign key (EXCEPTION_STACK_ID_)
    references ACT_GE_BYTEARRAY (ID_);

alter table ACT_RU_TIMER_JOB
    add constraint ACT_FK_TIMER_JOB_CUSTOM_VALUES
    foreign key (CUSTOM_VALUES_ID_)
    references ACT_GE_BYTEARRAY (ID_);

alter table ACT_RU_SUSPENDED_JOB
    add constraint ACT_FK_SUSPENDED_JOB_EXCEPTION
    foreign key (EXCEPTION_STACK_ID_)
    references ACT_GE_BYTEARRAY (ID_);

alter table ACT_RU_SUSPENDED_JOB
    add constraint ACT_FK_SUSPENDED_JOB_CUSTOM_VALUES
    foreign key (CUSTOM_VALUES_ID_)
    references ACT_GE_BYTEARRAY (ID_);

alter table ACT_RU_DEADLETTER_JOB
    add constraint ACT_FK_DEADLETTER_JOB_EXCEPTION
    foreign key (EXCEPTION_STACK_ID_)
    references ACT_GE_BYTEARRAY (ID_);

alter table ACT_RU_DEADLETTER_JOB
    add constraint ACT_FK_DEADLETTER_JOB_CUSTOM_VALUES
    foreign key (CUSTOM_VALUES_ID_)
    references ACT_GE_BYTEARRAY (ID_);

create index ACT_IDX_JOB_SCOPE on ACT_RU_JOB(SCOPE_ID_, SCOPE_TYPE_);
create index ACT_IDX_JOB_SUB_SCOPE on ACT_RU_JOB(SUB_SCOPE_ID_, SCOPE_TYPE_);
create index ACT_IDX_JOB_SCOPE_DEF on ACT_RU_JOB(SCOPE_DEFINITION_ID_, SCOPE_TYPE_);

create index ACT_IDX_TJOB_SCOPE on ACT_RU_TIMER_JOB(SCOPE_ID_, SCOPE_TYPE_);
create index ACT_IDX_TJOB_SUB_SCOPE on ACT_RU_TIMER_JOB(SUB_SCOPE_ID_, SCOPE_TYPE_);
create index ACT_IDX_TJOB_SCOPE_DEF on ACT_RU_TIMER_JOB(SCOPE_DEFINITION_ID_, SCOPE_TYPE_); 

create index ACT_IDX_SJOB_SCOPE on ACT_RU_SUSPENDED_JOB(SCOPE_ID_, SCOPE_TYPE_);
create index ACT_IDX_SJOB_SUB_SCOPE on ACT_RU_SUSPENDED_JOB(SUB_SCOPE_ID_, SCOPE_TYPE_);
create index ACT_IDX_SJOB_SCOPE_DEF on ACT_RU_SUSPENDED_JOB(SCOPE_DEFINITION_ID_, SCOPE_TYPE_);   

create index ACT_IDX_DJOB_SCOPE on ACT_RU_DEADLETTER_JOB(SCOPE_ID_, SCOPE_TYPE_);
create index ACT_IDX_DJOB_SUB_SCOPE on ACT_RU_DEADLETTER_JOB(SUB_SCOPE_ID_, SCOPE_TYPE_);
create index ACT_IDX_DJOB_SCOPE_DEF on ACT_RU_DEADLETTER_JOB(SCOPE_DEFINITION_ID_, SCOPE_TYPE_);

insert into ACT_GE_PROPERTY values ('job.schema.version', '6.3.1.0', 1);
create table ACT_RE_DEPLOYMENT (
    ID_ varchar(64),
    NAME_ varchar(191),
    CATEGORY_ varchar(191),
    KEY_ varchar(191),
    TENANT_ID_ varchar(191) default '',
    DEPLOY_TIME_ timestamp,
    DERIVED_FROM_ varchar(64),
    DERIVED_FROM_ROOT_ varchar(64),
    PARENT_DEPLOYMENT_ID_ varchar(191),
    ENGINE_VERSION_ varchar(191),
    primary key (ID_)
);

create table ACT_RE_MODEL (
    ID_ varchar(64) not null,
    REV_ integer,
    NAME_ varchar(191),
    KEY_ varchar(191),
    CATEGORY_ varchar(191),
    CREATE_TIME_ timestamp,
    LAST_UPDATE_TIME_ timestamp,
    VERSION_ integer,
    META_INFO_ varchar(4000),
    DEPLOYMENT_ID_ varchar(64),
    EDITOR_SOURCE_VALUE_ID_ varchar(64),
    EDITOR_SOURCE_EXTRA_VALUE_ID_ varchar(64),
    TENANT_ID_ varchar(191) default '',
    primary key (ID_)
);

create table ACT_RU_EXECUTION (
    ID_ varchar(64),
    REV_ integer,
    PROC_INST_ID_ varchar(64),
    BUSINESS_KEY_ varchar(191),
    PARENT_ID_ varchar(64),
    PROC_DEF_ID_ varchar(64),
    SUPER_EXEC_ varchar(64),
    ROOT_PROC_INST_ID_ varchar(64),
    ACT_ID_ varchar(191),
    IS_ACTIVE_ bit,
    IS_CONCURRENT_ bit,
    IS_SCOPE_ bit,
    IS_EVENT_SCOPE_ bit,
    IS_MI_ROOT_ bit,
    SUSPENSION_STATE_ integer,
    CACHED_ENT_STATE_ integer,
    TENANT_ID_ varchar(191) default '',
    NAME_ varchar(191),
    START_ACT_ID_ varchar(191),
    START_TIME_ timestamp,
    START_USER_ID_ varchar(191),
    LOCK_TIME_ timestamp,
    IS_COUNT_ENABLED_ bit,
    EVT_SUBSCR_COUNT_ integer, 
    TASK_COUNT_ integer, 
    JOB_COUNT_ integer, 
    TIMER_JOB_COUNT_ integer,
    SUSP_JOB_COUNT_ integer,
    DEADLETTER_JOB_COUNT_ integer,
    VAR_COUNT_ integer, 
    ID_LINK_COUNT_ integer,
    CALLBACK_ID_ varchar(191),
    CALLBACK_TYPE_ varchar(191),
    primary key (ID_)
);

create table ACT_RE_PROCDEF (
    ID_ varchar(64) NOT NULL,
    REV_ integer,
    CATEGORY_ varchar(191),
    NAME_ varchar(191),
    KEY_ varchar(191) NOT NULL,
    VERSION_ integer NOT NULL,
    DEPLOYMENT_ID_ varchar(64),
    RESOURCE_NAME_ varchar(4000),
    DGRM_RESOURCE_NAME_ varchar(4000),
    DESCRIPTION_ varchar(4000),
    HAS_START_FORM_KEY_ bit,
    HAS_GRAPHICAL_NOTATION_ bit,
    SUSPENSION_STATE_ integer,
    TENANT_ID_ varchar(191) default '',
    DERIVED_FROM_ varchar(64),
    DERIVED_FROM_ROOT_ varchar(64),
    DERIVED_VERSION_ integer NOT NULL default 0,
    ENGINE_VERSION_ varchar(191),
    primary key (ID_)
);

create table ACT_RU_EVENT_SUBSCR (
    ID_ varchar(64) not null,
    REV_ integer,
    EVENT_TYPE_ varchar(191) not null,
    EVENT_NAME_ varchar(191),
    EXECUTION_ID_ varchar(64),
    PROC_INST_ID_ varchar(64),
    ACTIVITY_ID_ varchar(64),
    CONFIGURATION_ varchar(191),
    CREATED_ timestamp not null,
    PROC_DEF_ID_ varchar(64),
    TENANT_ID_ varchar(191) default '',
    primary key (ID_)
);

create table ACT_EVT_LOG (
    LOG_NR_ identity,
    TYPE_ varchar(64),
    PROC_DEF_ID_ varchar(64),
    PROC_INST_ID_ varchar(64),
    EXECUTION_ID_ varchar(64),
    TASK_ID_ varchar(64),
    TIME_STAMP_ timestamp not null,
    USER_ID_ varchar(191),
    DATA_ longvarbinary,
    LOCK_OWNER_ varchar(191),
    LOCK_TIME_ timestamp,
    IS_PROCESSED_ bit default 0
);

create table ACT_PROCDEF_INFO (
	ID_ varchar(64) not null,
    PROC_DEF_ID_ varchar(64) not null,
    REV_ integer,
    INFO_JSON_ID_ varchar(64),
    primary key (ID_)
);

create index ACT_IDX_EXEC_BUSKEY on ACT_RU_EXECUTION(BUSINESS_KEY_);
create index ACT_IDC_EXEC_ROOT on ACT_RU_EXECUTION(ROOT_PROC_INST_ID_);
create index ACT_IDX_EVENT_SUBSCR_CONFIG_ on ACT_RU_EVENT_SUBSCR(CONFIGURATION_);
create index ACT_IDX_VARIABLE_TASK_ID on ACT_RU_VARIABLE(TASK_ID_);
create index ACT_IDX_ATHRZ_PROCEDEF on ACT_RU_IDENTITYLINK(PROC_DEF_ID_);
create index ACT_IDX_INFO_PROCDEF on ACT_PROCDEF_INFO(PROC_DEF_ID_);

alter table ACT_GE_BYTEARRAY
    add constraint ACT_FK_BYTEARR_DEPL
    foreign key (DEPLOYMENT_ID_)
    references ACT_RE_DEPLOYMENT;

alter table ACT_RE_PROCDEF
    add constraint ACT_UNIQ_PROCDEF
    unique (KEY_,VERSION_, DERIVED_VERSION_, TENANT_ID_);
    
alter table ACT_RU_EXECUTION
    add constraint ACT_FK_EXE_PROCINST
    foreign key (PROC_INST_ID_)
    references ACT_RU_EXECUTION;

alter table ACT_RU_EXECUTION
    add constraint ACT_FK_EXE_PARENT
    foreign key (PARENT_ID_)
    references ACT_RU_EXECUTION;
    
alter table ACT_RU_EXECUTION
    add constraint ACT_FK_EXE_SUPER 
    foreign key (SUPER_EXEC_) 
    references ACT_RU_EXECUTION;
    
alter table ACT_RU_EXECUTION
    add constraint ACT_FK_EXE_PROCDEF 
    foreign key (PROC_DEF_ID_) 
    references ACT_RE_PROCDEF (ID_);    
    
alter table ACT_RU_IDENTITYLINK
    add constraint ACT_FK_TSKASS_TASK
    foreign key (TASK_ID_)
    references ACT_RU_TASK;

alter table ACT_RU_IDENTITYLINK
    add constraint ACT_FK_ATHRZ_PROCEDEF
    foreign key (PROC_DEF_ID_)
    references ACT_RE_PROCDEF;
    
alter table ACT_RU_IDENTITYLINK
    add constraint ACT_FK_IDL_PROCINST
    foreign key (PROC_INST_ID_) 
    references ACT_RU_EXECUTION (ID_);       

alter table ACT_RU_TASK
    add constraint ACT_FK_TASK_EXE
    foreign key (EXECUTION_ID_)
    references ACT_RU_EXECUTION;

alter table ACT_RU_TASK
    add constraint ACT_FK_TASK_PROCINST
    foreign key (PROC_INST_ID_)
    references ACT_RU_EXECUTION;

alter table ACT_RU_TASK
  add constraint ACT_FK_TASK_PROCDEF
  foreign key (PROC_DEF_ID_)
  references ACT_RE_PROCDEF;

alter table ACT_RU_VARIABLE
    add constraint ACT_FK_VAR_EXE
    foreign key (EXECUTION_ID_)
    references ACT_RU_EXECUTION;

alter table ACT_RU_VARIABLE
    add constraint ACT_FK_VAR_PROCINST
    foreign key (PROC_INST_ID_)
    references ACT_RU_EXECUTION;

alter table ACT_RU_JOB
    add constraint ACT_FK_JOB_EXECUTION
    foreign key (EXECUTION_ID_)
    references ACT_RU_EXECUTION;
    
alter table ACT_RU_JOB
    add constraint ACT_FK_JOB_PROCESS_INSTANCE
    foreign key (PROCESS_INSTANCE_ID_)
    references ACT_RU_EXECUTION;
    
alter table ACT_RU_JOB
    add constraint ACT_FK_JOB_PROC_DEF
    foreign key (PROC_DEF_ID_)
    references ACT_RE_PROCDEF;
    
alter table ACT_RU_TIMER_JOB
    add constraint ACT_FK_TIMER_JOB_EXECUTION
    foreign key (EXECUTION_ID_)
    references ACT_RU_EXECUTION;
    
alter table ACT_RU_TIMER_JOB
    add constraint ACT_FK_TIMER_JOB_PROCESS_INSTANCE
    foreign key (PROCESS_INSTANCE_ID_)
    references ACT_RU_EXECUTION;
    
alter table ACT_RU_TIMER_JOB
    add constraint ACT_FK_TIMER_JOB_PROC_DEF
    foreign key (PROC_DEF_ID_)
    references ACT_RE_PROCDEF;    
    
alter table ACT_RU_SUSPENDED_JOB
    add constraint ACT_FK_SUSPENDED_JOB_EXECUTION
    foreign key (EXECUTION_ID_)
    references ACT_RU_EXECUTION;
    
alter table ACT_RU_SUSPENDED_JOB
    add constraint ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE
    foreign key (PROCESS_INSTANCE_ID_)
    references ACT_RU_EXECUTION;
    
alter table ACT_RU_SUSPENDED_JOB
    add constraint ACT_FK_SUSPENDED_JOB_PROC_DEF
    foreign key (PROC_DEF_ID_)
    references ACT_RE_PROCDEF;
    
alter table ACT_RU_DEADLETTER_JOB
    add constraint ACT_FK_DEADLETTER_JOB_EXECUTION
    foreign key (EXECUTION_ID_)
    references ACT_RU_EXECUTION;
    
alter table ACT_RU_DEADLETTER_JOB
    add constraint ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE
    foreign key (PROCESS_INSTANCE_ID_)
    references ACT_RU_EXECUTION;
    
alter table ACT_RU_DEADLETTER_JOB
    add constraint ACT_FK_DEADLETTER_JOB_PROC_DEF
    foreign key (PROC_DEF_ID_)
    references ACT_RE_PROCDEF;

alter table ACT_RU_EVENT_SUBSCR
    add constraint ACT_FK_EVENT_EXEC
    foreign key (EXECUTION_ID_)
    references ACT_RU_EXECUTION;

alter table ACT_RE_MODEL 
    add constraint ACT_FK_MODEL_SOURCE 
    foreign key (EDITOR_SOURCE_VALUE_ID_) 
    references ACT_GE_BYTEARRAY (ID_);

alter table ACT_RE_MODEL 
    add constraint ACT_FK_MODEL_SOURCE_EXTRA 
    foreign key (EDITOR_SOURCE_EXTRA_VALUE_ID_) 
    references ACT_GE_BYTEARRAY (ID_);
    
alter table ACT_RE_MODEL 
    add constraint ACT_FK_MODEL_DEPLOYMENT 
    foreign key (DEPLOYMENT_ID_) 
    references ACT_RE_DEPLOYMENT (ID_);        

alter table ACT_PROCDEF_INFO 
    add constraint ACT_FK_INFO_JSON_BA 
    foreign key (INFO_JSON_ID_) 
    references ACT_GE_BYTEARRAY (ID_);

alter table ACT_PROCDEF_INFO 
    add constraint ACT_FK_INFO_PROCDEF 
    foreign key (PROC_DEF_ID_) 
    references ACT_RE_PROCDEF (ID_);
    
alter table ACT_PROCDEF_INFO
    add constraint ACT_UNIQ_INFO_PROCDEF
    unique (PROC_DEF_ID_);
    
insert into ACT_GE_PROPERTY
values ('schema.version', '6.3.1.0', 1);

insert into ACT_GE_PROPERTY
values ('schema.history', 'create(6.3.1.0)', 1);   

create table ACT_HI_IDENTITYLINK (
    ID_ varchar(64),
    GROUP_ID_ varchar(191),
    TYPE_ varchar(191),
    USER_ID_ varchar(191),
    TASK_ID_ varchar(64),
    CREATE_TIME_ timestamp,
    PROC_INST_ID_ varchar(64) null,
    SCOPE_ID_ varchar(191),
    SCOPE_TYPE_ varchar(191),
    SCOPE_DEFINITION_ID_ varchar(191),
    primary key (ID_)
);

create index ACT_IDX_HI_IDENT_LNK_USER on ACT_HI_IDENTITYLINK(USER_ID_);
create index ACT_IDX_HI_IDENT_LNK_SCOPE on ACT_HI_IDENTITYLINK(SCOPE_ID_, SCOPE_TYPE_);
create index ACT_IDX_HI_IDENT_LNK_SCOPE_DEF on ACT_HI_IDENTITYLINK(SCOPE_DEFINITION_ID_, SCOPE_TYPE_);

create table ACT_HI_TASKINST (
    ID_ varchar(64) not null,
    REV_ integer default 1,
    PROC_DEF_ID_ varchar(64),
    TASK_DEF_ID_ varchar(64),
    TASK_DEF_KEY_ varchar(191),
    PROC_INST_ID_ varchar(64),
    EXECUTION_ID_ varchar(64),
    SCOPE_ID_ varchar(191),
    SUB_SCOPE_ID_ varchar(191),
    SCOPE_TYPE_ varchar(191),
    SCOPE_DEFINITION_ID_ varchar(191),
    NAME_ varchar(191),
    PARENT_TASK_ID_ varchar(64),
    DESCRIPTION_ varchar(4000),
    OWNER_ varchar(191),
    ASSIGNEE_ varchar(191),
    START_TIME_ timestamp not null,
    CLAIM_TIME_ timestamp,
    END_TIME_ timestamp,
    DURATION_ bigint,
    DELETE_REASON_ varchar(4000),
    PRIORITY_ integer,
    DUE_DATE_ timestamp,
    FORM_KEY_ varchar(191),
    CATEGORY_ varchar(191),
    TENANT_ID_ varchar(191) default '',
    LAST_UPDATED_TIME_ timestamp,
    primary key (ID_)
);

create index ACT_IDX_HI_TASK_SCOPE on ACT_HI_TASKINST(SCOPE_ID_, SCOPE_TYPE_);
create index ACT_IDX_HI_TASK_SUB_SCOPE on ACT_HI_TASKINST(SUB_SCOPE_ID_, SCOPE_TYPE_);
create index ACT_IDX_HI_TASK_SCOPE_DEF on ACT_HI_TASKINST(SCOPE_DEFINITION_ID_, SCOPE_TYPE_);

create table ACT_HI_VARINST (
    ID_ varchar(64) not null,
    REV_ integer default 1,
    PROC_INST_ID_ varchar(64),
    EXECUTION_ID_ varchar(64),
    TASK_ID_ varchar(64),
    NAME_ varchar(191) not null,
    VAR_TYPE_ varchar(100),
    SCOPE_ID_ varchar(191),
    SUB_SCOPE_ID_ varchar(191),
    SCOPE_TYPE_ varchar(191),
    BYTEARRAY_ID_ varchar(64),
    DOUBLE_ double,
    LONG_ bigint,
    TEXT_ varchar(4000),
    TEXT2_ varchar(4000),
    CREATE_TIME_ timestamp,
    LAST_UPDATED_TIME_ timestamp,
    primary key (ID_)
);

create index ACT_IDX_HI_PROCVAR_NAME_TYPE on ACT_HI_VARINST(NAME_, VAR_TYPE_);
create index ACT_IDX_HI_VAR_SCOPE_ID_TYPE on ACT_HI_VARINST(SCOPE_ID_, SCOPE_TYPE_);
create index ACT_IDX_HI_VAR_SUB_ID_TYPE on ACT_HI_VARINST(SUB_SCOPE_ID_, SCOPE_TYPE_);

create table ACT_HI_PROCINST (
    ID_ varchar(64) not null,
    REV_ integer default 1,
    PROC_INST_ID_ varchar(64) not null,
    BUSINESS_KEY_ varchar(191),
    PROC_DEF_ID_ varchar(64) not null,
    START_TIME_ timestamp not null,
    END_TIME_ timestamp,
    DURATION_ bigint,
    START_USER_ID_ varchar(191),
    START_ACT_ID_ varchar(191),
    END_ACT_ID_ varchar(191),
    SUPER_PROCESS_INSTANCE_ID_ varchar(64),
    DELETE_REASON_ varchar(4000),
    TENANT_ID_ varchar(191) default '',
    NAME_ varchar(191),
    CALLBACK_ID_ varchar(191),
    CALLBACK_TYPE_ varchar(191),
    primary key (ID_),
    unique (PROC_INST_ID_)
);

create table ACT_HI_ACTINST (
    ID_ varchar(64) not null,
    REV_ integer default 1,
    PROC_DEF_ID_ varchar(64) not null,
    PROC_INST_ID_ varchar(64) not null,
    EXECUTION_ID_ varchar(64) not null,
    ACT_ID_ varchar(191) not null,
    TASK_ID_ varchar(64),
    CALL_PROC_INST_ID_ varchar(64),
    ACT_NAME_ varchar(191),
    ACT_TYPE_ varchar(191) not null,
    ASSIGNEE_ varchar(191),
    START_TIME_ timestamp not null,
    END_TIME_ timestamp,
    DURATION_ bigint,
    DELETE_REASON_ varchar(4000),
    TENANT_ID_ varchar(191) default '',
    primary key (ID_)
);

create table ACT_HI_DETAIL (
    ID_ varchar(64) not null,
    TYPE_ varchar(191) not null,
    TIME_ timestamp not null,
    NAME_ varchar(191),
    PROC_INST_ID_ varchar(64),
    EXECUTION_ID_ varchar(64),
    TASK_ID_ varchar(64),
    ACT_INST_ID_ varchar(64),
    VAR_TYPE_ varchar(191),
    REV_ integer,
    BYTEARRAY_ID_ varchar(64),
    DOUBLE_ double,
    LONG_ bigint,
    TEXT_ varchar(4000),
    TEXT2_ varchar(4000),
    primary key (ID_)
);

create table ACT_HI_COMMENT (
    ID_ varchar(64) not null,
    TYPE_ varchar(191),
    TIME_ timestamp not null,
    USER_ID_ varchar(191),
    TASK_ID_ varchar(64),
    PROC_INST_ID_ varchar(64),
    ACTION_ varchar(191),
    MESSAGE_ varchar(4000),
    FULL_MSG_ longvarbinary,
    primary key (ID_)
);

create table ACT_HI_ATTACHMENT (
    ID_ varchar(64) not null,
    REV_ integer,
    USER_ID_ varchar(191),
    NAME_ varchar(191),
    DESCRIPTION_ varchar(4000),
    TYPE_ varchar(191),
    TASK_ID_ varchar(64),
    PROC_INST_ID_ varchar(64),
    URL_ varchar(4000),
    CONTENT_ID_ varchar(64),
    TIME_ timestamp,
    primary key (ID_)
);

create index ACT_IDX_HI_PRO_INST_END on ACT_HI_PROCINST(END_TIME_);
create index ACT_IDX_HI_PRO_I_BUSKEY on ACT_HI_PROCINST(BUSINESS_KEY_);
create index ACT_IDX_HI_ACT_INST_START on ACT_HI_ACTINST(START_TIME_);
create index ACT_IDX_HI_ACT_INST_END on ACT_HI_ACTINST(END_TIME_);
create index ACT_IDX_HI_DETAIL_PROC_INST on ACT_HI_DETAIL(PROC_INST_ID_);
create index ACT_IDX_HI_DETAIL_ACT_INST on ACT_HI_DETAIL(ACT_INST_ID_);
create index ACT_IDX_HI_DETAIL_TIME on ACT_HI_DETAIL(TIME_);
create index ACT_IDX_HI_DETAIL_NAME on ACT_HI_DETAIL(NAME_);
create index ACT_IDX_HI_DETAIL_TASK_ID on ACT_HI_DETAIL(TASK_ID_);
create index ACT_IDX_HI_PROCVAR_PROC_INST on ACT_HI_VARINST(PROC_INST_ID_);
create index ACT_IDX_HI_PROCVAR_TASK_ID on ACT_HI_VARINST(TASK_ID_);
create index ACT_IDX_HI_PROCVAR_EXE on ACT_HI_VARINST(EXECUTION_ID_);
create index ACT_IDX_HI_ACT_INST_PROCINST on ACT_HI_ACTINST(PROC_INST_ID_, ACT_ID_);
create index ACT_IDX_HI_IDENT_LNK_TASK on ACT_HI_IDENTITYLINK(TASK_ID_);
create index ACT_IDX_HI_IDENT_LNK_PROCINST on ACT_HI_IDENTITYLINK(PROC_INST_ID_);

create index ACT_IDX_HI_ACT_INST_EXEC on ACT_HI_ACTINST(EXECUTION_ID_, ACT_ID_);    
create index ACT_IDX_HI_TASK_INST_PROCINST on ACT_HI_TASKINST(PROC_INST_ID_);


CREATE TABLE PUBLIC.ACT_CMMN_DATABASECHANGELOG (ID varchar(191) NOT NULL, AUTHOR varchar(191) NOT NULL, FILENAME varchar(191) NOT NULL, DATEEXECUTED TIMESTAMP NOT NULL, ORDEREXECUTED INT NOT NULL, EXECTYPE VARCHAR(10) NOT NULL, MD5SUM VARCHAR(35), DESCRIPTION varchar(191), COMMENTS varchar(191), TAG varchar(191), LIQUIBASE VARCHAR(20), CONTEXTS varchar(191), LABELS varchar(191), DEPLOYMENT_ID VARCHAR(10));

CREATE TABLE PUBLIC.ACT_CMMN_DEPLOYMENT (ID_ varchar(191) NOT NULL, NAME_ varchar(191), CATEGORY_ varchar(191), KEY_ varchar(191), DEPLOY_TIME_ TIMESTAMP, PARENT_DEPLOYMENT_ID_ varchar(191), TENANT_ID_ varchar(191) DEFAULT '', CONSTRAINT PK_ACT_CMMN_DEPLOYMENT PRIMARY KEY (ID_));

CREATE TABLE PUBLIC.ACT_CMMN_DEPLOYMENT_RESOURCE (ID_ varchar(191) NOT NULL, NAME_ varchar(191), DEPLOYMENT_ID_ varchar(191), RESOURCE_BYTES_ BLOB, CONSTRAINT PK_CMMN_DEPLOYMENT_RESOURCE PRIMARY KEY (ID_));

ALTER TABLE PUBLIC.ACT_CMMN_DEPLOYMENT_RESOURCE ADD CONSTRAINT ACT_FK_CMMN_RSRC_DPL FOREIGN KEY (DEPLOYMENT_ID_) REFERENCES PUBLIC.ACT_CMMN_DEPLOYMENT (ID_);

CREATE INDEX PUBLIC.ACT_IDX_CMMN_RSRC_DPL ON PUBLIC.ACT_CMMN_DEPLOYMENT_RESOURCE(DEPLOYMENT_ID_);

CREATE TABLE PUBLIC.ACT_CMMN_CASEDEF (ID_ varchar(191) NOT NULL, REV_ INT NOT NULL, NAME_ varchar(191), KEY_ varchar(191) NOT NULL, VERSION_ INT NOT NULL, CATEGORY_ varchar(191), DEPLOYMENT_ID_ varchar(191), RESOURCE_NAME_ VARCHAR(4000), DESCRIPTION_ VARCHAR(4000), HAS_GRAPHICAL_NOTATION_ BOOLEAN, TENANT_ID_ varchar(191) DEFAULT '', CONSTRAINT PK_ACT_CMMN_CASEDEF PRIMARY KEY (ID_));

ALTER TABLE PUBLIC.ACT_CMMN_CASEDEF ADD CONSTRAINT ACT_FK_CASE_DEF_DPLY FOREIGN KEY (DEPLOYMENT_ID_) REFERENCES PUBLIC.ACT_CMMN_DEPLOYMENT (ID_);

CREATE INDEX PUBLIC.ACT_IDX_CASE_DEF_DPLY ON PUBLIC.ACT_CMMN_CASEDEF(DEPLOYMENT_ID_);

CREATE TABLE PUBLIC.ACT_CMMN_RU_CASE_INST (ID_ varchar(191) NOT NULL, REV_ INT NOT NULL, BUSINESS_KEY_ varchar(191), NAME_ varchar(191), PARENT_ID_ varchar(191), CASE_DEF_ID_ varchar(191), STATE_ varchar(191), START_TIME_ TIMESTAMP, START_USER_ID_ varchar(191), CALLBACK_ID_ varchar(191), CALLBACK_TYPE_ varchar(191), TENANT_ID_ varchar(191) DEFAULT '', CONSTRAINT PK_ACT_CMMN_RU_CASE_INST PRIMARY KEY (ID_));

ALTER TABLE PUBLIC.ACT_CMMN_RU_CASE_INST ADD CONSTRAINT ACT_FK_CASE_INST_CASE_DEF FOREIGN KEY (CASE_DEF_ID_) REFERENCES PUBLIC.ACT_CMMN_CASEDEF (ID_);

CREATE INDEX PUBLIC.ACT_IDX_CASE_INST_CASE_DEF ON PUBLIC.ACT_CMMN_RU_CASE_INST(CASE_DEF_ID_);

CREATE INDEX PUBLIC.ACT_IDX_CASE_INST_PARENT ON PUBLIC.ACT_CMMN_RU_CASE_INST(PARENT_ID_);

CREATE TABLE PUBLIC.ACT_CMMN_RU_PLAN_ITEM_INST (ID_ varchar(191) NOT NULL, REV_ INT NOT NULL, CASE_DEF_ID_ varchar(191), CASE_INST_ID_ varchar(191), STAGE_INST_ID_ varchar(191), IS_STAGE_ BOOLEAN, ELEMENT_ID_ varchar(191), NAME_ varchar(191), STATE_ varchar(191), START_TIME_ TIMESTAMP, START_USER_ID_ varchar(191), REFERENCE_ID_ varchar(191), REFERENCE_TYPE_ varchar(191), TENANT_ID_ varchar(191) DEFAULT '', CONSTRAINT PK_CMMN_PLAN_ITEM_INST PRIMARY KEY (ID_));

ALTER TABLE PUBLIC.ACT_CMMN_RU_PLAN_ITEM_INST ADD CONSTRAINT ACT_FK_PLAN_ITEM_CASE_DEF FOREIGN KEY (CASE_DEF_ID_) REFERENCES PUBLIC.ACT_CMMN_CASEDEF (ID_);

CREATE INDEX PUBLIC.ACT_IDX_PLAN_ITEM_CASE_DEF ON PUBLIC.ACT_CMMN_RU_PLAN_ITEM_INST(CASE_DEF_ID_);

ALTER TABLE PUBLIC.ACT_CMMN_RU_PLAN_ITEM_INST ADD CONSTRAINT ACT_FK_PLAN_ITEM_CASE_INST FOREIGN KEY (CASE_INST_ID_) REFERENCES PUBLIC.ACT_CMMN_RU_CASE_INST (ID_);

CREATE INDEX PUBLIC.ACT_IDX_PLAN_ITEM_CASE_INST ON PUBLIC.ACT_CMMN_RU_PLAN_ITEM_INST(CASE_INST_ID_);

CREATE TABLE PUBLIC.ACT_CMMN_RU_SENTRY_PART_INST (ID_ varchar(191) NOT NULL, REV_ INT NOT NULL, CASE_DEF_ID_ varchar(191), CASE_INST_ID_ varchar(191), PLAN_ITEM_INST_ID_ varchar(191), ON_PART_ID_ varchar(191), IF_PART_ID_ varchar(191), TIME_STAMP_ TIMESTAMP, CONSTRAINT PK_CMMN_SENTRY_PART_INST PRIMARY KEY (ID_));

ALTER TABLE PUBLIC.ACT_CMMN_RU_SENTRY_PART_INST ADD CONSTRAINT ACT_FK_SENTRY_CASE_DEF FOREIGN KEY (CASE_DEF_ID_) REFERENCES PUBLIC.ACT_CMMN_CASEDEF (ID_);

CREATE INDEX PUBLIC.ACT_IDX_SENTRY_CASE_DEF ON PUBLIC.ACT_CMMN_RU_SENTRY_PART_INST(CASE_DEF_ID_);

ALTER TABLE PUBLIC.ACT_CMMN_RU_SENTRY_PART_INST ADD CONSTRAINT ACT_FK_SENTRY_CASE_INST FOREIGN KEY (CASE_INST_ID_) REFERENCES PUBLIC.ACT_CMMN_RU_CASE_INST (ID_);

CREATE INDEX PUBLIC.ACT_IDX_SENTRY_CASE_INST ON PUBLIC.ACT_CMMN_RU_SENTRY_PART_INST(CASE_INST_ID_);

ALTER TABLE PUBLIC.ACT_CMMN_RU_SENTRY_PART_INST ADD CONSTRAINT ACT_FK_SENTRY_PLAN_ITEM FOREIGN KEY (PLAN_ITEM_INST_ID_) REFERENCES PUBLIC.ACT_CMMN_RU_PLAN_ITEM_INST (ID_);

CREATE INDEX PUBLIC.ACT_IDX_SENTRY_PLAN_ITEM ON PUBLIC.ACT_CMMN_RU_SENTRY_PART_INST(PLAN_ITEM_INST_ID_);

CREATE TABLE PUBLIC.ACT_CMMN_RU_MIL_INST (ID_ varchar(191) NOT NULL, NAME_ varchar(191) NOT NULL, TIME_STAMP_ TIMESTAMP NOT NULL, CASE_INST_ID_ varchar(191) NOT NULL, CASE_DEF_ID_ varchar(191) NOT NULL, ELEMENT_ID_ varchar(191) NOT NULL, CONSTRAINT PK_ACT_CMMN_RU_MIL_INST PRIMARY KEY (ID_));

ALTER TABLE PUBLIC.ACT_CMMN_RU_MIL_INST ADD CONSTRAINT ACT_FK_MIL_CASE_DEF FOREIGN KEY (CASE_DEF_ID_) REFERENCES PUBLIC.ACT_CMMN_CASEDEF (ID_);

CREATE INDEX PUBLIC.ACT_IDX_MIL_CASE_DEF ON PUBLIC.ACT_CMMN_RU_MIL_INST(CASE_DEF_ID_);

ALTER TABLE PUBLIC.ACT_CMMN_RU_MIL_INST ADD CONSTRAINT ACT_FK_MIL_CASE_INST FOREIGN KEY (CASE_INST_ID_) REFERENCES PUBLIC.ACT_CMMN_RU_CASE_INST (ID_);

CREATE INDEX PUBLIC.ACT_IDX_MIL_CASE_INST ON PUBLIC.ACT_CMMN_RU_MIL_INST(CASE_INST_ID_);

CREATE TABLE PUBLIC.ACT_CMMN_HI_CASE_INST (ID_ varchar(191) NOT NULL, REV_ INT NOT NULL, BUSINESS_KEY_ varchar(191), NAME_ varchar(191), PARENT_ID_ varchar(191), CASE_DEF_ID_ varchar(191), STATE_ varchar(191), START_TIME_ TIMESTAMP, END_TIME_ TIMESTAMP, START_USER_ID_ varchar(191), CALLBACK_ID_ varchar(191), CALLBACK_TYPE_ varchar(191), TENANT_ID_ varchar(191) DEFAULT '', CONSTRAINT PK_ACT_CMMN_HI_CASE_INST PRIMARY KEY (ID_));

CREATE TABLE PUBLIC.ACT_CMMN_HI_MIL_INST (ID_ varchar(191) NOT NULL, REV_ INT NOT NULL, NAME_ varchar(191) NOT NULL, TIME_STAMP_ TIMESTAMP NOT NULL, CASE_INST_ID_ varchar(191) NOT NULL, CASE_DEF_ID_ varchar(191) NOT NULL, ELEMENT_ID_ varchar(191) NOT NULL, CONSTRAINT PK_ACT_CMMN_HI_MIL_INST PRIMARY KEY (ID_));

INSERT INTO PUBLIC.ACT_CMMN_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', NOW(), 1, '8:8b4b922d90b05ff27483abefc9597aa6', 'createTable tableName=ACT_CMMN_DEPLOYMENT; createTable tableName=ACT_CMMN_DEPLOYMENT_RESOURCE; addForeignKeyConstraint baseTableName=ACT_CMMN_DEPLOYMENT_RESOURCE, constraintName=ACT_FK_CMMN_RSRC_DPL, referencedTableName=ACT_CMMN_DEPLOYMENT; create...', '', 'EXECUTED', NULL, NULL, '3.6.1', '6986083387');

ALTER TABLE PUBLIC.ACT_CMMN_CASEDEF ADD DGRM_RESOURCE_NAME_ VARCHAR(4000);

ALTER TABLE PUBLIC.ACT_CMMN_CASEDEF ADD HAS_START_FORM_KEY_ BOOLEAN;

ALTER TABLE PUBLIC.ACT_CMMN_DEPLOYMENT_RESOURCE ADD GENERATED_ BOOLEAN;

ALTER TABLE PUBLIC.ACT_CMMN_RU_CASE_INST ADD LOCK_TIME_ TIMESTAMP;

ALTER TABLE PUBLIC.ACT_CMMN_RU_PLAN_ITEM_INST ADD ITEM_DEFINITION_ID_ varchar(191);

ALTER TABLE PUBLIC.ACT_CMMN_RU_PLAN_ITEM_INST ADD ITEM_DEFINITION_TYPE_ varchar(191);

INSERT INTO PUBLIC.ACT_CMMN_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('2', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', NOW(), 3, '8:65e39b3d385706bb261cbeffe7533cbe', 'addColumn tableName=ACT_CMMN_CASEDEF; addColumn tableName=ACT_CMMN_DEPLOYMENT_RESOURCE; addColumn tableName=ACT_CMMN_RU_CASE_INST; addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST', '', 'EXECUTED', NULL, NULL, '3.6.1', '6986083387');

ALTER TABLE PUBLIC.ACT_CMMN_RU_PLAN_ITEM_INST ADD IS_COMPLETEABLE_ BOOLEAN;

ALTER TABLE PUBLIC.ACT_CMMN_RU_CASE_INST ADD IS_COMPLETEABLE_ BOOLEAN;

CREATE INDEX PUBLIC.ACT_IDX_PLAN_ITEM_STAGE_INST ON PUBLIC.ACT_CMMN_RU_PLAN_ITEM_INST(STAGE_INST_ID_);

ALTER TABLE PUBLIC.ACT_CMMN_RU_PLAN_ITEM_INST ADD IS_COUNT_ENABLED_ BOOLEAN;

ALTER TABLE PUBLIC.ACT_CMMN_RU_PLAN_ITEM_INST ADD VAR_COUNT_ INT;

ALTER TABLE PUBLIC.ACT_CMMN_RU_PLAN_ITEM_INST ADD SENTRY_PART_INST_COUNT_ INT;

INSERT INTO PUBLIC.ACT_CMMN_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('3', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', NOW(), 5, '8:c01f6e802b49436b4489040da3012359', 'addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_CASE_INST; createIndex indexName=ACT_IDX_PLAN_ITEM_STAGE_INST, tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableNam...', '', 'EXECUTED', NULL, NULL, '3.6.1', '6986083387');

CREATE TABLE PUBLIC.ACT_CMMN_HI_PLAN_ITEM_INST (ID_ varchar(191) NOT NULL, REV_ INT NOT NULL, NAME_ varchar(191), STATE_ varchar(191), CASE_DEF_ID_ varchar(191), CASE_INST_ID_ varchar(191), STAGE_INST_ID_ varchar(191), IS_STAGE_ BOOLEAN, ELEMENT_ID_ varchar(191), ITEM_DEFINITION_ID_ varchar(191), ITEM_DEFINITION_TYPE_ varchar(191), CREATED_TIME_ TIMESTAMP, LAST_AVAILABLE_TIME_ TIMESTAMP, LAST_ENABLED_TIME_ TIMESTAMP, LAST_DISABLED_TIME_ TIMESTAMP, LAST_STARTED_TIME_ TIMESTAMP, LAST_SUSPENDED_TIME_ TIMESTAMP, COMPLETED_TIME_ TIMESTAMP, OCCURRED_TIME_ TIMESTAMP, TERMINATED_TIME_ TIMESTAMP, EXIT_TIME_ TIMESTAMP, ENDED_TIME_ TIMESTAMP, LAST_UPDATED_TIME_ TIMESTAMP, START_USER_ID_ varchar(191), REFERENCE_ID_ varchar(191), REFERENCE_TYPE_ varchar(191), TENANT_ID_ varchar(191) DEFAULT '', CONSTRAINT PK_ACT_CMMN_HI_PLAN_ITEM_INST PRIMARY KEY (ID_));

ALTER TABLE PUBLIC.ACT_CMMN_RU_MIL_INST ADD TENANT_ID_ varchar(191) DEFAULT '';

ALTER TABLE PUBLIC.ACT_CMMN_HI_MIL_INST ADD TENANT_ID_ varchar(191) DEFAULT '';

INSERT INTO PUBLIC.ACT_CMMN_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('4', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', NOW(), 7, '8:e40d29cb79345b7fb5afd38a7f0ba8fc', 'createTable tableName=ACT_CMMN_HI_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_MIL_INST; addColumn tableName=ACT_CMMN_HI_MIL_INST', '', 'EXECUTED', NULL, NULL, '3.6.1', '6986083387');



CREATE TABLE PUBLIC.ACT_DMN_DATABASECHANGELOG (ID varchar(191) NOT NULL, AUTHOR varchar(191) NOT NULL, FILENAME varchar(191) NOT NULL, DATEEXECUTED TIMESTAMP NOT NULL, ORDEREXECUTED INT NOT NULL, EXECTYPE VARCHAR(10) NOT NULL, MD5SUM VARCHAR(35), DESCRIPTION varchar(191), COMMENTS varchar(191), TAG varchar(191), LIQUIBASE VARCHAR(20), CONTEXTS varchar(191), LABELS varchar(191), DEPLOYMENT_ID VARCHAR(10));

CREATE TABLE PUBLIC.ACT_DMN_DEPLOYMENT (ID_ varchar(191) NOT NULL, NAME_ varchar(191), CATEGORY_ varchar(191), DEPLOY_TIME_ TIMESTAMP, TENANT_ID_ varchar(191), PARENT_DEPLOYMENT_ID_ varchar(191), CONSTRAINT PK_ACT_DMN_DEPLOYMENT PRIMARY KEY (ID_));

CREATE TABLE PUBLIC.ACT_DMN_DEPLOYMENT_RESOURCE (ID_ varchar(191) NOT NULL, NAME_ varchar(191), DEPLOYMENT_ID_ varchar(191), RESOURCE_BYTES_ BLOB, CONSTRAINT PK_ACT_DMN_DEPLOYMENT_RESOURCE PRIMARY KEY (ID_));

CREATE TABLE PUBLIC.ACT_DMN_DECISION_TABLE (ID_ varchar(191) NOT NULL, NAME_ varchar(191), VERSION_ INT, KEY_ varchar(191), CATEGORY_ varchar(191), DEPLOYMENT_ID_ varchar(191), PARENT_DEPLOYMENT_ID_ varchar(191), TENANT_ID_ varchar(191), RESOURCE_NAME_ varchar(191), DESCRIPTION_ varchar(191), CONSTRAINT PK_ACT_DMN_DECISION_TABLE PRIMARY KEY (ID_));

INSERT INTO PUBLIC.ACT_DMN_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1', 'activiti', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', NOW(), 1, '8:c8701f1c71018b55029f450b2e9a10a1', 'createTable tableName=ACT_DMN_DEPLOYMENT; createTable tableName=ACT_DMN_DEPLOYMENT_RESOURCE; createTable tableName=ACT_DMN_DECISION_TABLE', '', 'EXECUTED', NULL, NULL, '3.6.1', '6986083457');

CREATE TABLE PUBLIC.ACT_DMN_HI_DECISION_EXECUTION (ID_ varchar(191) NOT NULL, DECISION_DEFINITION_ID_ varchar(191), DEPLOYMENT_ID_ varchar(191), START_TIME_ TIMESTAMP, END_TIME_ TIMESTAMP, INSTANCE_ID_ varchar(191), EXECUTION_ID_ varchar(191), ACTIVITY_ID_ varchar(191), FAILED_ BOOLEAN DEFAULT FALSE, TENANT_ID_ varchar(191), EXECUTION_JSON_ CLOB, CONSTRAINT PK_ACT_DMN_HI_DECISION_EXECUTION PRIMARY KEY (ID_));

INSERT INTO PUBLIC.ACT_DMN_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('2', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', NOW(), 3, '8:47f94b27feb7df8a30d4e338c7bd5fb8', 'createTable tableName=ACT_DMN_HI_DECISION_EXECUTION', '', 'EXECUTED', NULL, NULL, '3.6.1', '6986083457');

ALTER TABLE PUBLIC.ACT_DMN_HI_DECISION_EXECUTION ADD SCOPE_TYPE_ varchar(191);

INSERT INTO PUBLIC.ACT_DMN_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('3', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', NOW(), 5, '8:ac17eae89fbdccb6e08daf3c7797b579', 'addColumn tableName=ACT_DMN_HI_DECISION_EXECUTION', '', 'EXECUTED', NULL, NULL, '3.6.1', '6986083457');

ALTER TABLE PUBLIC.ACT_DMN_DECISION_TABLE DROP COLUMN PARENT_DEPLOYMENT_ID_;

INSERT INTO PUBLIC.ACT_DMN_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('4', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', NOW(), 7, '8:f73aabc4529e7292c2942073d1cff6f9', 'dropColumn columnName=PARENT_DEPLOYMENT_ID_, tableName=ACT_DMN_DECISION_TABLE', '', 'EXECUTED', NULL, NULL, '3.6.1', '6986083457');



CREATE TABLE PUBLIC.ACT_FO_DATABASECHANGELOG (ID varchar(191) NOT NULL, AUTHOR varchar(191) NOT NULL, FILENAME varchar(191) NOT NULL, DATEEXECUTED TIMESTAMP NOT NULL, ORDEREXECUTED INT NOT NULL, EXECTYPE VARCHAR(10) NOT NULL, MD5SUM VARCHAR(35), DESCRIPTION varchar(191), COMMENTS varchar(191), TAG varchar(191), LIQUIBASE VARCHAR(20), CONTEXTS varchar(191), LABELS varchar(191), DEPLOYMENT_ID VARCHAR(10));

CREATE TABLE PUBLIC.ACT_FO_FORM_DEPLOYMENT (ID_ varchar(191) NOT NULL, NAME_ varchar(191), CATEGORY_ varchar(191), DEPLOY_TIME_ TIMESTAMP, TENANT_ID_ varchar(191), PARENT_DEPLOYMENT_ID_ varchar(191), CONSTRAINT PK_ACT_FO_FORM_DEPLOYMENT PRIMARY KEY (ID_));

CREATE TABLE PUBLIC.ACT_FO_FORM_RESOURCE (ID_ varchar(191) NOT NULL, NAME_ varchar(191), DEPLOYMENT_ID_ varchar(191), RESOURCE_BYTES_ BLOB, CONSTRAINT PK_ACT_FO_FORM_RESOURCE PRIMARY KEY (ID_));

CREATE TABLE PUBLIC.ACT_FO_FORM_DEFINITION (ID_ varchar(191) NOT NULL, NAME_ varchar(191), VERSION_ INT, KEY_ varchar(191), CATEGORY_ varchar(191), DEPLOYMENT_ID_ varchar(191), PARENT_DEPLOYMENT_ID_ varchar(191), TENANT_ID_ varchar(191), RESOURCE_NAME_ varchar(191), DESCRIPTION_ varchar(191), CONSTRAINT PK_ACT_FO_FORM_DEFINITION PRIMARY KEY (ID_));

CREATE TABLE PUBLIC.ACT_FO_FORM_INSTANCE (ID_ varchar(191) NOT NULL, FORM_DEFINITION_ID_ varchar(191) NOT NULL, TASK_ID_ varchar(191), PROC_INST_ID_ varchar(191), PROC_DEF_ID_ varchar(191), SUBMITTED_DATE_ TIMESTAMP, SUBMITTED_BY_ varchar(191), FORM_VALUES_ID_ varchar(191), TENANT_ID_ varchar(191), CONSTRAINT PK_ACT_FO_FORM_INSTANCE PRIMARY KEY (ID_));

INSERT INTO PUBLIC.ACT_FO_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1', 'activiti', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', NOW(), 1, '8:033ebf9380889aed7c453927ecc3250d', 'createTable tableName=ACT_FO_FORM_DEPLOYMENT; createTable tableName=ACT_FO_FORM_RESOURCE; createTable tableName=ACT_FO_FORM_DEFINITION; createTable tableName=ACT_FO_FORM_INSTANCE', '', 'EXECUTED', NULL, NULL, '3.6.1', '6986083509');

ALTER TABLE PUBLIC.ACT_FO_FORM_INSTANCE ADD SCOPE_ID_ varchar(191);

ALTER TABLE PUBLIC.ACT_FO_FORM_INSTANCE ADD SCOPE_TYPE_ varchar(191);

ALTER TABLE PUBLIC.ACT_FO_FORM_INSTANCE ADD SCOPE_DEFINITION_ID_ varchar(191);

INSERT INTO PUBLIC.ACT_FO_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('2', 'flowable', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', NOW(), 3, '8:986365ceb40445ce3b27a8e6b40f159b', 'addColumn tableName=ACT_FO_FORM_INSTANCE', '', 'EXECUTED', NULL, NULL, '3.6.1', '6986083509');

ALTER TABLE PUBLIC.ACT_FO_FORM_DEFINITION DROP COLUMN PARENT_DEPLOYMENT_ID_;

INSERT INTO PUBLIC.ACT_FO_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('3', 'flowable', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', NOW(), 5, '8:abf482518ceb09830ef674e52c06bf15', 'dropColumn columnName=PARENT_DEPLOYMENT_ID_, tableName=ACT_FO_FORM_DEFINITION', '', 'EXECUTED', NULL, NULL, '3.6.1', '6986083509');



CREATE TABLE PUBLIC.ACT_CO_DATABASECHANGELOG (ID varchar(191) NOT NULL, AUTHOR varchar(191) NOT NULL, FILENAME varchar(191) NOT NULL, DATEEXECUTED TIMESTAMP NOT NULL, ORDEREXECUTED INT NOT NULL, EXECTYPE VARCHAR(10) NOT NULL, MD5SUM VARCHAR(35), DESCRIPTION varchar(191), COMMENTS varchar(191), TAG varchar(191), LIQUIBASE VARCHAR(20), CONTEXTS varchar(191), LABELS varchar(191), DEPLOYMENT_ID VARCHAR(10));

CREATE TABLE PUBLIC.ACT_CO_CONTENT_ITEM (ID_ varchar(191) NOT NULL, NAME_ varchar(191) NOT NULL, MIME_TYPE_ varchar(191), TASK_ID_ varchar(191), PROC_INST_ID_ varchar(191), CONTENT_STORE_ID_ varchar(191), CONTENT_STORE_NAME_ varchar(191), FIELD_ VARCHAR(400), CONTENT_AVAILABLE_ BOOLEAN DEFAULT FALSE, CREATED_ TIMESTAMP(6), CREATED_BY_ varchar(191), LAST_MODIFIED_ TIMESTAMP(6), LAST_MODIFIED_BY_ varchar(191), CONTENT_SIZE_ BIGINT DEFAULT 0, TENANT_ID_ varchar(191), CONSTRAINT PK_ACT_CO_CONTENT_ITEM PRIMARY KEY (ID_));

CREATE INDEX PUBLIC.idx_contitem_taskid ON PUBLIC.ACT_CO_CONTENT_ITEM(TASK_ID_);

CREATE INDEX PUBLIC.idx_contitem_procid ON PUBLIC.ACT_CO_CONTENT_ITEM(PROC_INST_ID_);

INSERT INTO PUBLIC.ACT_CO_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1', 'activiti', 'org/flowable/content/db/liquibase/flowable-content-db-changelog.xml', NOW(), 1, '8:7644d7165cfe799200a2abdd3419e8b6', 'createTable tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_taskid, tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_procid, tableName=ACT_CO_CONTENT_ITEM', '', 'EXECUTED', NULL, NULL, '3.6.1', '6986083555');

ALTER TABLE PUBLIC.ACT_CO_CONTENT_ITEM ADD SCOPE_ID_ varchar(191);

ALTER TABLE PUBLIC.ACT_CO_CONTENT_ITEM ADD SCOPE_TYPE_ varchar(191);

CREATE INDEX PUBLIC.idx_contitem_scope ON PUBLIC.ACT_CO_CONTENT_ITEM(SCOPE_ID_, SCOPE_TYPE_);

INSERT INTO PUBLIC.ACT_CO_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('2', 'flowable', 'org/flowable/content/db/liquibase/flowable-content-db-changelog.xml', NOW(), 3, '8:fe7b11ac7dbbf9c43006b23bbab60bab', 'addColumn tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_scope, tableName=ACT_CO_CONTENT_ITEM', '', 'EXECUTED', NULL, NULL, '3.6.1', '6986083555');


create table ACT_ID_PROPERTY (
    NAME_ varchar(64),
    VALUE_ varchar(300),
    REV_ integer,
    primary key (NAME_)
);

insert into ACT_ID_PROPERTY
values ('schema.version', '6.3.1.0', 1);

create table ACT_ID_BYTEARRAY (
    ID_ varchar(64),
    REV_ integer,
    NAME_ varchar(191),
    BYTES_ longvarbinary,
    primary key (ID_)
);

create table ACT_ID_GROUP (
    ID_ varchar(64),
    REV_ integer,
    NAME_ varchar(191),
    TYPE_ varchar(191),
    primary key (ID_)
);

create table ACT_ID_MEMBERSHIP (
    USER_ID_ varchar(64),
    GROUP_ID_ varchar(64),
    primary key (USER_ID_, GROUP_ID_)
);

create table ACT_ID_USER (
    ID_ varchar(64),
    REV_ integer,
    FIRST_ varchar(191),
    LAST_ varchar(191),
    EMAIL_ varchar(191),
    PWD_ varchar(191),
    PICTURE_ID_ varchar(64),
    TENANT_ID_ varchar(191) default '',
    primary key (ID_)
);

create table ACT_ID_INFO (
    ID_ varchar(64),
    REV_ integer,
    USER_ID_ varchar(64),
    TYPE_ varchar(64),
    KEY_ varchar(191),
    VALUE_ varchar(191),
    PASSWORD_ longvarbinary,
    PARENT_ID_ varchar(191),
    primary key (ID_)
);

create table ACT_ID_TOKEN (
    ID_ varchar(64) not null,
    REV_ integer,
    TOKEN_VALUE_ varchar(191),
    TOKEN_DATE_ timestamp,
    IP_ADDRESS_ varchar(191),
    USER_AGENT_ varchar(191),
    USER_ID_ varchar(191),
    TOKEN_DATA_ varchar(2000),
    primary key (ID_)
);

create table ACT_ID_PRIV (
    ID_ varchar(64) not null,
    NAME_ varchar(191) not null,
    primary key (ID_)
);

create table ACT_ID_PRIV_MAPPING (
    ID_ varchar(64) not null,
    PRIV_ID_ varchar(64) not null,
    USER_ID_ varchar(191),
    GROUP_ID_ varchar(191),
    primary key (ID_)
);

alter table ACT_ID_MEMBERSHIP
    add constraint ACT_FK_MEMB_GROUP
    foreign key (GROUP_ID_)
    references ACT_ID_GROUP;

alter table ACT_ID_MEMBERSHIP
    add constraint ACT_FK_MEMB_USER
    foreign key (USER_ID_)
    references ACT_ID_USER;

alter table ACT_ID_PRIV_MAPPING
    add constraint ACT_FK_PRIV_MAPPING
    foreign key (PRIV_ID_)
    references ACT_ID_PRIV;

create index ACT_IDX_PRIV_USER on ACT_ID_PRIV_MAPPING(USER_ID_);
create index ACT_IDX_PRIV_GROUP on ACT_ID_PRIV_MAPPING(GROUP_ID_);

alter table ACT_ID_PRIV
    add constraint ACT_UNIQ_PRIV_NAME
    unique (NAME_);


CREATE TABLE PUBLIC.ACT_APP_DATABASECHANGELOG (ID varchar(191) NOT NULL, AUTHOR varchar(191) NOT NULL, FILENAME varchar(191) NOT NULL, DATEEXECUTED TIMESTAMP NOT NULL, ORDEREXECUTED INT NOT NULL, EXECTYPE VARCHAR(10) NOT NULL, MD5SUM VARCHAR(35), DESCRIPTION varchar(191), COMMENTS varchar(191), TAG varchar(191), LIQUIBASE VARCHAR(20), CONTEXTS varchar(191), LABELS varchar(191), DEPLOYMENT_ID VARCHAR(10));

CREATE TABLE PUBLIC.ACT_APP_DEPLOYMENT (ID_ varchar(191) NOT NULL, NAME_ varchar(191), CATEGORY_ varchar(191), KEY_ varchar(191), DEPLOY_TIME_ TIMESTAMP, TENANT_ID_ varchar(191) DEFAULT '', CONSTRAINT PK_ACT_APP_DEPLOYMENT PRIMARY KEY (ID_));

CREATE TABLE PUBLIC.ACT_APP_DEPLOYMENT_RESOURCE (ID_ varchar(191) NOT NULL, NAME_ varchar(191), DEPLOYMENT_ID_ varchar(191), RESOURCE_BYTES_ BLOB, CONSTRAINT PK_APP_DEPLOYMENT_RESOURCE PRIMARY KEY (ID_));

ALTER TABLE PUBLIC.ACT_APP_DEPLOYMENT_RESOURCE ADD CONSTRAINT ACT_FK_APP_RSRC_DPL FOREIGN KEY (DEPLOYMENT_ID_) REFERENCES PUBLIC.ACT_APP_DEPLOYMENT (ID_);

CREATE INDEX PUBLIC.ACT_IDX_APP_RSRC_DPL ON PUBLIC.ACT_APP_DEPLOYMENT_RESOURCE(DEPLOYMENT_ID_);

CREATE TABLE PUBLIC.ACT_APP_APPDEF (ID_ varchar(191) NOT NULL, REV_ INT NOT NULL, NAME_ varchar(191), KEY_ varchar(191) NOT NULL, VERSION_ INT NOT NULL, CATEGORY_ varchar(191), DEPLOYMENT_ID_ varchar(191), RESOURCE_NAME_ VARCHAR(4000), DESCRIPTION_ VARCHAR(4000), TENANT_ID_ varchar(191) DEFAULT '', CONSTRAINT PK_ACT_APP_APPDEF PRIMARY KEY (ID_));

ALTER TABLE PUBLIC.ACT_APP_APPDEF ADD CONSTRAINT ACT_FK_APP_DEF_DPLY FOREIGN KEY (DEPLOYMENT_ID_) REFERENCES PUBLIC.ACT_APP_DEPLOYMENT (ID_);

CREATE INDEX PUBLIC.ACT_IDX_APP_DEF_DPLY ON PUBLIC.ACT_APP_APPDEF(DEPLOYMENT_ID_);

INSERT INTO PUBLIC.ACT_APP_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1', 'flowable', 'org/flowable/app/db/liquibase/flowable-app-db-changelog.xml', NOW(), 1, '8:496fc778bdf2ab13f2e1926d0e63e0a2', 'createTable tableName=ACT_APP_DEPLOYMENT; createTable tableName=ACT_APP_DEPLOYMENT_RESOURCE; addForeignKeyConstraint baseTableName=ACT_APP_DEPLOYMENT_RESOURCE, constraintName=ACT_FK_APP_RSRC_DPL, referencedTableName=ACT_APP_DEPLOYMENT; createIndex...', '', 'EXECUTED', NULL, NULL, '3.6.1', '6986083599');



update ACT_GE_PROPERTY set VALUE_ = '6.3.1.0' where NAME_ = 'identitylink.schema.version';

update ACT_GE_PROPERTY set VALUE_ = '6.3.1.0' where NAME_ = 'task.schema.version';

update ACT_GE_PROPERTY set VALUE_ = '6.3.1.0' where NAME_ = 'variable.schema.version';

update ACT_GE_PROPERTY set VALUE_ = '6.3.1.0' where NAME_ = 'job.schema.version';
alter table ACT_RE_DEPLOYMENT add column PARENT_DEPLOYMENT_ID_ varchar(191);

update ACT_GE_PROPERTY set VALUE_ = '6.3.1.0' where NAME_ = 'schema.version';


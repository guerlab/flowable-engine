alter table ACT_RU_HISTORY_JOB add SCOPE_TYPE_ nvarchar(191);

update ACT_GE_PROPERTY set VALUE_ = '6.3.1.0' where NAME_ = 'job.schema.version';
alter table ACT_RU_EXECUTION add column CALLBACK_ID_ varchar(191);
alter table ACT_RU_EXECUTION add column CALLBACK_TYPE_ varchar(191);

update ACT_GE_PROPERTY set VALUE_ = '6.2.0.0' where NAME_ = 'schema.version';
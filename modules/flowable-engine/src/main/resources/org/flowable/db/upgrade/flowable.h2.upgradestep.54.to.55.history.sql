alter table ACT_HI_COMMENT 
add TYPE_ varchar(191);

alter table ACT_HI_COMMENT 
add ACTION_ varchar(191);

alter table ACT_HI_COMMENT 
add FULL_MSG_ longvarbinary;

alter table ACT_HI_TASKINST 
add OWNER_ varchar(64);

alter table ACT_HI_TASKINST 
add PARENT_TASK_ID_ varchar(64);

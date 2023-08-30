drop table if exists powerapps.user;
go 

create table if not exists powerapps.user(
     user_name                  text            null 
    ,full_name                  text            null 
    ,first_name                 text            null 
    ,last_name                  text            null 
    ,producer_level             text            null 
    ,producer                   text            null 
    ,business_unit              text            null 
    ,guid                       uuid            not null 
    ,status                     text            null 
    ,id                         bigint          not null            generated always as identity            primary key 
    ,constraint user_guid  unique (guid)
);
go 

/*** PERMISSIONS ***/
alter table powerapps.user owner to mj_admin;
go 

grant select on powerapps.user to rl_powerapps_r;
go 

grant insert on powerapps.user to rl_powerapps_a;
go 

grant update on powerapps.user to rl_powerapps_w;
go 

/*** TRIGGERS ***/
create trigger log_change_iud after insert or update or delete on powerapps.user for each row execute function audit.tr_powerapps_log_change();
go 
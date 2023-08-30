drop table if exists benefitpoint.audit_office;
go 

create table benefitpoint.audit_office (
     office_id                      int                 not null 
    ,old_office_name                text                null 
    ,new_office_name                text                null 
    ,old_region_name                text                null 
    ,new_region_name                text                null 
    ,audit_action                   char(1)             not null 
    ,audit_user                     text                not null            default current_user 
    ,audit_timestamp                timestamp           not null            default timezone('utc'::text, clock_timestamp()) 
    ,audit_id                       bigint              not null            generated always as identity 
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.audit_office owner to mj_admin;
go 

grant insert on benefitpoint.audit_office to rl_benefitpoint_a;
go 

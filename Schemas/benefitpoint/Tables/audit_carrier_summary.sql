create table benefitpoint.audit_carrier_summary (
     carrier_id                 int                 not null 
    ,old_carrier_name           text                null 
    ,new_carrier_name           text                null 
    ,old_carrier_alias          text                null 
    ,new_carrier_alias          text                null 
    ,audit_action               char(1)             not null 
    ,audit_user                 text                not null            default current_user 
    ,audit_timestamp            timestamp           not null            default timezone('utc'::text, clock_timestamp()) 
    ,audit_id                   bigint              not null            generated always as identity 
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.audit_carrier_summary owner to mj_admin;
go 

grant insert on benefitpoint.audit_carrier_summary to rl_benefitpoint_a;
go 

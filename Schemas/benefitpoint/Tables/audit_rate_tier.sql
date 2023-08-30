create table benefitpoint.audit_rate_tier (
     rate_field_id                      int                 not null 
    ,rate_tier_id                       int                 not null 
    ,old_description                    text                null 
    ,new_description                    text                null 
    ,old_allow_include_ee               bool                null 
    ,new_allow_include_ee               bool                null 
    ,audit_action                       char(1)             not null 
    ,audit_user                         text                not null            default current_user 
    ,audit_timestamp                    timestamp           not null            default timezone('utc'::text, clock_timestamp()) 
    ,audit_id                           bigint              not null            generated always as identity 
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.audit_rate_tier owner to mj_admin;
go 

grant insert on benefitpoint.audit_rate_tier to rl_benefitpoint_a;
go 

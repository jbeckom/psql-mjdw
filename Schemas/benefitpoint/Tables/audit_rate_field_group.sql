create table benefitpoint.audit_rate_field_group (
     rate_field_group_id                int                 not null 
    ,old_description                    text                null 
    ,new_description                    text                null 
    ,old_max_values_allowed             int                 null 
    ,new_max_values_allowed             int                 null 
    ,old_rate_field_group_type          text                null 
    ,new_rate_field_group_type          text                null 
    ,audit_action                       char(1)             not null 
    ,audit_user                         text                not null            default current_user 
    ,audit_timestamp                    timestamp           not null            default timezone('utc'::text, clock_timestamp()) 
    ,audit_id                           bigint              not null            generated always as identity 
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.audit_rate_field_group owner to mj_admin;
go 

grant insert on benefitpoint.audit_rate_field_group to rl_benefitpoint_a;
go 

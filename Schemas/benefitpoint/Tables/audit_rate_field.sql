create table benefitpoint.audit_rate_field (
     rate_field_id              int             not null 
    ,old_label                      text            null 
    ,new_label                      text            null 
    ,old_field_type                 text            null 
    ,new_field_type                 text            null 
    ,old_field_value_type           text            null 
    ,new_field_value_type           text            null 
    ,old_rate_field_group           int             null 
    ,new_rate_field_group           int             null 
    ,old_tiered                     bool            null 
    ,new_tiered                     bool            null 
    ,old_calculated                 bool            null 
    ,new_calculated                 bool            null 
    ,audit_action                   char(1)                     not null 
    ,audit_user                     text                        not null            default current_user 
    ,audit_timestamp                timestamp                   not null            default timezone('utc'::text, clock_timestamp()) 
    ,audit_id                       bigint                      not null            generated always as identity 
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.audit_rate_field owner to mj_admin;
go 

grant insert on benefitpoint.audit_rate_field to rl_benefitpoint_a;
go 

create table benefitpoint.audit_commission_range (
     source_type                        text                        not null 
    ,commission_id                      int                         not null 
    ,old_value                          double precision            null 
    ,new_value                          double precision            null 
    ,old_value_unit_of_measure          text                        null 
    ,new_value_unit_of_measure          text                        null 
    ,old_from_range                     double precision            null 
    ,new_from_range                     double precision            null 
    ,old_to_range                       double precision            null 
    ,new_to_range                       double precision            null 
    ,sort_order                         int                         null 
    ,audit_action                       char(1)                     not null 
    ,audit_user                         text                        not null            default current_user 
    ,audit_timestamp                    timestamp                   not null            default timezone('utc'::text, clock_timestamp()) 
    ,audit_id                           bigint                      not null            generated always as identity 
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.audit_commission_range owner to mj_admin;
go 

grant insert on benefitpoint.audit_commission_range to rl_benefitpoint_a;
go 

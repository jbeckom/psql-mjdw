create table benefitpoint.audit_rate_field_value (
     rate_id                            int                         not null 
    ,rate_field_id                      int                         not null 
    ,old_multi_value_index              int                         null 
    ,new_multi_value_index              int                         null 
    ,old_value_num                      double precision            null 
    ,new_value_num                      double precision            null 
    ,old_value_text                     text                        null 
    ,new_value_text                     text                        null 
    ,old_age_band_index                 int                         null 
    ,new_age_band_index                 int                         null 
    ,old_age_band_gender                text                        null 
    ,new_age_band_gender                text                        null 
    ,audit_action                       char(1)                     not null 
    ,audit_user                         text                        not null            default current_user 
    ,audit_timestamp                    timestamp                   not null            default timezone('utc'::text, clock_timestamp()) 
    ,audit_id                           bigint                      not null            generated always as identity 
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.audit_rate_field_value owner to mj_admin;
go 

grant insert on benefitpoint.audit_rate_field_value to rl_benefitpoint_a;
go 

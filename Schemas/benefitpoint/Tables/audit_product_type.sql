create table benefitpoint.audit_product_type (
     product_type_id                int                 not null 
    ,old_short_description          text                null 
    ,new_short_description          text                null 
    ,old_long_description           text                null 
    ,new_long_description           text                null 
    ,old_line_of_coverage           text                null 
    ,new_line_of_coverage           text                null 
    ,old_rate_types                 text                null 
    ,new_rate_types                 text                null 
    ,audit_action                   char(1)             not null 
    ,audit_user                     text                not null            default current_user 
    ,audit_timestamp                timestamp           not null            default timezone('utc'::text, clock_timestamp()) 
    ,audit_id                       bigint              not null            generated always as identity 
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.audit_product_type owner to mj_admin;
go 

grant insert on benefitpoint.audit_product_type to rl_benefitpoint_a;
go 

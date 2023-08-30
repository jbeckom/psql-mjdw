create table benefitpoint.audit_benefit_summary_description (
     rate_id                            int             not null 
    ,benefit_summary_id                 int             not null 
    ,old_product_id                     int             null 
    ,new_product_id                     int             null 
    ,old_description                    text            null 
    ,new_description                    text            null 
    ,audit_action                       char(1)         not null 
    ,audit_user                         text            not null            default current_user 
    ,audit_timestamp                    timestamp       not null            default timezone('utc'::text, clock_timestamp()) 
    ,audit_id                           bigint          not null            generated always as identity 
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.audit_benefit_summary_description owner to mj_admin;
go 

grant insert on benefitpoint.audit_benefit_summary_description to rl_benefitpoint_a;
go 

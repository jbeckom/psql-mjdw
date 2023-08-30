create table benefitpoint.audit_company_payee (
     payee_id                       int             not null 
    ,old_company_name               text            null 
    ,new_company_name               text            null 
    ,old_vendor_number              text            null 
    ,new_vendor_number              text            null 
    ,old_website                    text            null 
    ,new_website                    text            null 
    ,old_agency_account_id          int             null 
    ,new_agency_account_id          int             null 
    ,old_company_1099               bool            null 
    ,new_company_1099               bool            null 
    ,audit_action                   char(1)         not null 
    ,audit_user                     text            not null            default current_user 
    ,audit_timestamp                timestamp       not null            default timezone('utc'::text, clock_timestamp()) 
    ,audit_id                       bigint          not null            generated always as identity 
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.audit_company_payee owner to mj_admin;
go 

grant insert on benefitpoint.audit_company_payee to rl_benefitpoint_a;
go 

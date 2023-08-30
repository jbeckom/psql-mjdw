create table benefitpoint.audit_individual_payee (
     payee_id                       int                 not null 
    ,old_tax_status                 text                null 
    ,new_tax_status                 text                null 
    ,old_company_name               text                null 
    ,new_company_name               text                null 
    ,old_department_code            text                null 
    ,new_department_code            text                null 
    ,old_employee_code              text                null 
    ,new_employee_code              text                null 
    ,old_agent_account_id           int                 null 
    ,new_agent_account_id           int                 null 
    ,old_user_id                    int                 null 
    ,new_user_id                    int                 null 
    ,audit_action                   char(1)             not null 
    ,audit_user                     text                not null            default current_user 
    ,audit_timestamp                timestamp           not null            default timezone('utc'::text, clock_timestamp()) 
    ,audit_id                       bigint              not null            generated always as identity 
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.audit_individual_payee owner to mj_admin;
go 

grant insert on benefitpoint.audit_individual_payee to rl_benefitpoint_a;
go 

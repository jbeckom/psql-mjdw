create table benefitpoint.individual_payee (
     payee_id                   int             not null 
    ,tax_status                 text            null 
    ,company_name               text            null 
    ,department_code            text            null 
    ,employee_code              text            null 
    ,agent_account_id           int             null 
    ,user_id                    int             null 
    ,constraint individual_payee_pkey    primary key (payee_id)
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.individual_payee owner to mj_admin;
go 

grant select on benefitpoint.individual_payee to rl_benefitpoint_r;
go 

grant insert on benefitpoint.individual_payee to rl_benefitpoint_a;
go 

grant update on benefitpoint.individual_payee to rl_benefitpoint_w;
go 

/*** TRIGGERS ***/
create trigger audit_d after delete on benefitpoint.individual_payee for each row execute function benefitpoint.tr_audit_individual_payee_d();
go 

create trigger audit_i after insert on benefitpoint.individual_payee for each row execute function benefitpoint.tr_audit_individual_payee_i();
go 

create trigger audit_u after update on benefitpoint.individual_payee for each row when (old is distinct from new) execute function benefitpoint.tr_audit_individual_payee_u();
go 
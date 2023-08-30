create table benefitpoint.company_payee (
     payee_id                   int             not null 
    ,company_name               text            null 
    ,vendor_number              text            null 
    ,website                    text            null 
    ,agency_account_id          int             null 
    ,company_1099               bool            null 
    ,constraint company_payee_pkey  primary key (payee_id)
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.company_payee owner to mj_admin;
go 

grant select on benefitpoint.company_payee to rl_benefitpoint_r;
go 

grant insert on benefitpoint.company_payee to rl_benefitpoint_a;
go 

grant update on benefitpoint.company_payee to rl_benefitpoint_w;
go 

/*** TRIGGERS ***/
create trigger audit_d after delete on benefitpoint.company_payee for each row execute function benefitpoint.tr_audit_company_payee_d();
go 

create trigger audit_i after insert on benefitpoint.company_payee for each row execute function benefitpoint.tr_audit_company_payee_i();
go 

create trigger audit_u after update on benefitpoint.company_payee for each row when (old is distinct from new) execute function benefitpoint.tr_audit_company_payee_u();
go 
create table benefitpoint.retirement_plan_info (
     product_id                         int                 not null 
    ,account_id                         int                 not null 
    ,record_keeper_plan_number          text                null 
    ,plan_adoption_on                   timestamp           null 
    ,fiscal_year_from                   text                null 
    ,fiscal_year_to                     text                null 
    ,audit_required                     bool                null 
    ,auditor                            text                null 
    ,trustee                            text                null 
    ,custodian                          text                null 
    ,constraint retirement_plan_info_pkey   primary key (product_id, account_id)
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.retirement_plan_info owner to mj_admin;
go 

grant select on benefitpoint.retirement_plan_info to rl_benefitpoint_r;
go 

grant insert on benefitpoint.retirement_plan_info to rl_benefitpoint_a;
go 

grant update on benefitpoint.retirement_plan_info to rl_benefitpoint_w;
go 

/*** TRIGGERS ***/
create trigger audit_d after delete on benefitpoint.retirement_plan_info for each row execute function benefitpoint.tr_audit_retirement_plan_info_d();
go 

create trigger audit_i after insert on benefitpoint.retirement_plan_info for each row execute function benefitpoint.tr_audit_retirement_plan_info_i();
go 

create trigger audit_u after update on benefitpoint.retirement_plan_info for each row when (old is distinct from new) execute function benefitpoint.tr_audit_retirement_plan_info_u();
go 
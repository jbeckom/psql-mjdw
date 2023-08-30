create or replace function benefitpoint.tr_audit_retirement_plan_info_d() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_retirement_plan_info (
         product_id 
        ,account_id 
        ,old_record_keeper_plan_number 
        ,old_plan_adoption_on 
        ,old_fiscal_year_from 
        ,old_fiscal_year_to 
        ,old_audit_required 
        ,old_auditor 
        ,old_trustee 
        ,old_custodian 
        ,audit_action 
    )
    select   old.product_id 
            ,old.account_id 
            ,old.record_keeper_plan_number 
            ,old.plan_adoption_on 
            ,old.fiscal_year_from 
            ,old.fiscal_year_to 
            ,old.audit_required 
            ,old.auditor 
            ,old.trustee 
            ,old.custodian 
            ,'D';
    return old;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_retirement_plan_info_d() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_retirement_plan_info_d() to rl_benefitpoint_x;
go 
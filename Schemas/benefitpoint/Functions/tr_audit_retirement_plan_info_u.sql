create or replace function benefitpoint.tr_audit_retirement_plan_info_u() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_retirement_plan_info (
         product_id 
        ,account_id 
        ,old_record_keeper_plan_number 
        ,new_record_keeper_plan_number 
        ,old_plan_adoption_on 
        ,new_plan_adoption_on 
        ,old_fiscal_year_from 
        ,new_fiscal_year_from 
        ,old_fiscal_year_to 
        ,new_fiscal_year_to 
        ,old_audit_required 
        ,new_audit_required 
        ,old_auditor 
        ,new_auditor 
        ,old_trustee 
        ,new_trustee 
        ,old_custodian 
        ,new_custodian 
        ,audit_action 
    )
    select   old.product_id 
            ,old.account_id 
            ,old.record_keeper_plan_number 
            ,new.record_keeper_plan_number 
            ,old.plan_adoption_on 
            ,new.plan_adoption_on 
            ,old.fiscal_year_from 
            ,new.fiscal_year_from 
            ,old.fiscal_year_to 
            ,new.fiscal_year_to 
            ,old.audit_required 
            ,new.audit_required 
            ,old.auditor 
            ,new.auditor 
            ,old.trustee 
            ,new.trustee 
            ,old.custodian 
            ,new.custodian 
            ,'U';
    return old;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_retirement_plan_info_u() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_retirement_plan_info_u() to rl_benefitpoint_x;
go 
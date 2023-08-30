create or replace function benefitpoint.tr_audit_retirement_plan_info_i() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_retirement_plan_info (
         product_id 
        ,account_id 
        ,new_record_keeper_plan_number 
        ,new_plan_adoption_on 
        ,new_fiscal_year_from 
        ,new_fiscal_year_to 
        ,new_audit_required 
        ,new_auditor 
        ,new_trustee 
        ,new_custodian 
        ,audit_action 
    )
    select   new.product_id 
            ,new.account_id 
            ,new.record_keeper_plan_number 
            ,new.plan_adoption_on 
            ,new.fiscal_year_from 
            ,new.fiscal_year_to 
            ,new.audit_required 
            ,new.auditor 
            ,new.trustee 
            ,new.custodian 
            ,'I';
    return new;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_retirement_plan_info_i() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_retirement_plan_info_i() to rl_benefitpoint_x;
go 
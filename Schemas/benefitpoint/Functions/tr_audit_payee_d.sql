create or replace function benefitpoint.tr_audit_payee_d() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_payee (
         payee_id 
        ,old_payee_type 
        ,old_payee_code 
        ,old_house_account 
        ,old_tax_payer_id_number 
        ,old_revenue_goal 
        ,old_commission_goal 
        ,old_renewal_revenue_goal 
        ,old_renewal_commission_goal 
        ,old_replacement_revenue_goal 
        ,old_replacement_commission_goal 
        ,old_notes 
        ,old_include_in_book_of_business 
        ,old_over_payement_payee 
        ,old_internal_payee 
        ,old_last_modified_on 
        ,old_created_on 
        ,audit_action 
    )
    select   old.payee_id 
            ,old.payee_type 
            ,old.payee_code 
            ,old.house_account 
            ,old.tax_payer_id_number 
            ,old.revenue_goal 
            ,old.commission_goal 
            ,old.renewal_revenue_goal 
            ,old.renewal_commission_goal 
            ,old.replacement_revenue_goal 
            ,old.replacement_commission_goal 
            ,old.notes 
            ,old.include_in_book_of_business 
            ,old.over_payement_payee 
            ,old.internal_payee 
            ,old.last_modified_on 
            ,old.created_on  
            ,'D'; 
    return old;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_payee_d() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_payee_d() to rl_benefitpoint_x;
go 
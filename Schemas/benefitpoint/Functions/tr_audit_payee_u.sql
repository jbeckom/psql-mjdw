create or replace function benefitpoint.tr_audit_payee_u() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_payee (
         payee_id 
        ,old_payee_type 
        ,new_payee_type 
        ,old_payee_code 
        ,new_payee_code 
        ,old_house_account 
        ,new_house_account 
        ,old_tax_payer_id_number 
        ,new_tax_payer_id_number 
        ,old_revenue_goal 
        ,new_revenue_goal 
        ,old_commission_goal 
        ,new_commission_goal 
        ,old_renewal_revenue_goal 
        ,new_renewal_revenue_goal 
        ,old_renewal_commission_goal 
        ,new_renewal_commission_goal 
        ,old_replacement_revenue_goal 
        ,new_replacement_revenue_goal 
        ,old_replacement_commission_goal 
        ,new_replacement_commission_goal 
        ,old_notes 
        ,new_notes 
        ,old_include_in_book_of_business 
        ,new_include_in_book_of_business 
        ,old_over_payement_payee 
        ,new_over_payement_payee 
        ,old_internal_payee 
        ,new_internal_payee 
        ,old_last_modified_on 
        ,new_last_modified_on 
        ,old_created_on 
        ,new_created_on 
        ,audit_action 
    )
    select   old.payee_id 
            ,old.payee_type 
            ,new.payee_type 
            ,old.payee_code 
            ,new.payee_code 
            ,old.house_account 
            ,new.house_account 
            ,old.tax_payer_id_number 
            ,new.tax_payer_id_number 
            ,old.revenue_goal 
            ,new.revenue_goal 
            ,old.commission_goal 
            ,new.commission_goal 
            ,old.renewal_revenue_goal 
            ,new.renewal_revenue_goal 
            ,old.renewal_commission_goal 
            ,new.renewal_commission_goal 
            ,old.replacement_revenue_goal 
            ,new.replacement_revenue_goal 
            ,old.replacement_commission_goal 
            ,new.replacement_commission_goal 
            ,old.notes 
            ,new.notes 
            ,old.include_in_book_of_business 
            ,new.include_in_book_of_business 
            ,old.over_payement_payee 
            ,new.over_payement_payee 
            ,old.internal_payee 
            ,new.internal_payee 
            ,old.last_modified_on 
            ,new.last_modified_on 
            ,old.created_on 
            ,new.created_on 
            ,'U'; 
    return old;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_payee_u() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_payee_u() to rl_benefitpoint_x;
go 
create or replace function benefitpoint.tr_audit_payee_i() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_payee (
         payee_id 
        ,new_payee_type 
        ,new_payee_code 
        ,new_house_account 
        ,new_tax_payer_id_number 
        ,new_revenue_goal 
        ,new_commission_goal 
        ,new_renewal_revenue_goal 
        ,new_renewal_commission_goal 
        ,new_replacement_revenue_goal 
        ,new_replacement_commission_goal 
        ,new_notes 
        ,new_include_in_book_of_business 
        ,new_over_payement_payee 
        ,new_internal_payee 
        ,new_last_modified_on 
        ,new_created_on 
        ,audit_action 
    )
    select   new.payee_id 
            ,new.payee_type 
            ,new.payee_code 
            ,new.house_account 
            ,new.tax_payer_id_number 
            ,new.revenue_goal 
            ,new.commission_goal 
            ,new.renewal_revenue_goal 
            ,new.renewal_commission_goal 
            ,new.replacement_revenue_goal 
            ,new.replacement_commission_goal 
            ,new.notes 
            ,new.include_in_book_of_business 
            ,new.over_payement_payee 
            ,new.internal_payee 
            ,new.last_modified_on 
            ,new.created_on 
            ,'I'; 
    return new;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_payee_i() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_payee_i() to rl_benefitpoint_x;
go 
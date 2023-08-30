create or replace function benefitpoint.tr_audit_company_payee_i() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_company_payee (
         payee_id 
        ,new_company_name 
        ,new_vendor_number 
        ,new_website 
        ,new_agency_account_id 
        ,new_company_1099 
        ,audit_action 
    )
    select   new.payee_id 
            ,new.company_name 
            ,new.vendor_number 
            ,new.website 
            ,new_agency_account_id 
            ,new_company_1099 
            ,'I'; 
    return new;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_company_payee_i() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_company_payee_i() to rl_benefitpoint_x;
go 
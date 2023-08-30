 create or replace function benefitpoint.tr_audit_company_payee_u() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_company_payee (
         payee_id 
        ,old_company_name 
        ,new_company_name 
        ,old_vendor_number 
        ,new_vendor_number 
        ,old_website 
        ,new_website 
        ,old_agency_account_id 
        ,new_agency_account_id 
        ,old_company_1099 
        ,new_company_1099 
        ,audit_action 
    )
    select   old.payee_id 
            ,old.company_name 
            ,new.company_name 
            ,old.vendor_number 
            ,new.vendor_number 
            ,old.website 
            ,new.website 
            ,old.agency_account_id 
            ,new.agency_account_id 
            ,old.company_1099 
            ,new.company_1099 
            ,'U'; 
    return old;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_company_payee_u() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_company_payee_u() to rl_benefitpoint_x;
go 
create or replace function benefitpoint.tr_audit_company_payee_d() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_company_payee (
         payee_id 
        ,old_company_name 
        ,old_vendor_number 
        ,old_website 
        ,old_agency_account_id 
        ,old_company_1099 
        ,audit_action 
    )
    select   old.payee_id 
            ,old.company_name 
            ,old.vendor_number 
            ,old.website 
            ,old.agency_account_id 
            ,old.company_1099 
            ,'D'; 
    return old;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_company_payee_d() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_company_payee_d() to rl_benefitpoint_x;
go 
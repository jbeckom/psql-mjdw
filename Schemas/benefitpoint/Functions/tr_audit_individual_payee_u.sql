create or replace function benefitpoint.tr_audit_individual_payee_u() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_individual_payee (
         payee_id 
        ,old_tax_status 
        ,new_tax_status 
        ,old_company_name 
        ,new_company_name 
        ,old_department_code 
        ,new_department_code 
        ,old_employee_code 
        ,new_employee_code 
        ,old_agent_account_id 
        ,new_agent_account_id 
        ,old_user_id 
        ,new_user_id 
        ,audit_action 
    )
    select   old.payee_id 
            ,old.tax_status 
            ,new.tax_status 
            ,old.company_name 
            ,new.company_name 
            ,old.department_code 
            ,new.department_code 
            ,old.employee_code 
            ,new.employee_code 
            ,old.agent_account_id 
            ,new.agent_account_id 
            ,old.user_id 
            ,new.user_id 
            ,'U'; 
    return old;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_individual_payee_u() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_individual_payee_u() to rl_benefitpoint_x;
go 

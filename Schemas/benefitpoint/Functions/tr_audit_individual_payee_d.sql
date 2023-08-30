create or replace function benefitpoint.tr_audit_individual_payee_d() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_individual_payee (
         payee_id 
        ,old_tax_status 
        ,old_company_name 
        ,old_department_code 
        ,old_employee_code 
        ,old_agent_account_id 
        ,old_user_id 
        ,audit_action 
    )
    select   old.payee_id 
            ,old.tax_status 
            ,old.company_name 
            ,old.department_code 
            ,old.employee_code 
            ,old.agent_account_id 
            ,old.user_id 
            ,'D'; 
    return old;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_individual_payee_d() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_individual_payee_d() to rl_benefitpoint_x;
go 

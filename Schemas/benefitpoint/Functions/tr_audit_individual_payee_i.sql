create or replace function benefitpoint.tr_audit_individual_payee_i() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_individual_payee (
         payee_id 
        ,new_tax_status 
        ,new_company_name 
        ,new_department_code 
        ,new_employee_code 
        ,new_agent_account_id 
        ,new_user_id 
        ,audit_action 
    )
    select   new.payee_id 
            ,new.tax_status 
            ,new.company_name 
            ,new.department_code 
            ,new.employee_code 
            ,new.agent_account_id 
            ,new.user_id 
            ,'I'; 
    return new;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_individual_payee_i() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_individual_payee_i() to rl_benefitpoint_x;
go 

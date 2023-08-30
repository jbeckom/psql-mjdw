create or replace function sagitta.tr_audit_payees_div_dept_designations_u() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_payees_div_dept_designations (
         sagitem 
        ,lis 
        ,old_valid_div 
        ,new_valid_div 
        ,old_valid_dept 
        ,new_valid_dept 
        ,old_limit_new 
        ,new_limit_new 
        ,old_limit_new_date 
        ,new_limit_new_date 
        ,old_limit_renew 
        ,new_limit_renew 
        ,old_limit_renew_date 
        ,new_limit_renew_date 
        ,audit_action 
    )
    select   old.sagitem 
            ,old.lis 
            ,old.valid_div 
            ,new_valid_div 
            ,old.valid_dept 
            ,new_valid_dept 
            ,old.limit_new 
            ,new_limit_new 
            ,old.limit_new_date 
            ,new_limit_new_date 
            ,old.limit_renew 
            ,new_limit_renew 
            ,old.limit_renew_date 
            ,new_limit_renew_date 
            ,'U';
    return old; 
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_payees_div_dept_designations_u() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_payees_div_dept_designations_u() to rl_sagitta_x;
go 
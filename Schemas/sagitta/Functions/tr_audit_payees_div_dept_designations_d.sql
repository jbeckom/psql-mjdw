create or replace function sagitta.tr_audit_payees_div_dept_designations_d() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_payees_div_dept_designations (
         sagitem 
        ,lis 
        ,old_valid_div 
        ,old_valid_dept 
        ,old_limit_new 
        ,old_limit_new_date 
        ,old_limit_renew 
        ,old_limit_renew_date 
        ,audit_action 
    )
    select   old.sagitem 
            ,old.lis 
            ,old.valid_div 
            ,old.valid_dept 
            ,old.limit_new 
            ,old.limit_new_date 
            ,old.limit_renew 
            ,old.limit_renew_date 
            ,'D';
    return old; 
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_payees_div_dept_designations_d() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_payees_div_dept_designations_d() to rl_sagitta_x;
go 
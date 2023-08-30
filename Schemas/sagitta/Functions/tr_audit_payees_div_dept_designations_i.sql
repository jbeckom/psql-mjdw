create or replace function sagitta.tr_audit_payees_div_dept_designations_i() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_payees_div_dept_designations (
         sagitem 
        ,lis 
        ,new_valid_div 
        ,new_valid_dept 
        ,new_limit_new 
        ,new_limit_new_date 
        ,new_limit_renew 
        ,new_limit_renew_date 
        ,audit_action 
    )
    select   new.sagitem 
            ,new.lis 
            ,new.valid_div 
            ,new.valid_dept 
            ,new.limit_new 
            ,new.limit_new_date 
            ,new.limit_renew 
            ,new.limit_renew_date 
            ,'I';
    return new; 
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_payees_div_dept_designations_i() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_payees_div_dept_designations_i() to rl_sagitta_x;
go 
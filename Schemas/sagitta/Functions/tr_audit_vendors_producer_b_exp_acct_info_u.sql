create or replace function sagitta.tr_audit_vendors_producer_b_exp_acct_info_u() 
returns trigger 
language plpgsql 
as $$

BEGIN
    insert into sagitta.audit_vendors_producer_b_exp_acct_info (
         sagitem 
        ,lis 
        ,old_producer_b_exp_acct_number 
        ,new_producer_b_exp_acct_number 
        ,old_producer_db_exp_dept_ind 
        ,new_producer_db_exp_dept_ind 
        ,audit_action 
    )
    select   old.sagitem 
            ,old.lis 
            ,old.producer_b_exp_acct_number 
            ,new.producer_b_exp_acct_number 
            ,old.producer_db_exp_dept_ind 
            ,new.producer_db_exp_dept_ind 
            ,'U';
    return old; 
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_vendors_producer_b_exp_acct_info_u() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_vendors_producer_b_exp_acct_info_u() to rl_sagitta_x;
go 

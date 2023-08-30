create or replace function sagitta.tr_audit_chart_of_accounts_master_allocation_info_u()
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_chart_of_accounts_master_allocation_info (
         sagitem 
        ,old_alloc_gl_acct_number 
        ,new_alloc_gl_acct_number 
        ,old_allocation_pct 
        ,new_allocation_pct 
        ,audit_action 
    )
    select   old.sagitem 
            ,old.alloc_gl_acct_number 
            ,new.alloc_gl_acct_number 
            ,old.allocation_pct 
            ,new.allocation_pct 
            ,'U'; 
    return old;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_chart_of_accounts_master_allocation_info_u() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_chart_of_accounts_master_allocation_info_u() to rl_sagitta_x;
go
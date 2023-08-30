create or replace function sagitta.tr_audit_chart_of_accounts_master_allocation_info_d()
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_chart_of_accounts_master_allocation_info (
         sagitem 
        ,old_alloc_gl_acct_number 
        ,old_allocation_pct 
        ,audit_action 
    )
    select   old.sagitem 
            ,old.alloc_gl_acct_number 
            ,old.allocation_pct 
            ,'D'; 
    return old;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_chart_of_accounts_master_allocation_info_d() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_chart_of_accounts_master_allocation_info_d() to rl_sagitta_x;
go
create or replace function sagitta.tr_audit_chart_of_accounts_master_allocation_info_i()
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_chart_of_accounts_master_allocation_info (
         sagitem 
        ,new_alloc_gl_acct_number 
        ,new_allocation_pct 
        ,audit_action 
    )
    select   new.sagitem 
            ,new.alloc_gl_acct_number 
            ,new.allocation_pct 
            ,'ID'; 
    return new;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_chart_of_accounts_master_allocation_info_i() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_chart_of_accounts_master_allocation_info_i() to rl_sagitta_x;
go
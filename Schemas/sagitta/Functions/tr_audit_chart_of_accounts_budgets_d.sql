create or replace function sagitta.tr_audit_chart_of_accounts_budgets_d()
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_chart_of_accounts_budgets (
         sagitem 
        ,lis 
        ,old_journal_id 
        ,old_debit_balance 
        ,old_credit_balance 
        ,old_memo_amt 
        ,audit_action 
    )
    select   old.sagitem 
            ,old.lis 
            ,old.journal_id 
            ,old.debit_balance 
            ,old.credit_balance 
            ,old.memo_amt 
            ,'D'; 
    return old;
end; 
$$; 
GO 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_chart_of_accounts_budgets_d() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_chart_of_accounts_budgets_d() to rl_sagitta_x;
go 
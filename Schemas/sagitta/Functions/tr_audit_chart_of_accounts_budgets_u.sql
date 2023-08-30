create or replace function sagitta.tr_audit_chart_of_accounts_budgets_u()
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_chart_of_accounts_budgets (
         sagitem 
        ,lis 
        ,old_journal_id 
        ,new_journal_id 
        ,old_debit_balance 
        ,new_debit_balance 
        ,old_credit_balance 
        ,new_credit_balance 
        ,old_memo_amt 
        ,new_memo_amt 
        ,audit_action 
    )
    select   old.sagitem 
            ,old.lis 
            ,old.journal_id 
            ,new.journal_id 
            ,old.debit_balance 
            ,new.debit_balance 
            ,old.credit_balance 
            ,new.credit_balance 
            ,old.memo_amt 
            ,new.memo_amt 
            ,'U'; 
    return old;
end; 
$$; 
GO 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_chart_of_accounts_budgets_u() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_chart_of_accounts_budgets_u() to rl_sagitta_x;
go 
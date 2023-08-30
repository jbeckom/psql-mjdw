create or replace function sagitta.sp_chart_of_accounts_budgets_upsert() 
returns int 
language plpgsql 
as $$

declare rc int;

begin 
    insert into sagitta.chart_of_accounts_budgets (
         sagitem 
        ,lis 
        ,journal_id 
        ,debit_balance 
        ,credit_balance 
        ,memo_amt 
    )
    select   sagitem 
            ,lis 
            ,journal_id 
            ,debit_balance 
            ,credit_balance 
            ,memo_amt 
    from    sagitta.stg_chart_of_accounts_budgets 
    on conflict (sagitem,lis) do update 
    set      journal_id         = excluded.journal_id 
            ,debit_balance      = excluded.debit_balance 
            ,credit_balance     = excluded.credit_balance 
            ,memo_amt           = excluded.memo_amt 
    where   (chart_of_accounts_budgets.journal_id,chart_of_accounts_budgets.debit_balance,chart_of_accounts_budgets.credit_balance,chart_of_accounts_budgets.memo_amt) 
        is distinct from    (excluded.journal_id,excluded.debit_balance,excluded.credit_balance,excluded.memo_amt); 

    get diagnostics rc = row_count;

    return rc;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function sagitta.sp_chart_of_accounts_budgets_upsert() owner to mj_admin;
go 

grant execute on function sagitta.sp_chart_of_accounts_budgets_upsert() to rl_sagitta_x;
go 
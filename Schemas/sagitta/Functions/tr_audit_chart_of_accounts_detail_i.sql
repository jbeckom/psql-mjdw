create or replace function sagitta.tr_audit_chart_of_accounts_detail_i()
returns trigger 
language plpgsql 
as $$

begin 
    insert into sagitta.audit_chart_of_accounts_detail(
         sagitem 
        ,lis 
        ,new_journal_id 
        ,new_debit_balance 
        ,new_credit_balance 
        ,new_memo_amt 
        ,audit_action 
    )
    select   new.sagitem 
            ,new.lis 
            ,new.journal_id 
            ,new.debit_balance 
            ,new.credit_balance 
            ,new.memo_amt 
            ,'I'; 
    return new; 
end;
$$;
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_chart_of_accounts_detail_i() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_chart_of_accounts_detail_i() to rl_sagitta_x;
go 
drop table if exists sagitta.audit_chart_of_accounts_detail;

create table if not exists sagitta.audit_chart_of_accounts_detail (
     sagitem                        text            not null 
    ,lis                            int             not null 
    ,old_journal_id                 text            null 
    ,new_journal_id                 text            null 
    ,old_debit_balance              text            null 
    ,new_debit_balance              text            null 
    ,old_credit_balance            text            null 
    ,new_credit_balance            text            null 
    ,old_memo_amt                   text            null 
    ,new_memo_amt                   text            null 
    ,audit_action                   char(1)         not null 
    ,audit_user                     text            not null            default current_user 
    ,audit_timestamp                timestamp       not null            default timezone('utc'::text, clock_timestamp())
    ,audit_id                       bigint          not null            generated always as identity            primary key 
);
go 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.audit_chart_of_accounts_detail OWNER TO mj_admin;
GO 

GRANT INSERT ON TABLE sagitta.audit_chart_of_accounts_detail TO rl_sagitta_a;
GO 

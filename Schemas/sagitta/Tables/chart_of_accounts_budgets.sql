drop table if exists sagitta.chart_of_accounts_budgets;

create table if not exists sagitta.chart_of_accounts_budgets (
     sagitem                    text            not null 
    ,lis                        text            not null 
    ,journal_id                 text            null 
    ,debit_balance              text            null 
    ,credit_balance             text            null 
    ,memo_amt                   text            null 
    ,constraint chart_of_accounts_budgets_pkey  primary key (sagitem,lis)
);
go 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.chart_of_accounts_budgets OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE sagitta.chart_of_accounts_budgets TO rl_sagitta_r;
GO 

GRANT INSERT ON TABLE sagitta.chart_of_accounts_budgets TO rl_sagitta_a;
GO 

GRANT UPDATE ON TABLE sagitta.chart_of_accounts_budgets TO rl_sagitta_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON sagitta.chart_of_accounts_budgets FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_chart_of_accounts_budgets_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON sagitta.chart_of_accounts_budgets FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_chart_of_accounts_budgets_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON sagitta.chart_of_accounts_budgets FOR EACH ROW WHEN (NEW IS DISTINCT FROM OLD) EXECUTE FUNCTION sagitta.tr_audit_chart_of_accounts_budgets_u();
GO 
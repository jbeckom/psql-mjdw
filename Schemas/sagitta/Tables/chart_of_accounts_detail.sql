drop table if exists sagitta.chart_of_accounts_detail;

create table if not exists sagitta.chart_of_accounts_detail (
     sagitem                    text            not null 
    ,lis                        int             not null 
    ,journal_id                 text            null 
    ,debit_balance              text            null 
    ,credit_balance            text            null 
    ,memo_amt                   text            null 
    ,constraint chart_of_accounts_detail_pkey   primary key (sagitem,lis)
);
go 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.chart_of_accounts_detail OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE sagitta.chart_of_accounts_detail TO rl_sagitta_r;
GO 

GRANT INSERT ON TABLE sagitta.chart_of_accounts_detail TO rl_sagitta_a;
GO 

GRANT UPDATE ON TABLE sagitta.chart_of_accounts_detail TO rl_sagitta_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON sagitta.chart_of_accounts_detail FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_chart_of_accounts_detail_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON sagitta.chart_of_accounts_detail FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_chart_of_accounts_detail_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON sagitta.chart_of_accounts_detail FOR EACH ROW WHEN (NEW IS DISTINCT FROM OLD) EXECUTE FUNCTION sagitta.tr_audit_chart_of_accounts_detail_u();
GO 
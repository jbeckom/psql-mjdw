create table sagitta.chart_of_accounts_master (
     sagitem 	                        		text 	    	not null 
	,audit_staff_cd 							text 			null 
	,audit_entry_dt 							int 			null 
	,audit_time 								int 			null 
	,audit_cd 									text 			null 
	,audit_history_record_number 				text 			null 
	,audit_program 								text 			null 
	,audit_effective_dt 						text 			null 
	,audit_change_agency_id 					text 			null 
    ,description                                text            null 
    ,normal_balance_amt                         text            null 
    ,ledger_type_cd                             text            null 
    ,period_end_dt                              text            null 
    ,close_to_account                           text            null 
    ,report_cd                                  text            null 
    ,base_pct                                   text            null 
    ,allocated_by                               text            null 
    ,gl_account_number                          text            null 
    ,constraint chart_of_accounts_master_pkey   primary key (sagitem)
);
go 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.chart_of_accounts_master OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE sagitta.chart_of_accounts_master TO rl_sagitta_r;
GO 

GRANT INSERT ON TABLE sagitta.chart_of_accounts_master TO rl_sagitta_a;
GO 

GRANT UPDATE ON TABLE sagitta.chart_of_accounts_master TO rl_sagitta_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON sagitta.chart_of_accounts_master FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_chart_of_accounts_master_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON sagitta.chart_of_accounts_master FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_chart_of_accounts_master_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON sagitta.chart_of_accounts_master FOR EACH ROW WHEN (NEW IS DISTINCT FROM OLD) EXECUTE FUNCTION sagitta.tr_audit_chart_of_accounts_master_u();
GO 
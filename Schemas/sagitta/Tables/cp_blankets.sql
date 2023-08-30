CREATE TABLE sagitta.cp_blankets (
	 sagitem 								int 		NOT NULL 
	,audit_staff_cd 						TEXT 		NULL 
	,audit_entry_dt 						int 		NULL 
	,audit_time 							int 		NULL 
	,audit_cd 								TEXT 		NULL 
	,audit_history_record_number 			TEXT 		NULL 
	,audit_program 							TEXT 		NULL 
	,audit_effective_dt 					TEXT 		NULL 
	,audit_change_agency_id 				TEXT 		NULL 
	,blanket_number 						TEXT 		NULL 
	,policy_agency_id 						TEXT 		NULL 
	,cause 									TEXT 		NULL 
	,coinsurance_pct 						TEXT 		NULL 
	,inflation_guard_pct 					TEXT 		NULL 
	,rate 									TEXT 		NULL 
	,total_blk_limit 						TEXT 		NULL 
	,total_blk_premium 						TEXT 		NULL 
	,blanket_type_cd 						TEXT 		NULL 
	,blanket_type_desc 						TEXT 		NULL 
	,valuation_cd 							TEXT 		NULL 
	,agree_amt_ind 							TEXT 		NULL 
	,ded_symbol 							TEXT 		NULL 
	,ded_amt 								TEXT 		NULL 
	,deductible_type_cd 					TEXT 		NULL 
	,deductible_basis_cd 					TEXT 		NULL 
	,off_dt 								TEXT 		NULL 
	,start_dt 								TEXT 		NULL 
	,second_amt_value_type 					TEXT 		NULL 
	,second_amt_value 						TEXT 		NULL 
	,end_dt 								TEXT 		NULL 
	,CONSTRAINT cp_blankets_pkey PRIMARY KEY (sagitem)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.cp_blankets OWNER TO mj_admin;
GO 

GRANT SELECT ON sagitta.cp_blankets TO rl_sagitta_r;
GO 

GRANT INSERT ON sagitta.cp_blankets TO rl_sagitta_a;
GO 

GRANT UPDATE ON sagitta.cp_blankets TO rl_sagitta_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON sagitta.cp_blankets FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_cp_blankets_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON sagitta.cp_blankets FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_cp_blankets_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON sagitta.cp_blankets FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION sagitta.tr_audit_cp_blankets_u();
GO 

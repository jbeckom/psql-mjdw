CREATE TABLE sagitta.audit_cp_blankets (
	 sagitem 								int 		NOT NULL 
	,old_audit_staff_cd 						TEXT 		NULL 
	,new_audit_staff_cd 						TEXT 		NULL 
	,old_audit_entry_dt 						int 		NULL 
	,new_audit_entry_dt 						int 		NULL 
	,old_audit_time 							int 		NULL 
	,new_audit_time 							int 		NULL 
	,old_audit_cd 								TEXT 		NULL 
	,new_audit_cd 								TEXT 		NULL 
	,old_audit_history_record_number 			TEXT 		NULL 
	,new_audit_history_record_number 			TEXT 		NULL 
	,old_audit_program 							TEXT 		NULL 
	,new_audit_program 							TEXT 		NULL 
	,old_audit_effective_dt 					TEXT 		NULL 
	,new_audit_effective_dt 					TEXT 		NULL 
	,old_audit_change_agency_id 				TEXT 		NULL 
	,new_audit_change_agency_id 				TEXT 		NULL 
	,old_blanket_number 						TEXT 		NULL 
	,new_blanket_number 						TEXT 		NULL 
	,old_policy_agency_id 						TEXT 		NULL 
	,new_policy_agency_id 						TEXT 		NULL 
	,old_cause 									TEXT 		NULL 
	,new_cause 									TEXT 		NULL 
	,old_coinsurance_pct 						TEXT 		NULL 
	,new_coinsurance_pct 						TEXT 		NULL 
	,old_inflation_guard_pct 					TEXT 		NULL 
	,new_inflation_guard_pct 					TEXT 		NULL 
	,old_rate 									TEXT 		NULL 
	,new_rate 									TEXT 		NULL 
	,old_total_blk_limit 						TEXT 		NULL 
	,new_total_blk_limit 						TEXT 		NULL 
	,old_total_blk_premium 						TEXT 		NULL 
	,new_total_blk_premium 						TEXT 		NULL 
	,old_blanket_type_cd 						TEXT 		NULL 
	,new_blanket_type_cd 						TEXT 		NULL 
	,old_blanket_type_desc 						TEXT 		NULL 
	,new_blanket_type_desc 						TEXT 		NULL 
	,old_valuation_cd 							TEXT 		NULL 
	,new_valuation_cd 							TEXT 		NULL 
	,old_agree_amt_ind 							TEXT 		NULL 
	,new_agree_amt_ind 							TEXT 		NULL 
	,old_ded_symbol 							TEXT 		NULL 
	,new_ded_symbol 							TEXT 		NULL 
	,old_ded_amt 								TEXT 		NULL 
	,new_ded_amt 								TEXT 		NULL 
	,old_deductible_type_cd 					TEXT 		NULL 
	,new_deductible_type_cd 					TEXT 		NULL 
	,old_deductible_basis_cd 					TEXT 		NULL 
	,new_deductible_basis_cd 					TEXT 		NULL 
	,old_off_dt 								TEXT 		NULL 
	,new_off_dt 								TEXT 		NULL 
	,old_start_dt 								TEXT 		NULL 
	,new_start_dt 								TEXT 		NULL 
	,old_second_amt_value_type 					TEXT 		NULL 
	,new_second_amt_value_type 					TEXT 		NULL 
	,old_second_amt_value 						TEXT 		NULL 
	,new_second_amt_value 						TEXT 		NULL 
	,old_end_dt 								TEXT 		NULL 
	,new_end_dt 								TEXT 		NULL 
	,audit_action 								char(1) 	NOT NULL 
	,audit_user 								TEXT 		NOT NULL 		DEFAULT current_user 
	,audit_timestamp 							timestamp 	NOT NULL 		DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 									bigint 		NOT NULL 		GENERATED ALWAYS AS IDENTITY 		PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.audit_cp_blankets OWNER TO mj_admin;
GO 

GRANT INSERT ON sagitta.audit_cp_blankets TO rl_sagitta_a;
GO 

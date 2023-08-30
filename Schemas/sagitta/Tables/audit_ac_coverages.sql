CREATE TABLE sagitta.audit_ac_coverages (
	 sagitem 									int 		NOT NULL 
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
	,old_policy_agency_id 						TEXT 		NULL 
	,new_policy_agency_id 						TEXT 		NULL 
	,old_state_prov_cd 							TEXT 		NULL 
	,new_state_prov_cd 							TEXT 		NULL 
	,old_named_customer_name 					TEXT 		NULL 
	,new_named_customer_name 					TEXT 		NULL 
	,old_reporting 								TEXT 		NULL 
	,new_reporting 								TEXT 		NULL 
	,old_non_reporting 							TEXT 		NULL 
	,new_non_reporting 							TEXT 		NULL 
	,old_accts_rec_dep_premium_amt 				TEXT 		NULL 
	,new_accts_rec_dep_premium_amt 				TEXT 		NULL 
	,old_accts_rec_min_premium_amt 				TEXT 		NULL 
	,new_accts_rec_min_premium_amt 				TEXT 		NULL 
	,old_accts_rec_reporting_period 			TEXT 		NULL 
	,new_accts_rec_reporting_period 			TEXT 		NULL 
	,old_accts_rec_prem_adjustment_period_desc 	TEXT 		NULL 
	,new_accts_rec_prem_adjustment_period_desc 	TEXT 		NULL 
	,old_accts_rec_first_rate 					TEXT 		NULL 
	,new_accts_rec_first_rate 					TEXT 		NULL 
	,old_accts_re_second_rate 					TEXT 		NULL 
	,new_accts_re_second_rate 					TEXT 		NULL 
	,old_accts_rec_rate_premium_amt 			TEXT 		NULL 
	,new_accts_rec_rate_premium_amt 			TEXT 		NULL 
	,old_not_at_your_premises 					TEXT 		NULL 
	,new_not_at_your_premises 					TEXT 		NULL 
	,old_all_covered_prop_all_location 			TEXT 		NULL 
	,new_all_covered_prop_all_location 			TEXT 		NULL 
	,old_accts_rec_in_transit_limit 			TEXT 		NULL 
	,new_accts_rec_in_transit_limit 			TEXT 		NULL 
	,old_accts_rec_collapse 					TEXT 		NULL 
	,new_accts_rec_collapse 					TEXT 		NULL 
	,old_accts_rec_removal 						TEXT 		NULL 
	,new_accts_rec_removal 						TEXT 		NULL 
	,old_libraries_endorsment_applies 			TEXT 		NULL 
	,new_libraries_endorsment_applies 			TEXT 		NULL 
	,old_val_papers_lmt_away_from_premises 		TEXT 		NULL 
	,new_val_papers_lmt_away_from_premises 		TEXT 		NULL 
	,old_val_papers_blanket 					TEXT 		NULL 
	,new_val_papers_blanket 					TEXT 		NULL 
	,old_val_papers_blanket_amt 				TEXT 		NULL 
	,new_val_papers_blanket_amt 				TEXT 		NULL 
	,old_val_papers_specified 					TEXT 		NULL 
	,new_val_papers_specified 					TEXT 		NULL 
	,old_val_papers_specified_amt 				TEXT 		NULL 
	,new_val_papers_specified_amt 				TEXT 		NULL 
	,old_val_papers_collapse 					TEXT 		NULL 
	,new_val_papers_collapse 					TEXT 		NULL 
	,old_val_papers_occurence_ded_amt 			TEXT 		NULL 
	,new_val_papers_occurence_ded_amt 			TEXT 		NULL 
	,old_val_papers_removal 					TEXT 		NULL 
	,new_val_papers_removal 					TEXT 		NULL 
	,old_val_papers_removal_limit 				TEXT 		NULL 
	,new_val_papers_removal_limit 				TEXT 		NULL 
	,old_off_dt 								TEXT 		NULL 
	,new_off_dt 								TEXT 		NULL 
	,old_accts_rec_reporting_period_cd 			TEXT 		NULL 
	,new_accts_rec_reporting_period_cd 			TEXT 		NULL 
	,audit_action 								char(1) 	NOT NULL  
	,audit_user 								TEXT 		NOT NULL 	DEFAULT current_user 
	,audit_timestamp 							timestamp 	NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp()) 
	,audit_id 									bigint 		NOT NULL 	GENERATED ALWAYS AS IDENTITY 	PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.audit_ac_coverages OWNER TO mj_admin;
GO 

GRANT INSERT ON TABLE sagitta.audit_ac_coverages TO rl_sagitta_a;
GO 
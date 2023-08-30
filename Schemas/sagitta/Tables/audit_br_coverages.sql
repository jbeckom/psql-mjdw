CREATE TABLE sagitta.audit_br_coverages (
	 sagitem 									int 		NOT NULL 
	,old_audit_staff_cd 							TEXT 		NULL 
	,new_audit_staff_cd 							TEXT 		NULL 
	,old_audit_entry_dt 							int  		NULL 
	,new_audit_entry_dt 							int  		NULL 
	,old_audit_time 								int 		NULL 
	,new_audit_time 								int 		NULL 
	,old_audit_cd 									TEXT 		NULL 
	,new_audit_cd 									TEXT 		NULL 
	,old_audit_history_record_number 				TEXT 		NULL 
	,new_audit_history_record_number 				TEXT 		NULL 
	,old_audit_program 								TEXT 		NULL 
	,new_audit_program 								TEXT 		NULL 
	,old_audit_effective_dt 						TEXT 		NULL 
	,new_audit_effective_dt 						TEXT 		NULL 
	,old_audit_change_agency_id 					TEXT 		NULL 
	,new_audit_change_agency_id 					TEXT 		NULL 
	,old_policy_agency_id 							TEXT 		NULL 
	,new_policy_agency_id 							TEXT 		NULL 
	,old_builders_risk_yes_no_cd 					TEXT 		NULL 
	,new_builders_risk_yes_no_cd 					TEXT 		NULL 
	,old_installation_yes_no_cd 					TEXT 		NULL 
	,new_installation_yes_no_cd 					TEXT 		NULL 
	,old_open_reporting_ind 						TEXT 		NULL 
	,new_open_reporting_ind 						TEXT 		NULL 
	,old_job_specified_ind 							TEXT 		NULL 
	,new_job_specified_ind 							TEXT 		NULL 
	,old_completed_value 							TEXT 		NULL 
	,new_completed_value 							TEXT 		NULL 
	,old_job_specific_location_limit 				TEXT 		NULL 
	,new_job_specific_location_limit 				TEXT 		NULL 
	,old_job_specific_temporary_limit 				TEXT 		NULL 
	,new_job_specific_temporary_limit 				TEXT 		NULL 
	,old_job_specific_transit_limit 				TEXT 		NULL 
	,new_job_specific_transit_limit 				TEXT 		NULL 
	,old_job_specific_max_paid 						TEXT 		NULL 
	,new_job_specific_max_paid 						TEXT 		NULL 
	,old_first_any_one_location_limit 				TEXT 		NULL 
	,new_first_any_one_location_limit 				TEXT 		NULL 
	,old_first_any_one_location_construction 		TEXT 		NULL 
	,new_first_any_one_location_construction 		TEXT 		NULL 
	,old_second_any_one_location_limit 				TEXT 		NULL 
	,new_second_any_one_location_limit 				TEXT 		NULL 
	,old_second_any_one_location_construction 		TEXT 		NULL 
	,new_second_any_one_location_construction 		TEXT 		NULL 
	,old_per_disaster_limit 						TEXT 		NULL 
	,new_per_disaster_limit 						TEXT 		NULL 
	,old_temporary_location_limit 					TEXT 		NULL 
	,new_temporary_location_limit 					TEXT 		NULL 
	,old_transit_limit 								TEXT 		NULL 
	,new_transit_limit 								TEXT 		NULL 
	,old_addl_cov_ind 								TEXT 		NULL 
	,new_addl_cov_ind 								TEXT 		NULL 
	,old_off_dt 									TEXT 		NULL 
	,new_off_dt 									TEXT 		NULL 
	,old_reporting_annual_premium_amt 				TEXT 		NULL 
	,new_reporting_annual_premium_amt 				TEXT 		NULL 
	,old_reporting_adj_period 						TEXT 		NULL 
	,new_reporting_adj_period 						TEXT 		NULL 
	,old_reporting_deposit_amt 						TEXT 		NULL 
	,new_reporting_deposit_amt 						TEXT 		NULL 
	,old_reporting_period 							TEXT 		NULL 
	,new_reporting_period 							TEXT 		NULL 
	,audit_action 									char(1) 	NOT NULL 
	,audit_user 									TEXT 		NOT NULL 	DEFAULT current_user 
	,audit_timestamp 								timestamp 	NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 										bigint 		NOT NULL 	GENERATED ALWAYS AS IDENTITY 	PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.audit_br_coverages OWNER TO mj_admin;
GO 

GRANT INSERT ON sagitta.audit_br_coverages TO rl_sagitta_a;
GO 
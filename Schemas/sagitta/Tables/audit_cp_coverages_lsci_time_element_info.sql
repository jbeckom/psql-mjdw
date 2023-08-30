CREATE TABLE sagitta.audit_cp_coverages_lsci_time_element_info (
	 sagitem 													TEXT 		NOT NULL 
	,lis 														int 		NOT NULL 
	,old_time_element_subject_insurance_cd 						TEXT 		NULL 
	,new_time_element_subject_insurance_cd 						TEXT 		NULL 
	,old_time_element_subject_insurance_desc 					TEXT 		NULL 
	,new_time_element_subject_insurance_desc 					TEXT 		NULL 
	,old_time_element_monthy_limit 								TEXT 		NULL 
	,new_time_element_monthy_limit 								TEXT 		NULL 
	,old_time_element_num_days 									TEXT 		NULL 
	,new_time_element_num_days 									TEXT 		NULL 
	,old_time_element_floor_area_num_units 						TEXT 		NULL 
	,new_time_element_floor_area_num_units 						TEXT 		NULL 
	,old_time_element_manufacturing_area_num_units 				TEXT 		NULL 
	,new_time_element_manufacturing_area_num_units 				TEXT 		NULL 
	,old_time_element_mercantile_area_num_units 				TEXT 		NULL 
	,new_time_element_mercantile_area_num_units 				TEXT 		NULL 
	,old_time_element_option_cd 								TEXT 		NULL 
	,new_time_element_option_cd 								TEXT 		NULL 
	,old_time_element_limit_on_loss_cd 							TEXT 		NULL 
	,new_time_element_limit_on_loss_cd 							TEXT 		NULL 
	,old_time_element_payroll_cd 								TEXT 		NULL 
	,new_time_element_payroll_cd 								TEXT 		NULL 
	,old_time_element_payroll_amt 								TEXT 		NULL 
	,new_time_element_payroll_amt 								TEXT 		NULL 
	,old_time_element_num_extension_business_income_days 		TEXT 		NULL 
	,new_time_element_num_extension_business_income_days 		TEXT 		NULL 
	,old_time_element_maximum_indemnity_period 					TEXT 		NULL 
	,new_time_element_maximum_indemnity_period 					TEXT 		NULL 
	,audit_action 												char(1) 		NOT NULL 
	,audit_user 												TEXT 			NOT NULL 		DEFAULT current_user 
	,audit_timestamp 											timestamp 		NOT NULL 		DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 													bigint 			NOT NULL 		GENERATED ALWAYS AS IDENTITY 		PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.audit_cp_coverages_lsci_time_element_info OWNER TO mj_admin;
GO 

GRANT INSERT ON sagitta.audit_cp_coverages_lsci_time_element_info TO rl_sagitta_a;
GO 

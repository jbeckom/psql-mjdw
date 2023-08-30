CREATE TABLE IF NOT EXISTS benefitpoint.audit_group_account_info (
	 account_id 										int 							NOT NULL 
	,old_account_name 									varchar(100) 					NULL 
	,new_account_name 									varchar(100) 					NULL 
	,old_dba 											varchar(100) 					NULL 
	,new_dba 											varchar(100) 					NULL 
	,old_number_of_ftes 								int 							NULL 
	,new_number_of_ftes 								int 							NULL 
	,old_number_of_ftes_as_of 							timestamp 						NULL 
	,new_number_of_ftes_as_of 							timestamp 						NULL 
	,old_number_of_full_time_equivalents 				int 							NULL 
	,new_number_of_full_time_equivalents 				int 							NULL 
	,old_number_of_full_time_equivalents_as_of_date 	timestamp 						NULL 
	,new_number_of_full_time_equivalents_as_of_date 	timestamp 						NULL 
	,old_coverage_subject_to_employer_mandate 			bool 							NULL 
	,new_coverage_subject_to_employer_mandate 			bool 							NULL 
	,old_market_size 									TEXT 							NULL 
	,new_market_size 									TEXT 							NULL 
	,old_business_type 									TEXT 							NULL 
	,new_business_type 									TEXT 							NULL 
	,old_sic_code 										varchar(20) 					NULL 
	,new_sic_code 										varchar(20) 					NULL 
	,old_naics_code 									varchar(100) 					NULL 
	,new_naics_code 									varchar(100) 					NULL 
	,old_requires_5500 									benefitpoint.optional_boolean 	NULL 
	,new_requires_5500 									benefitpoint.optional_boolean 	NULL 
	,old_locations_by_zip 								varchar(256) 					NULL 
	,new_locations_by_zip 								varchar(256) 					NULL 
	,old_affiliates 									varchar(512) 					NULL 
	,new_affiliates 									varchar(512) 					NULL 
	,old_budgeted_total_annual_premium 					double PRECISION 				NULL 
	,new_budgeted_total_annual_premium 					double PRECISION 				NULL 
	,old_budgeted_total_annual_revenue 					double PRECISION 				NULL 
	,new_budgeted_total_annual_revenue 					double PRECISION 				NULL 
	,old_multiple_payroll_cycles 						bool 							NULL 
	,new_multiple_payroll_cycles 						bool 							NULL 
	,old_multiple_payroll_cycles_differ_by 				TEXT 							NULL 
	,new_multiple_payroll_cycles_differ_by 				TEXT 							NULL 
	,old_single_payroll_cycle 							TEXT 							NULL 
	,new_single_payroll_cycle 							TEXT 							NULL 
	,audit_action 										char(1) 						NOT NULL 
	,audit_user 										TEXT 							NOT NULL 	DEFAULT current_user 
	,audit_timestamp 									timestamp 						NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp()) 
	,audit_id 											bigint 							NOT NULL 	GENERATED ALWAYS AS IDENTITY 	PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.audit_group_account_info OWNER TO mj_admin;
GO 

GRANT INSERT ON TABLE benefitpoint.audit_group_account_info TO rl_benefitpoint_a;
GO 

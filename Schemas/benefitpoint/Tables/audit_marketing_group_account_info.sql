CREATE TABLE benefitpoint.audit_marketing_group_account_info (
	 account_id 										int 								NOT NULL 
	,old_marketing_group_name 							varchar(100) 						NULL 
	,new_marketing_group_name 							varchar(100) 						NULL 
	,old_marketing_group_type 							benefitpoint.marketing_group_type 	NULL 
	,new_marketing_group_type 							benefitpoint.marketing_group_type 	NULL 
	,old_number_of_ftes 								int 								NULL 
	,new_number_of_ftes 								int 								NULL 
	,old_number_of_ftes_as_of 							timestamp 							NULL 
	,new_number_of_ftes_as_of 							timestamp 							NULL 
	,old_number_of_full_time_equivalents 				int 								NULL 
	,new_number_of_full_time_equivalents 				int 								NULL 
	,old_number_of_full_time_equivalents_as_of_date 	timestamp 							NULL 
	,new_number_of_full_time_equivalents_as_of_date 	timestamp 							NULL 
	,old_coverage_subject_to_employer_mandate 			bool 								NULL 
	,new_coverage_subject_to_employer_mandate 			bool 								NULL 
	,audit_action 										char(1) 							NOT NULL 
	,audit_user 										TEXT 								NOT NULL 	DEFAULT current_user 
	,audit_timestamp 									timestamp 							NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 											bigint 								NOT NULL 	GENERATED ALWAYS AS IDENTITY 	PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.audit_marketing_group_account_info OWNER TO mj_admin;
GO 

GRANT INSERT ON TABLE benefitpoint.audit_marketing_group_account_info TO rl_benefitpoint_a;
GO 

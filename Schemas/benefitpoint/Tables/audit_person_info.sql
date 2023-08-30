CREATE TABLE benefitpoint.audit_person_info (
	 person_source 			TEXT 							NOT NULL 
	,source_type 			TEXT 							NOT NULL 
	,source_key 			int 							NOT NULL 
	,old_first_name 		varchar(100) 					NULL 
	,new_first_name 		varchar(100) 					NULL 
	,old_middle_name 		varchar(100)					NULL 
	,new_middle_name 		varchar(100)					NULL 
	,old_last_name 			varchar(100) 					NULL 
	,new_last_name 			varchar(100) 					NULL 
	,old_salutation 		benefitpoint.salutation 		NULL 
	,new_salutation 		benefitpoint.salutation 		NULL 
	,old_date_of_birth 		date 							NULL 
	,new_date_of_birth 		date 							NULL 
	,old_gender 			benefitpoint.gender 			NULL 
	,new_gender 			benefitpoint.gender 			NULL 
	,old_ssn 				varchar(11) 					NULL 
	,new_ssn 				varchar(11) 					NULL 
	,old_marital_status 	benefitpoint.marital_status 	NULL 
	,new_marital_status 	benefitpoint.marital_status 	NULL 
	,audit_action 			char(1) 						NOT NULL 
	,audit_user 			TEXT 							NOT NULL 	DEFAULT current_user 
	,audit_timestamp 		timestamp 						NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 				bigint 							NOT NULL 	GENERATED ALWAYS AS IDENTITY 	PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.audit_person_info OWNER TO mj_admin;
GO 

GRANT INSERT ON TABLE benefitpoint.audit_person_info TO rl_benefitpoint_a;
GO 

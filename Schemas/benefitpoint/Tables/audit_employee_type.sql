CREATE TABLE benefitpoint.audit_employee_type (
	 account_id 			int 										NOT NULL
	,employee_type_id 	    int 										NOT NULL 
	,old_status 			benefitpoint.employment_status 				NULL 
	,new_status 			benefitpoint.employment_status 				NULL 
	,old_type 			    benefitpoint.employment_type 				NULL 
	,new_type 			    benefitpoint.employment_type 				NULL 
	,old_value 				int 										NULL 
	,new_value 				int 										NULL 
	,old_unit_of_measure 	benefitpoint.employment_unit_of_measure 	NULL 
	,new_unit_of_measure 	benefitpoint.employment_unit_of_measure 	NULL 
	,old_frequency 			benefitpoint.employment_frequency 			NULL 
	,new_frequency 			benefitpoint.employment_frequency 			NULL  
	,audit_action	 		char(1) 									NOT NULL 
	,audit_user 			TEXT 										NOT NULL 	DEFAULT current_user 
	,audit_timestamp 		timestamp 									NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 				bigint 										NOT NULL 	GENERATED ALWAYS AS IDENTITY 	PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.audit_employee_type OWNER TO mj_admin;
GO 

GRANT INSERT ON TABLE benefitpoint.audit_employee_type TO rl_benefitpoint_a;
GO 

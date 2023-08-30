CREATE TABLE IF NOT EXISTS benefitpoint.audit_license (
	 license_source			text 					not null 
	,source_key  			int 					NOT NULL 
	,license_id 			int 					NOT NULL 
	,old_state 					text 					NULL 
	,new_state 					text 					NULL 
	,old_license_number 		text 					NULL 
	,new_license_number 		text 					NULL 
	,old_residence_license 		bool 					NULL 
	,new_residence_license 		bool 					NULL 
	,old_license_on 			timestamp 				NULL 
	,new_license_on 			timestamp 				NULL 
	,old_license_expires_on 	timestamp 				NULL 
	,new_license_expires_on 	timestamp 				NULL 
	,old_e_and_o_expires_on 	timestamp 				NULL 
	,new_e_and_o_expires_on 	timestamp 				NULL 
	,audit_action 				char(1) 				NOT NULL 
	,audit_user 				TEXT 					NOT NULL 	DEFAULT current_user
	,audit_timestamp 			timestamp 				NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 					bigint 					NOT NULL 	GENERATED ALWAYS AS IDENTITY 	PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.audit_license OWNER TO mj_admin;
GO 

GRANT INSERT ON TABLE benefitpoint.audit_license TO rl_benefitpoint_a;
GO 

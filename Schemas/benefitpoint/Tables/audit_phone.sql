CREATE TABLE benefitpoint.audit_phone (
	 phone_source 		TEXT 						NOT NULL 
	,source_type 		TEXT 						NOT NULL 
	,source_key 		int 						NOT NULL 
	,old_area_code 		TEXT 						NULL 
	,new_area_code 		TEXT 						NULL
	,old_phone_number 	TEXT 						NULL 
	,new_phone_number 	TEXT 						NULL
	,old_phone_type 	benefitpoint.phone_type 	NULL 
	,new_phone_type 	benefitpoint.phone_type 	NULL 
	,audit_action 		char(1) 					NOT NULL 
	,audit_user 		TEXT 						NOT NULL 	DEFAULT current_user 
	,audit_timestamp 	timestamp 					NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 			bigint 						NOT NULL 	GENERATED ALWAYS AS IDENTITY 	
	,CONSTRAINT audit_phone_pkey PRIMARY KEY (audit_id)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.audit_phone OWNER TO mj_admin;
GO 

GRANT INSERT ON benefitpoint.audit_phone TO rl_benefitpoint_a;
GO 

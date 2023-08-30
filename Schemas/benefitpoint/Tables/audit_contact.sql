CREATE TABLE benefitpoint.audit_contact (
	 contact_source 	TEXT 		NOT NULL 
	,source_key 		int 		NOT NULL 
	,contact_id 		int 		NOT NULL 
	,old_first_name 	TEXT 		NULL 
	,new_first_name 	TEXT 		NULL 
	,old_last_name 		TEXT 		NULL 
	,new_last_name 		TEXT 		NULL 
	,old_email 			TEXT 		NULL 
	,new_email 			TEXT 		NULL 
	,audit_action 		char(1) 	NOT NULL 
	,audit_user 		TEXT 		NOT NULL 	DEFAULT current_user
	,audit_timestamp 	timestamp 	NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 			bigint 		NOT NULL 	GENERATED ALWAYS AS IDENTITY 
	,CONSTRAINT audit_contact_pkey PRIMARY KEY (audit_id)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.audit_contact OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE benefitpoint.audit_contact TO rl_benefitpoint_r;
GO 

GRANT INSERT ON TABLE benefitpoint.audit_contact TO rl_benefitpoint_a;
GO 
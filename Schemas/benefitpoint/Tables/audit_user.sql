CREATE TABLE benefitpoint.audit_user (
	 user_id 			    int 			NOT NULL 
	,old_username 			TEXT 			NULL 
    ,new_username 			TEXT 			NULL 
	,old_first_name 		TEXT 			NULL 
    ,new_first_name 		TEXT 			NULL 
	,old_last_name 			TEXT 			NULL 
    ,new_last_name 			TEXT 			NULL 
	,old_title 				TEXT 			NULL 
    ,new_title 				TEXT 			NULL 
	,old_office_id 			int 			NULL 
    ,new_office_id 			int 			NULL 
	,old_last_modified_on 	timestamptz 	NULL 
    ,new_last_modified_on 	timestamptz 	NULL 
	,old_last_login_on 		timestamptz 	NULL 
    ,new_last_login_on 		timestamptz 	NULL 
	,old_last_lockout_on 	timestamptz 	NULL 
    ,new_last_lockout_on 	timestamptz 	NULL 
	,old_roles 				TEXT 			NULL 
    ,new_roles 				TEXT 			NULL 
	,old_created_on 		timestamptz 	NULL 
    ,new_created_on 		timestamptz 	NULL 
	,old_notes 				TEXT 			NULL 
    ,new_notes 				TEXT 			NULL 
    ,audit_action 			char(1) 		NOT NULL 
    ,audit_user 			TEXT 			NOT NULL 	DEFAULT current_user 
    ,audit_timestamp 		timestamp 		NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 				bigint 			NOT NULL 	GENERATED ALWAYS AS IDENTITY 
	,CONSTRAINT audit_user_pkey PRIMARY KEY (audit_id)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.audit_user OWNER TO mj_admin;
GO 

GRANT INSERT ON TABLE benefitpoint.audit_user TO rl_benefitpoint_a;
GO 
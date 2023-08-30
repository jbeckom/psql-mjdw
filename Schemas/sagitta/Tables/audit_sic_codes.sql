CREATE TABLE IF NOT EXISTS sagitta.audit_sic_codes (
	 sagitem 			int 		NOT NULL 
	,old_uc				TEXT 		NULL 
	,new_uc				TEXT 		NULL 
	,old_description	TEXT 		NULL 
	,new_description	TEXT 		NULL 
	,old_category		TEXT 		NULL 
	,new_category		TEXT 		NULL 
	,audit_action 		char(1) 	NOT NULL 
	,audit_user 		TEXT 		NOT NULL 	DEFAULT current_user
	,audit_timestamp 	timestamp 	NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 			bigint 		NOT NULL 	GENERATED ALWAYS AS IDENTITY 	PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.audit_sic_codes OWNER TO mj_admin;
GO 

GRANT INSERT ON TABLE sagitta.audit_sic_codes TO rl_sagitta_a;
GO 
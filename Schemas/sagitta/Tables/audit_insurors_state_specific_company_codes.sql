CREATE TABLE sagitta.audit_insurors_state_specific_company_codes (
	 sagitem 					int 		NOT NULL 
	,lis 						int 		NOT NULL 
	,code_state 				TEXT 		NOT NULL 
	,state_company_code 		TEXT 		NOT NULL 
	,audit_action 				char(1) 	NOT NULL 
	,audit_user 				TEXT 		NOT NULL 		DEFAULT current_user 
	,audit_timestamp 			timestamp 	NOT NULL 		DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 					bigint 		NOT NULL 		GENERATED ALWAYS AS IDENTITY 	PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.audit_insurors_state_specific_company_codes OWNER TO mj_admin;
GO 

GRANT INSERT ON sagitta.audit_insurors_state_specific_company_codes TO rl_sagitta_a;
GO 
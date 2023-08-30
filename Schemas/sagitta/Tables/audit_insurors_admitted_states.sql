CREATE TABLE sagitta.audit_insurors_admitted_states (
 	 sagitem 				int 			NOT NULL 
	,lis 					int 			NOT NULL 
	,state_code 			TEXT 			NOT NULL 
	,audit_action 			char(1) 		NOT NULL 
	,audit_user 			TEXT 			NOT NULL 	DEFAULT current_user
	,audit_timestamp 		timestamp 		NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 				bigint 			NOT NULL 	GENERATED ALWAYS AS IDENTITY 	PRIMARY KEY 
);
GO

/*** PERMISSIONS ***/
ALTER TABLE sagitta.audit_insurors_admitted_states OWNER TO mj_admin;
GO 

GRANT INSERT ON sagitta.audit_insurors_admitted_states TO rl_sagitta_a;
GO 
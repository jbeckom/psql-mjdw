CREATE TABLE sagitta.audit_insurors_div_dept_designations (
	 sagitem 				int 		NOT NULL 
	,lis 					int 		NOT NULL 
	,valid_div 				TEXT 		NOT NULL 
	,valid_dept 			TEXT 		NOT NULL 
	,old_limit_new 			TEXT 		NULL 
	,new_limit_new 			TEXT 		NULL 
	,old_limit_new_date 	TEXT 		NULL 
	,new_limit_new_date 	TEXT 		NULL 
	,old_limit_renew 		TEXT 		NULL 
	,new_limit_renew 		TEXT 		NULL 
	,old_limit_renew_date 	TEXT 		NULL 
	,new_limit_renew_date 	TEXT 		NULL 
	,audit_action 			char(1) 	NOT NULL 
	,audit_user 			TEXT 		NOT NULL 	DEFAULT current_user
	,audit_timestamp 		timestamp 	NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 				bigint 		NOT NULL 	GENERATED ALWAYS AS IDENTITY 	PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.audit_insurors_div_dept_designations OWNER TO mj_admin;
GO 

GRANT INSERT ON sagitta.audit_insurors_div_dept_designations TO rl_sagitta_a;
GO 
CREATE TABLE sagitta.audit_br_coverages_completed_value_location_limit_info (
	 sagitem 										int 		NOT NULL 
	,lis 											int 		NOT NULL 
	,old_completed_value_location_number 			TEXT 		NULL 
	,new_completed_value_location_number 			TEXT 		NULL 
	,old_completed_value_sub_location_number 		TEXT 		NULL 
	,new_completed_value_sub_location_number 		TEXT 		NULL 
	,old_completed_value_site_limit 				TEXT 		NULL
	,new_completed_value_site_limit 				TEXT 		NULL 
	,audit_action 									char(1) 	NOT NULL 
	,audit_user 									TEXT 		NOT NULL 		DEFAULT current_user 
	,audit_timestamp 								timestamp 	NOT NULL 		DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 										bigint 		NOT NULL 		GENERATED ALWAYS AS IDENTITY 		PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.audit_br_coverages_completed_value_location_limit_info OWNER TO mj_admin;
GO 

GRANT INSERT ON sagitta.audit_br_coverages_completed_value_location_limit_info TO rl_sagitta_a;
GO 
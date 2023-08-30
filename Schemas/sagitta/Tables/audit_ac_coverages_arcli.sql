CREATE TABLE sagitta.audit_ac_coverages_arcli(
	 sagitem 							int 		NOT NULL 
	,lis 								int 		NOT NULL 
	,old_accts_rec_location_id 			TEXT 		NULL 
	,new_accts_rec_location_id 			TEXT 		NULL 
	,old_accts_rec_sub 					TEXT 		NULL 
	,new_accts_rec_sub 					TEXT 		NULL 
	,old_accts_rec_cov_sub 				TEXT 		NULL 
	,new_accts_rec_cov_sub 				TEXT 		NULL 
	,old_accts_rec_your_premises_limit 	TEXT 		NULL 
	,new_accts_rec_your_premises_limit 	TEXT 		NULL 
	,audit_action 						char(1) 	NOT NULL 
	,audit_user 						TEXT 		NOT NULL 	DEFAULT current_user 
	,audit_timestamp 					timestamp 	NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 							bigint 		NOT NULL 	GENERATED ALWAYS AS IDENTITY 	PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.audit_ac_coverages_arcli OWNER TO mj_admin;
GO 

GRANT INSERT ON sagitta.audit_ac_coverages_arcli TO rl_sagitta_a;
GO 
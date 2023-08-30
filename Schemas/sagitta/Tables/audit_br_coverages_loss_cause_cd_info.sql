CREATE TABLE sagitta.audit_br_coverages_loss_cause_cd_info (
	 sagitem 						int 		NOT NULL 
	,lis 							int 		NOT NULL 
 	,old_loss_cause 				TEXT 		NULL 
	,new_loss_cause 				TEXT 		NULL 
	,old_loss_cause_sub_limit 		TEXT 		NULL 
	,new_loss_cause_sub_limit 		TEXT 		NULL 
	,old_loss_cause_deductible_amt 	TEXT 		NULL 
	,new_loss_cause_deductible_amt 	TEXT 		NULL 
	,audit_action 					char(1) 	NOT NULL 
	,audit_user 					TEXT 		NOT NULL 		DEFAULT current_user
	,audit_timestamp 				timestamp 	NOT NULL 		DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 						bigint 		NOT NULL 		GENERATED ALWAYS AS IDENTITY 	PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.audit_br_coverages_loss_cause_cd_info OWNER TO mj_admin;
GO 

GRANT INSERT ON sagitta.audit_br_coverages_loss_cause_cd_info TO rl_sagitta_a;
GO 

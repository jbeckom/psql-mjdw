CREATE TABLE sagitta.audit_br_coverages_additional_coverage_info (
	 sagitem 									int 		NOT NULL 
	,lis 										int 		NOT NULL 
	,old_addl_cov_cd 							TEXT 		NULL 
	,new_addl_cov_cd 							TEXT 		NULL 
	,old_first_addl_cov_limit 					TEXT 		NULL 
	,new_first_addl_cov_limit 					TEXT 		NULL 
	,old_first_addl_cov_deductible_amt 			TEXT 		NULL 
	,new_first_addl_cov_deductible_amt 			TEXT 		NULL 
	,old_first_addl_cov_ded_desc 				TEXT 		NULL 
	,new_first_addl_cov_ded_desc 				TEXT 		NULL 
	,old_second_addl_cov_limit 					TEXT 		NULL 
	,new_second_addl_cov_limit 					TEXT 		NULL 
	,old_second_addl_cov_deductible_amt 		TEXT 		NULL 
	,new_second_addl_cov_deductible_amt 		TEXT 		NULL 
	,old_second_addl_cov_ded_desc 				TEXT 		NULL 
	,new_second_addl_cov_ded_desc 				TEXT 		NULL 
	,old_addl_cov_desc 							TEXT 		NULL 
	,new_addl_cov_desc 							TEXT 		NULL 
	,old_addl_cov_addl_info 					TEXT 		NULL 
	,new_addl_cov_addl_info 					TEXT 		NULL 
	,old_addl_cov_rate 							TEXT 		NULL 
	,new_addl_cov_rate 							TEXT 		NULL 
	,old_addl_cov_endorse_form 					TEXT 		NULL 
	,new_addl_cov_endorse_form 					TEXT 		NULL 
	,old_addl_cov_endorse_form_date 			TEXT 		NULL 
	,new_addl_cov_endorse_form_date 			TEXT 		NULL 
	,old_addl_cov_premium_amt 					TEXT 		NULL 
	,new_addl_cov_premium_amt 					TEXT 		NULL 
	,audit_action 								char(1) 	NOT NULL 
	,audit_user 								TEXT 		NOT NULL 		DEFAULT current_user 
	,audit_timestamp 							timestamp 	NOT NULL 		DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 									bigint 		NOT NULL 		GENERATED ALWAYS AS IDENTITY 		PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.audit_br_coverages_additional_coverage_info OWNER TO mj_admin;
GO 

GRANT INSERT ON sagitta.audit_br_coverages_additional_coverage_info TO rl_sagitta_a;
GO 
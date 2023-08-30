CREATE TABLE sagitta.audit_eq_coverages_addl_cov_cd_info (
	 sagitem 											int 			NOT NULL 
	,lis 												int 			NOT NULL 
	,old_addl_cov_cd 									TEXT 			NULL 
	,new_addl_cov_cd 									TEXT 			NULL 
	,old_addl_cov_item_number 							TEXT 			NULL 
	,new_addl_cov_item_number 							TEXT 			NULL 
	,old_addl_cov_limit 								TEXT 			NULL 
	,new_addl_cov_limit 								TEXT 			NULL 
	,old_addl_cov_ded_amt 								TEXT 			NULL 
	,new_addl_cov_ded_amt 								TEXT 			NULL 
	,old_addl_cov_ded_pct 								TEXT 			NULL 
	,new_addl_cov_ded_pct 								TEXT 			NULL 
	,old_addl_cov_rate 									TEXT 			NULL 
	,new_addl_cov_rate 									TEXT 			NULL 
	,old_addl_cov_endt_form_number 						TEXT 			NULL 
	,new_addl_cov_endt_form_number 						TEXT 			NULL 
	,old_addl_cov_edition_dt 							TEXT 			NULL 
	,new_addl_cov_edition_dt 							TEXT 			NULL 
	,old_addl_cov_premium 								TEXT 			NULL 
	,new_addl_cov_premium 								TEXT 			NULL 
	,old_addl_cov_des 									TEXT 			NULL 
	,new_addl_cov_des 									TEXT 			NULL 
	,old_addl_cov_estimated_ann_rental_expense 			TEXT 			NULL 
	,new_addl_cov_estimated_ann_rental_expense 			TEXT 			NULL 
	,old_item_limit_basis 								TEXT 			NULL 
	,new_item_limit_basis 								TEXT 			NULL 
	,old_item_limit_valuation_type 						TEXT 			NULL 
	,new_item_limit_valuation_type 						TEXT 			NULL 
	,old_item_deductible_type 							TEXT 			NULL 
	,new_item_deductible_type 							TEXT 			NULL 
	,old_item_deductible_basis 							TEXT 			NULL 
	,new_item_deductible_basis 							TEXT 			NULL 
	,audit_action 										char(1) 		NOT NULL 
	,audit_user 										TEXT 			NOT NULL 		DEFAULT current_user 
	,audit_timestamp 									timestamp 		NOT NULL 		DEFAULT timezone('utc'::TEXT,clock_timestamp())
	,audit_id 											bigint 			NOT NULL 		GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.audit_eq_coverages_addl_cov_cd_info OWNER TO mj_admin;
GO 

GRANT INSERT ON sagitta.audit_eq_coverages_addl_cov_cd_info TO rl_sagitta_a;
GO 

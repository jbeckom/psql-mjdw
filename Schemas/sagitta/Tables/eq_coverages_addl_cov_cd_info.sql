CREATE TABLE sagitta.eq_coverages_addl_cov_cd_info (
	 sagitem 										int 			NOT NULL 
	,lis 											int 			NOT NULL 
	,addl_cov_cd 									TEXT 			NULL 
	,addl_cov_item_number 							TEXT 			NULL 
	,addl_cov_limit 								TEXT 			NULL 
	,addl_cov_ded_amt 								TEXT 			NULL 
	,addl_cov_ded_pct 								TEXT 			NULL 
	,addl_cov_rate 									TEXT 			NULL 
	,addl_cov_endt_form_number 						TEXT 			NULL 
	,addl_cov_edition_dt 							TEXT 			NULL 
	,addl_cov_premium 								TEXT 			NULL 
	,addl_cov_des 									TEXT 			NULL 
	,addl_cov_estimated_ann_rental_expense 			TEXT 			NULL 
	,item_limit_basis 								TEXT 			NULL 
	,item_limit_valuation_type 						TEXT 			NULL 
	,item_deductible_type 							TEXT 			NULL 
	,item_deductible_basis 							TEXT 			NULL 
	,CONSTRAINT eq_coverages_addl_cov_cd_info_pkey 			PRIMARY KEY (sagitem,lis)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.eq_coverages_addl_cov_cd_info OWNER TO mj_admin;
GO 

GRANT SELECT ON sagitta.eq_coverages_addl_cov_cd_info TO rl_sagitta_r;
GO 

GRANT INSERT ON sagitta.eq_coverages_addl_cov_cd_info TO rl_sagitta_a;
GO 

GRANT UPDATE ON sagitta.eq_coverages_addl_cov_cd_info TO rl_sagitta_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON sagitta.eq_coverages_addl_cov_cd_info FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_eq_coverages_addl_cov_cd_info_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON sagitta.eq_coverages_addl_cov_cd_info FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_eq_coverages_addl_cov_cd_info_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON sagitta.eq_coverages_addl_cov_cd_info FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION sagitta.tr_audit_eq_coverages_addl_cov_cd_info_u();
GO 

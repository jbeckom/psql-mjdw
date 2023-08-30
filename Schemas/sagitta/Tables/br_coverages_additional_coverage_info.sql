CREATE TABLE sagitta.br_coverages_additional_coverage_info (
	 sagitem 								int 		NOT NULL 
	,lis 									int 		NOT NULL 
	,addl_cov_cd 							TEXT 		NULL 
	,first_addl_cov_limit 					TEXT 		NULL 
	,first_addl_cov_deductible_amt 			TEXT 		NULL 
	,first_addl_cov_ded_desc 				TEXT 		NULL 
	,second_addl_cov_limit 					TEXT 		NULL 
	,second_addl_cov_deductible_amt 		TEXT 		NULL 
	,second_addl_cov_ded_desc 				TEXT 		NULL 
	,addl_cov_desc 							TEXT 		NULL 
	,addl_cov_addl_info 					TEXT 		NULL 
	,addl_cov_rate 							TEXT 		NULL 
	,addl_cov_endorse_form 					TEXT 		NULL 
	,addl_cov_endorse_form_date 			TEXT 		NULL 
	,addl_cov_premium_amt 					TEXT 		NULL 
	,CONSTRAINT br_coverages_additional_coverage_info_pkey PRIMARY KEY (sagitem,lis)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.br_coverages_additional_coverage_info OWNER TO mj_admin;
GO 

GRANT SELECT ON sagitta.br_coverages_additional_coverage_info TO rl_sagitta_r;
GO 

GRANT INSERT ON sagitta.br_coverages_additional_coverage_info TO rl_sagitta_a;
GO 

GRANT UPDATE ON sagitta.br_coverages_additional_coverage_info TO rl_sagitta_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON sagitta.br_coverages_additional_coverage_info FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_br_coverages_additional_coverage_info_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON sagitta.br_coverages_additional_coverage_info FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_br_coverages_additional_coverage_info_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON sagitta.br_coverages_additional_coverage_info FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION sagitta.tr_audit_br_coverages_additional_coverage_info_u();
GO 

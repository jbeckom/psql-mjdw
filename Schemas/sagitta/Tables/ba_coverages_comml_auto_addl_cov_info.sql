CREATE TABLE sagitta.ba_coverages_comml_auto_addl_cov_info (
	 sagitem 											TEXT 		NOT NULL 
	,lis 												int 		NOT NULL 
	,comml_auto_addl_cov_coverage_cd	    			TEXT        NULL 
	,comml_auto_addl_cov_addl_coverage_desc     		TEXT        NULL 
	,comml_auto_addl_cov_form_number    				TEXT        NULL 
	,comml_auto_addl_cov_edition_dt     				TEXT        NULL 
	,comml_auto_addl_cov_state_prov_cd  				TEXT        NULL 
	,comml_auto_addl_cov_limit_1    					TEXT        NULL 
	,comml_auto_addl_cov_limit_2    					TEXT        NULL 
	,comml_auto_addl_cov_deductible_amt_1   			TEXT        NULL 
	,comml_auto_addl_cov_deductible_amt_2   			TEXT        NULL 
	,comml_auto_addl_cov_deductible_typ     			TEXT        NULL 
	,comml_auto_addl_cov_credit_pct     				TEXT        NULL 
	,comml_auto_addl_cov_addl_cov_rate_factor   		TEXT        NULL 
	,comml_auto_addl_cov_addl_cov_coverage_premium_amt  TEXT        NULL 
	,comml_auto_addl_cov_veh_1  						TEXT        NULL 
	,comml_auto_addl_cov_veh_2  						TEXT        NULL 
	,comml_auto_addl_cov_veh_3  						TEXT        NULL 
	,comml_auto_addl_cov_veh_4  						TEXT        NULL 
	,comml_auto_addl_cov_veh_5  						TEXT        NULL 
	,comml_auto_addl_cov_veh_6  						TEXT        NULL 
	,comml_auto_addl_cov_veh_7  						TEXT        NULL 
	,comml_auto_addl_cov_buyback_yes_no_cd  			TEXT        NULL 
	,comml_auto_addl_cov_misc_options_1     			TEXT        NULL 
	,comml_auto_addl_cov_misc_options_2     			TEXT        NULL 
	,comml_auto_addl_cov_options_1  					TEXT        NULL 
	,comml_auto_addl_cov_options_2  					TEXT        NULL 
	,comml_auto_addl_cov_options_3  					TEXT        NULL 
	,comml_auto_addl_cov_options_4  					TEXT        NULL 
	,comml_auto_addl_cov_benefits_1     				TEXT        NULL 
	,comml_auto_addl_cov_benefits_2     				TEXT        NULL 
	,comml_auto_addl_cov_benefits_3     				TEXT        NULL 
	,comml_auto_addl_cov_class_cd   					TEXT        NULL 
	,comml_auto_addl_cov_hired_non_owned_doc    		TEXT        NULL 
	,comml_auto_addl_cov_misc_factor    				TEXT        NULL 
	,CONSTRAINT ba_coverages_comml_auto_addl_cov_info_pkey PRIMARY KEY (sagitem,lis)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.ba_coverages_comml_auto_addl_cov_info OWNER TO mj_admin;
GO 

GRANT SELECT ON sagitta.ba_coverages_comml_auto_addl_cov_info TO rl_sagitta_r;
GO 

GRANT INSERT ON sagitta.ba_coverages_comml_auto_addl_cov_info TO rl_sagitta_a;
GO 

GRANT UPDATE ON sagitta.ba_coverages_comml_auto_addl_cov_info TO rl_sagitta_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON sagitta.ba_coverages_comml_auto_addl_cov_info FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_ba_coverages_comml_auto_addl_cov_info_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON sagitta.ba_coverages_comml_auto_addl_cov_info FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_ba_coverages_comml_auto_addl_cov_info_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON sagitta.ba_coverages_comml_auto_addl_cov_info FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION sagitta.tr_audit_ba_coverages_comml_auto_addl_cov_info_u();
GO 
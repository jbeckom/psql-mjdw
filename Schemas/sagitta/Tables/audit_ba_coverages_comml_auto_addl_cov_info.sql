CREATE TABLE sagitta.audit_ba_coverages_comml_auto_addl_cov_info (
	 sagitem 												TEXT 		NOT NULL 
	,lis 													int 		NOT NULL 
	,old_comml_auto_addl_cov_coverage_cd	    			TEXT        NULL 
	,new_comml_auto_addl_cov_coverage_cd	    			TEXT        NULL 
	,old_comml_auto_addl_cov_addl_coverage_desc     		TEXT        NULL 
	,new_comml_auto_addl_cov_addl_coverage_desc     		TEXT        NULL 
	,old_comml_auto_addl_cov_form_number    				TEXT        NULL 
	,new_comml_auto_addl_cov_form_number    				TEXT        NULL 
	,old_comml_auto_addl_cov_edition_dt     				TEXT        NULL 
	,new_comml_auto_addl_cov_edition_dt     				TEXT        NULL 
	,old_comml_auto_addl_cov_state_prov_cd  				TEXT        NULL 
	,new_comml_auto_addl_cov_state_prov_cd  				TEXT        NULL 
	,old_comml_auto_addl_cov_limit_1    					TEXT        NULL 
	,new_comml_auto_addl_cov_limit_1    					TEXT        NULL 
	,old_comml_auto_addl_cov_limit_2    					TEXT        NULL 
	,new_comml_auto_addl_cov_limit_2    					TEXT        NULL 
	,old_comml_auto_addl_cov_deductible_amt_1   			TEXT        NULL 
	,new_comml_auto_addl_cov_deductible_amt_1   			TEXT        NULL 
	,old_comml_auto_addl_cov_deductible_amt_2   			TEXT        NULL 
	,new_comml_auto_addl_cov_deductible_amt_2   			TEXT        NULL 
	,old_comml_auto_addl_cov_deductible_typ     			TEXT        NULL 
	,new_comml_auto_addl_cov_deductible_typ     			TEXT        NULL 
	,old_comml_auto_addl_cov_credit_pct     				TEXT        NULL 
	,new_comml_auto_addl_cov_credit_pct     				TEXT        NULL 
	,old_comml_auto_addl_cov_addl_cov_rate_factor   		TEXT        NULL 
	,new_comml_auto_addl_cov_addl_cov_rate_factor   		TEXT        NULL 
	,old_comml_auto_addl_cov_addl_cov_coverage_premium_amt  TEXT        NULL 
	,new_comml_auto_addl_cov_addl_cov_coverage_premium_amt  TEXT        NULL 
	,old_comml_auto_addl_cov_veh_1  						TEXT        NULL 
	,new_comml_auto_addl_cov_veh_1  						TEXT        NULL 
	,old_comml_auto_addl_cov_veh_2  						TEXT        NULL 
	,new_comml_auto_addl_cov_veh_2  						TEXT        NULL 
	,old_comml_auto_addl_cov_veh_3  						TEXT        NULL 
	,new_comml_auto_addl_cov_veh_3  						TEXT        NULL 
	,old_comml_auto_addl_cov_veh_4  						TEXT        NULL 
	,new_comml_auto_addl_cov_veh_4  						TEXT        NULL 
	,old_comml_auto_addl_cov_veh_5  						TEXT        NULL 
	,new_comml_auto_addl_cov_veh_5  						TEXT        NULL 
	,old_comml_auto_addl_cov_veh_6  						TEXT        NULL 
	,new_comml_auto_addl_cov_veh_6  						TEXT        NULL 
	,old_comml_auto_addl_cov_veh_7  						TEXT        NULL 
	,new_comml_auto_addl_cov_veh_7  						TEXT        NULL 
	,old_comml_auto_addl_cov_buyback_yes_no_cd  			TEXT        NULL 
	,new_comml_auto_addl_cov_buyback_yes_no_cd  			TEXT        NULL 
	,old_comml_auto_addl_cov_misc_options_1     			TEXT        NULL 
	,new_comml_auto_addl_cov_misc_options_1     			TEXT        NULL 
	,old_comml_auto_addl_cov_misc_options_2     			TEXT        NULL 
	,new_comml_auto_addl_cov_misc_options_2     			TEXT        NULL 
	,old_comml_auto_addl_cov_options_1  					TEXT        NULL 
	,new_comml_auto_addl_cov_options_1  					TEXT        NULL 
	,old_comml_auto_addl_cov_options_2  					TEXT        NULL 
	,new_comml_auto_addl_cov_options_2  					TEXT        NULL 
	,old_comml_auto_addl_cov_options_3  					TEXT        NULL 
	,new_comml_auto_addl_cov_options_3  					TEXT        NULL 
	,old_comml_auto_addl_cov_options_4  					TEXT        NULL 
	,new_comml_auto_addl_cov_options_4  					TEXT        NULL 
	,old_comml_auto_addl_cov_benefits_1     				TEXT        NULL 
	,new_comml_auto_addl_cov_benefits_1     				TEXT        NULL 
	,old_comml_auto_addl_cov_benefits_2     				TEXT        NULL 
	,new_comml_auto_addl_cov_benefits_2     				TEXT        NULL 
	,old_comml_auto_addl_cov_benefits_3     				TEXT        NULL 
	,new_comml_auto_addl_cov_benefits_3     				TEXT        NULL 
	,old_comml_auto_addl_cov_class_cd   					TEXT        NULL 
	,new_comml_auto_addl_cov_class_cd   					TEXT        NULL 
	,old_comml_auto_addl_cov_hired_non_owned_doc    		TEXT        NULL 
	,new_comml_auto_addl_cov_hired_non_owned_doc    		TEXT        NULL 
	,old_comml_auto_addl_cov_misc_factor    				TEXT        NULL 
	,new_comml_auto_addl_cov_misc_factor    				TEXT        NULL 
	,audit_action 											char(1) 	NOT NULL 
	,audit_user 											TEXT 		NOT NULL 	DEFAULT current_user 
	,audit_timestamp 										timestamp 	NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 												bigint 		NOT NULL 	GENERATED ALWAYS AS IDENTITY 	PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.audit_ba_coverages_comml_auto_addl_cov_info OWNER TO mj_admin;
GO 

GRANT INSERT ON sagitta.audit_ba_coverages_comml_auto_addl_cov_info TO rl_sagitta_a;
GO 

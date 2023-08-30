CREATE OR REPLACE FUNCTION sagitta.tr_audit_ba_coverages_comml_auto_addl_cov_info_i() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO sagitta.audit_ba_coverages_comml_auto_addl_cov_info (
		 sagitem 
		,lis 
		,new_comml_auto_addl_cov_coverage_cd	
		,new_comml_auto_addl_cov_addl_coverage_desc 
		,new_comml_auto_addl_cov_form_number 
		,new_comml_auto_addl_cov_edition_dt 
		,new_comml_auto_addl_cov_state_prov_cd 
		,new_comml_auto_addl_cov_limit_1 
		,new_comml_auto_addl_cov_limit_2 
		,new_comml_auto_addl_cov_deductible_amt_1 
		,new_comml_auto_addl_cov_deductible_amt_2 
		,new_comml_auto_addl_cov_deductible_typ 
		,new_comml_auto_addl_cov_credit_pct 
		,new_comml_auto_addl_cov_addl_cov_rate_factor 
		,new_comml_auto_addl_cov_addl_cov_coverage_premium_amt 
		,new_comml_auto_addl_cov_veh_1 
		,new_comml_auto_addl_cov_veh_2 
		,new_comml_auto_addl_cov_veh_3 
		,new_comml_auto_addl_cov_veh_4 
		,new_comml_auto_addl_cov_veh_5 
		,new_comml_auto_addl_cov_veh_6 
		,new_comml_auto_addl_cov_veh_7 
		,new_comml_auto_addl_cov_buyback_yes_no_cd 
		,new_comml_auto_addl_cov_misc_options_1 
		,new_comml_auto_addl_cov_misc_options_2 
		,new_comml_auto_addl_cov_options_1 
		,new_comml_auto_addl_cov_options_2 
		,new_comml_auto_addl_cov_options_3 
		,new_comml_auto_addl_cov_options_4 
		,new_comml_auto_addl_cov_benefits_1 
		,new_comml_auto_addl_cov_benefits_2 
		,new_comml_auto_addl_cov_benefits_3 
		,new_comml_auto_addl_cov_class_cd 
		,new_comml_auto_addl_cov_hired_non_owned_doc 
		,new_comml_auto_addl_cov_misc_factor 
		,audit_action 
	)
	SELECT 	 NEW.sagitem 
			,NEW.lis 
			,NEW.comml_auto_addl_cov_coverage_cd	
			,NEW.comml_auto_addl_cov_addl_coverage_desc 
			,NEW.comml_auto_addl_cov_form_number 
			,NEW.comml_auto_addl_cov_edition_dt 
			,NEW.comml_auto_addl_cov_state_prov_cd 
			,NEW.comml_auto_addl_cov_limit_1 
			,NEW.comml_auto_addl_cov_limit_2 
			,NEW.comml_auto_addl_cov_deductible_amt_1 
			,NEW.comml_auto_addl_cov_deductible_amt_2 
			,NEW.comml_auto_addl_cov_deductible_typ 
			,NEW.comml_auto_addl_cov_credit_pct 
			,NEW.comml_auto_addl_cov_addl_cov_rate_factor 
			,NEW.comml_auto_addl_cov_addl_cov_coverage_premium_amt 
			,NEW.comml_auto_addl_cov_veh_1 
			,NEW.comml_auto_addl_cov_veh_2 
			,NEW.comml_auto_addl_cov_veh_3 
			,NEW.comml_auto_addl_cov_veh_4 
			,NEW.comml_auto_addl_cov_veh_5 
			,NEW.comml_auto_addl_cov_veh_6 
			,NEW.comml_auto_addl_cov_veh_7 
			,NEW.comml_auto_addl_cov_buyback_yes_no_cd 
			,NEW.comml_auto_addl_cov_misc_options_1 
			,NEW.comml_auto_addl_cov_misc_options_2 
			,NEW.comml_auto_addl_cov_options_1 
			,NEW.comml_auto_addl_cov_options_2 
			,NEW.comml_auto_addl_cov_options_3 
			,NEW.comml_auto_addl_cov_options_4 
			,NEW.comml_auto_addl_cov_benefits_1 
			,NEW.comml_auto_addl_cov_benefits_2 
			,NEW.comml_auto_addl_cov_benefits_3 
			,NEW.comml_auto_addl_cov_class_cd 
			,NEW.comml_auto_addl_cov_hired_non_owned_doc 
			,NEW.comml_auto_addl_cov_misc_factor 
			,'I';
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_ba_coverages_comml_auto_addl_cov_info_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_ba_coverages_comml_auto_addl_cov_info_i() TO rl_sagitta_x;
GO 

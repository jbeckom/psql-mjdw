CREATE OR REPLACE FUNCTION sagitta.tr_audit_ba_coverages_comml_auto_addl_cov_info_d() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO sagitta.audit_ba_coverages_comml_auto_addl_cov_info (
		 sagitem 
		,lis 
		,old_comml_auto_addl_cov_coverage_cd	
		,old_comml_auto_addl_cov_addl_coverage_desc 
		,old_comml_auto_addl_cov_form_number 
		,old_comml_auto_addl_cov_edition_dt 
		,old_comml_auto_addl_cov_state_prov_cd 
		,old_comml_auto_addl_cov_limit_1 
		,old_comml_auto_addl_cov_limit_2 
		,old_comml_auto_addl_cov_deductible_amt_1 
		,old_comml_auto_addl_cov_deductible_amt_2 
		,old_comml_auto_addl_cov_deductible_typ 
		,old_comml_auto_addl_cov_credit_pct 
		,old_comml_auto_addl_cov_addl_cov_rate_factor 
		,old_comml_auto_addl_cov_addl_cov_coverage_premium_amt 
		,old_comml_auto_addl_cov_veh_1 
		,old_comml_auto_addl_cov_veh_2 
		,old_comml_auto_addl_cov_veh_3 
		,old_comml_auto_addl_cov_veh_4 
		,old_comml_auto_addl_cov_veh_5 
		,old_comml_auto_addl_cov_veh_6 
		,old_comml_auto_addl_cov_veh_7 
		,old_comml_auto_addl_cov_buyback_yes_no_cd 
		,old_comml_auto_addl_cov_misc_options_1 
		,old_comml_auto_addl_cov_misc_options_2 
		,old_comml_auto_addl_cov_options_1 
		,old_comml_auto_addl_cov_options_2 
		,old_comml_auto_addl_cov_options_3 
		,old_comml_auto_addl_cov_options_4 
		,old_comml_auto_addl_cov_benefits_1 
		,old_comml_auto_addl_cov_benefits_2 
		,old_comml_auto_addl_cov_benefits_3 
		,old_comml_auto_addl_cov_class_cd 
		,old_comml_auto_addl_cov_hired_non_owned_doc 
		,old_comml_auto_addl_cov_misc_factor 
		,audit_action 
	)
	SELECT 	 OLD.sagitem 
			,OLD.lis 
			,OLD.comml_auto_addl_cov_coverage_cd	
			,OLD.comml_auto_addl_cov_addl_coverage_desc 
			,OLD.comml_auto_addl_cov_form_number 
			,OLD.comml_auto_addl_cov_edition_dt 
			,OLD.comml_auto_addl_cov_state_prov_cd 
			,OLD.comml_auto_addl_cov_limit_1 
			,OLD.comml_auto_addl_cov_limit_2 
			,OLD.comml_auto_addl_cov_deductible_amt_1 
			,OLD.comml_auto_addl_cov_deductible_amt_2 
			,OLD.comml_auto_addl_cov_deductible_typ 
			,OLD.comml_auto_addl_cov_credit_pct 
			,OLD.comml_auto_addl_cov_addl_cov_rate_factor 
			,OLD.comml_auto_addl_cov_addl_cov_coverage_premium_amt 
			,OLD.comml_auto_addl_cov_veh_1 
			,OLD.comml_auto_addl_cov_veh_2 
			,OLD.comml_auto_addl_cov_veh_3 
			,OLD.comml_auto_addl_cov_veh_4 
			,OLD.comml_auto_addl_cov_veh_5 
			,OLD.comml_auto_addl_cov_veh_6 
			,OLD.comml_auto_addl_cov_veh_7 
			,OLD.comml_auto_addl_cov_buyback_yes_no_cd 
			,OLD.comml_auto_addl_cov_misc_options_1 
			,OLD.comml_auto_addl_cov_misc_options_2 
			,OLD.comml_auto_addl_cov_options_1 
			,OLD.comml_auto_addl_cov_options_2 
			,OLD.comml_auto_addl_cov_options_3 
			,OLD.comml_auto_addl_cov_options_4 
			,OLD.comml_auto_addl_cov_benefits_1 
			,OLD.comml_auto_addl_cov_benefits_2 
			,OLD.comml_auto_addl_cov_benefits_3 
			,OLD.comml_auto_addl_cov_class_cd 
			,OLD.comml_auto_addl_cov_hired_non_owned_doc 
			,OLD.comml_auto_addl_cov_misc_factor 
			,'D';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_ba_coverages_comml_auto_addl_cov_info_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_ba_coverages_comml_auto_addl_cov_info_d() TO rl_sagitta_x;
GO 

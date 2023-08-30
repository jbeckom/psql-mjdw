CREATE OR REPLACE FUNCTION sagitta.sp_ba_coverages_comml_auto_addl_cov_info_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE rc int;

BEGIN 
	INSERT INTO sagitta.ba_coverages_comml_auto_addl_cov_info (
		 sagitem 
		,lis 
		,comml_auto_addl_cov_coverage_cd 
		,comml_auto_addl_cov_addl_coverage_desc 
		,comml_auto_addl_cov_form_number 
		,comml_auto_addl_cov_edition_dt 
		,comml_auto_addl_cov_state_prov_cd 
		,comml_auto_addl_cov_limit_1 
		,comml_auto_addl_cov_limit_2 
		,comml_auto_addl_cov_deductible_amt_1 
		,comml_auto_addl_cov_deductible_amt_2 
		,comml_auto_addl_cov_deductible_typ 
		,comml_auto_addl_cov_credit_pct 
		,comml_auto_addl_cov_addl_cov_rate_factor 
		,comml_auto_addl_cov_addl_cov_coverage_premium_amt 
		,comml_auto_addl_cov_veh_1 
		,comml_auto_addl_cov_veh_2 
		,comml_auto_addl_cov_veh_3 
		,comml_auto_addl_cov_veh_4 
		,comml_auto_addl_cov_veh_5 
		,comml_auto_addl_cov_veh_6 
		,comml_auto_addl_cov_veh_7 
		,comml_auto_addl_cov_buyback_yes_no_cd 
		,comml_auto_addl_cov_misc_options_1 
		,comml_auto_addl_cov_misc_options_2 
		,comml_auto_addl_cov_options_1 
		,comml_auto_addl_cov_options_2 
		,comml_auto_addl_cov_options_3 
		,comml_auto_addl_cov_options_4 
		,comml_auto_addl_cov_benefits_1 
		,comml_auto_addl_cov_benefits_2 
		,comml_auto_addl_cov_benefits_3 
		,comml_auto_addl_cov_class_cd 
		,comml_auto_addl_cov_hired_non_owned_doc 
		,comml_auto_addl_cov_misc_factor 
	)
	SELECT 	 sagitem 
			,lis 
			,comml_auto_addl_cov_coverage_cd 
			,comml_auto_addl_cov_addl_coverage_desc 
			,comml_auto_addl_cov_form_number 
			,comml_auto_addl_cov_edition_dt 
			,comml_auto_addl_cov_state_prov_cd 
			,comml_auto_addl_cov_limit_1 
			,comml_auto_addl_cov_limit_2 
			,comml_auto_addl_cov_deductible_amt_1 
			,comml_auto_addl_cov_deductible_amt_2 
			,comml_auto_addl_cov_deductible_typ 
			,comml_auto_addl_cov_credit_pct 
			,comml_auto_addl_cov_addl_cov_rate_factor 
			,comml_auto_addl_cov_addl_cov_coverage_premium_amt 
			,comml_auto_addl_cov_veh_1 
			,comml_auto_addl_cov_veh_2 
			,comml_auto_addl_cov_veh_3 
			,comml_auto_addl_cov_veh_4 
			,comml_auto_addl_cov_veh_5 
			,comml_auto_addl_cov_veh_6 
			,comml_auto_addl_cov_veh_7 
			,comml_auto_addl_cov_buyback_yes_no_cd 
			,comml_auto_addl_cov_misc_options_1 
			,comml_auto_addl_cov_misc_options_2 
			,comml_auto_addl_cov_options_1 
			,comml_auto_addl_cov_options_2 
			,comml_auto_addl_cov_options_3 
			,comml_auto_addl_cov_options_4 
			,comml_auto_addl_cov_benefits_1 
			,comml_auto_addl_cov_benefits_2 
			,comml_auto_addl_cov_benefits_3 
			,comml_auto_addl_cov_class_cd 
			,comml_auto_addl_cov_hired_non_owned_doc 
			,comml_auto_addl_cov_misc_factor 
	FROM 	sagitta.stg_ba_coverages_comml_auto_addl_cov_info
	ON CONFLICT (sagitem,lis) DO UPDATE 
	SET 	 comml_auto_addl_cov_coverage_cd 					= excluded.comml_auto_addl_cov_coverage_cd 
			,comml_auto_addl_cov_addl_coverage_desc 			= excluded.comml_auto_addl_cov_addl_coverage_desc 
			,comml_auto_addl_cov_form_number 					= excluded.comml_auto_addl_cov_form_number 
			,comml_auto_addl_cov_edition_dt 					= excluded.comml_auto_addl_cov_edition_dt 
			,comml_auto_addl_cov_state_prov_cd 					= excluded.comml_auto_addl_cov_state_prov_cd 
			,comml_auto_addl_cov_limit_1 						= excluded.comml_auto_addl_cov_limit_1 
			,comml_auto_addl_cov_limit_2 						= excluded.comml_auto_addl_cov_limit_2 
			,comml_auto_addl_cov_deductible_amt_1 				= excluded.comml_auto_addl_cov_deductible_amt_1 
			,comml_auto_addl_cov_deductible_amt_2 				= excluded.comml_auto_addl_cov_deductible_amt_2 
			,comml_auto_addl_cov_deductible_typ 				= excluded.comml_auto_addl_cov_deductible_typ 
			,comml_auto_addl_cov_credit_pct 					= excluded.comml_auto_addl_cov_credit_pct 
			,comml_auto_addl_cov_addl_cov_rate_factor 			= excluded.comml_auto_addl_cov_addl_cov_rate_factor 
			,comml_auto_addl_cov_addl_cov_coverage_premium_amt 	= excluded.comml_auto_addl_cov_addl_cov_coverage_premium_amt 
			,comml_auto_addl_cov_veh_1 							= excluded.comml_auto_addl_cov_veh_1 
			,comml_auto_addl_cov_veh_2 							= excluded.comml_auto_addl_cov_veh_2 
			,comml_auto_addl_cov_veh_3 							= excluded.comml_auto_addl_cov_veh_3 
			,comml_auto_addl_cov_veh_4 							= excluded.comml_auto_addl_cov_veh_4 
			,comml_auto_addl_cov_veh_5 							= excluded.comml_auto_addl_cov_veh_5 
			,comml_auto_addl_cov_veh_6 							= excluded.comml_auto_addl_cov_veh_6 
			,comml_auto_addl_cov_veh_7 							= excluded.comml_auto_addl_cov_veh_7 
			,comml_auto_addl_cov_buyback_yes_no_cd 				= excluded.comml_auto_addl_cov_buyback_yes_no_cd 
			,comml_auto_addl_cov_misc_options_1 				= excluded.comml_auto_addl_cov_misc_options_1 
			,comml_auto_addl_cov_misc_options_2 				= excluded.comml_auto_addl_cov_misc_options_2 
			,comml_auto_addl_cov_options_1 						= excluded.comml_auto_addl_cov_options_1 
			,comml_auto_addl_cov_options_2 						= excluded.comml_auto_addl_cov_options_2 
			,comml_auto_addl_cov_options_3 						= excluded.comml_auto_addl_cov_options_3 
			,comml_auto_addl_cov_options_4 						= excluded.comml_auto_addl_cov_options_4 
			,comml_auto_addl_cov_benefits_1 					= excluded.comml_auto_addl_cov_benefits_1 
			,comml_auto_addl_cov_benefits_2 					= excluded.comml_auto_addl_cov_benefits_2 
			,comml_auto_addl_cov_benefits_3 					= excluded.comml_auto_addl_cov_benefits_3 
			,comml_auto_addl_cov_class_cd 						= excluded.comml_auto_addl_cov_class_cd 
			,comml_auto_addl_cov_hired_non_owned_doc 			= excluded.comml_auto_addl_cov_hired_non_owned_doc 
			,comml_auto_addl_cov_misc_factor 					= excluded.comml_auto_addl_cov_misc_factor 
	WHERE 	(ba_coverages_comml_auto_addl_cov_info.comml_auto_addl_cov_coverage_cd,ba_coverages_comml_auto_addl_cov_info.comml_auto_addl_cov_addl_coverage_desc,ba_coverages_comml_auto_addl_cov_info.comml_auto_addl_cov_form_number,ba_coverages_comml_auto_addl_cov_info.comml_auto_addl_cov_edition_dt,ba_coverages_comml_auto_addl_cov_info.comml_auto_addl_cov_state_prov_cd,ba_coverages_comml_auto_addl_cov_info.comml_auto_addl_cov_limit_1,ba_coverages_comml_auto_addl_cov_info.comml_auto_addl_cov_limit_2,ba_coverages_comml_auto_addl_cov_info.comml_auto_addl_cov_deductible_amt_1,ba_coverages_comml_auto_addl_cov_info.comml_auto_addl_cov_deductible_amt_2,ba_coverages_comml_auto_addl_cov_info.comml_auto_addl_cov_deductible_typ,ba_coverages_comml_auto_addl_cov_info.comml_auto_addl_cov_credit_pct,ba_coverages_comml_auto_addl_cov_info.comml_auto_addl_cov_addl_cov_rate_factor,ba_coverages_comml_auto_addl_cov_info.comml_auto_addl_cov_addl_cov_coverage_premium_amt,ba_coverages_comml_auto_addl_cov_info.comml_auto_addl_cov_veh_1,ba_coverages_comml_auto_addl_cov_info.comml_auto_addl_cov_veh_2,ba_coverages_comml_auto_addl_cov_info.comml_auto_addl_cov_veh_3,ba_coverages_comml_auto_addl_cov_info.comml_auto_addl_cov_veh_4,ba_coverages_comml_auto_addl_cov_info.comml_auto_addl_cov_veh_5,ba_coverages_comml_auto_addl_cov_info.comml_auto_addl_cov_veh_6,ba_coverages_comml_auto_addl_cov_info.comml_auto_addl_cov_veh_7,ba_coverages_comml_auto_addl_cov_info.comml_auto_addl_cov_buyback_yes_no_cd,ba_coverages_comml_auto_addl_cov_info.comml_auto_addl_cov_misc_options_1,ba_coverages_comml_auto_addl_cov_info.comml_auto_addl_cov_misc_options_2,ba_coverages_comml_auto_addl_cov_info.comml_auto_addl_cov_options_1,ba_coverages_comml_auto_addl_cov_info.comml_auto_addl_cov_options_2,ba_coverages_comml_auto_addl_cov_info.comml_auto_addl_cov_options_3,ba_coverages_comml_auto_addl_cov_info.comml_auto_addl_cov_options_4,ba_coverages_comml_auto_addl_cov_info.comml_auto_addl_cov_benefits_1,ba_coverages_comml_auto_addl_cov_info.comml_auto_addl_cov_benefits_2,ba_coverages_comml_auto_addl_cov_info.comml_auto_addl_cov_benefits_3,ba_coverages_comml_auto_addl_cov_info.comml_auto_addl_cov_class_cd,ba_coverages_comml_auto_addl_cov_info.comml_auto_addl_cov_hired_non_owned_doc,ba_coverages_comml_auto_addl_cov_info.comml_auto_addl_cov_misc_factor) 
		IS DISTINCT FROM 	(excluded.comml_auto_addl_cov_coverage_cd,excluded.comml_auto_addl_cov_addl_coverage_desc,excluded.comml_auto_addl_cov_form_number,excluded.comml_auto_addl_cov_edition_dt,excluded.comml_auto_addl_cov_state_prov_cd,excluded.comml_auto_addl_cov_limit_1,excluded.comml_auto_addl_cov_limit_2,excluded.comml_auto_addl_cov_deductible_amt_1,excluded.comml_auto_addl_cov_deductible_amt_2,excluded.comml_auto_addl_cov_deductible_typ,excluded.comml_auto_addl_cov_credit_pct,excluded.comml_auto_addl_cov_addl_cov_rate_factor,excluded.comml_auto_addl_cov_addl_cov_coverage_premium_amt,excluded.comml_auto_addl_cov_veh_1,excluded.comml_auto_addl_cov_veh_2,excluded.comml_auto_addl_cov_veh_3,excluded.comml_auto_addl_cov_veh_4,excluded.comml_auto_addl_cov_veh_5,excluded.comml_auto_addl_cov_veh_6,excluded.comml_auto_addl_cov_veh_7,excluded.comml_auto_addl_cov_buyback_yes_no_cd,excluded.comml_auto_addl_cov_misc_options_1,excluded.comml_auto_addl_cov_misc_options_2,excluded.comml_auto_addl_cov_options_1,excluded.comml_auto_addl_cov_options_2,excluded.comml_auto_addl_cov_options_3,excluded.comml_auto_addl_cov_options_4,excluded.comml_auto_addl_cov_benefits_1,excluded.comml_auto_addl_cov_benefits_2,excluded.comml_auto_addl_cov_benefits_3,excluded.comml_auto_addl_cov_class_cd,excluded.comml_auto_addl_cov_hired_non_owned_doc,excluded.comml_auto_addl_cov_misc_factor); 
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_ba_coverages_comml_auto_addl_cov_info_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_ba_coverages_comml_auto_addl_cov_info_upsert() TO rl_sagitta_x;
GO 

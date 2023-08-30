CREATE OR REPLACE FUNCTION sagitta.sp_br_coverages_additional_coverage_info_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE rc int;

BEGIN 
	INSERT INTO sagitta.br_coverages_additional_coverage_info (
		 sagitem 
		,lis 
		,addl_cov_cd 
		,first_addl_cov_limit 
		,first_addl_cov_deductible_amt 
		,first_addl_cov_ded_desc 
		,second_addl_cov_limit 
		,second_addl_cov_deductible_amt 
		,second_addl_cov_ded_desc 
		,addl_cov_desc 
		,addl_cov_addl_info 
		,addl_cov_rate 
		,addl_cov_endorse_form 
		,addl_cov_endorse_form_date 
		,addl_cov_premium_amt 
	) 
	SELECT 	 sagitem 
			,lis 
			,addl_cov_cd 
			,first_addl_cov_limit 
			,first_addl_cov_deductible_amt 
			,first_addl_cov_ded_desc 
			,second_addl_cov_limit 
			,second_addl_cov_deductible_amt 
			,second_addl_cov_ded_desc 
			,addl_cov_desc 
			,addl_cov_addl_info 
			,addl_cov_rate 
			,addl_cov_endorse_form 
			,addl_cov_endorse_form_date 
			,addl_cov_premium_amt 
	FROM 	sagitta.stg_br_coverages_additional_coverage_info
	ON CONFLICT (sagitem,lis) DO UPDATE 
	SET 	 addl_cov_cd 						= excluded.addl_cov_cd 
			,first_addl_cov_limit 				= excluded.first_addl_cov_limit 
			,first_addl_cov_deductible_amt 		= excluded.first_addl_cov_deductible_amt 
			,first_addl_cov_ded_desc 			= excluded.first_addl_cov_ded_desc 
			,second_addl_cov_limit 				= excluded.second_addl_cov_limit 
			,second_addl_cov_deductible_amt 	= excluded.second_addl_cov_deductible_amt 
			,second_addl_cov_ded_desc 			= excluded.second_addl_cov_ded_desc 
			,addl_cov_desc 						= excluded.addl_cov_desc 
			,addl_cov_addl_info 				= excluded.addl_cov_addl_info 
			,addl_cov_rate 						= excluded.addl_cov_rate 
			,addl_cov_endorse_form 				= excluded.addl_cov_endorse_form 
			,addl_cov_endorse_form_date 		= excluded.addl_cov_endorse_form_date 
			,addl_cov_premium_amt 				= excluded.addl_cov_premium_amt 
	WHERE 	(br_coverages_additional_coverage_info.addl_cov_cd,br_coverages_additional_coverage_info.first_addl_cov_limit,br_coverages_additional_coverage_info.first_addl_cov_deductible_amt,br_coverages_additional_coverage_info.first_addl_cov_ded_desc,br_coverages_additional_coverage_info.second_addl_cov_limit,br_coverages_additional_coverage_info.second_addl_cov_deductible_amt,br_coverages_additional_coverage_info.second_addl_cov_ded_desc,br_coverages_additional_coverage_info.addl_cov_desc,br_coverages_additional_coverage_info.addl_cov_addl_info,br_coverages_additional_coverage_info.addl_cov_rate,br_coverages_additional_coverage_info.addl_cov_endorse_form,br_coverages_additional_coverage_info.addl_cov_endorse_form_date,br_coverages_additional_coverage_info.addl_cov_premium_amt) 
		IS DISTINCT FROM 	(excluded.addl_cov_cd,excluded.first_addl_cov_limit,excluded.first_addl_cov_deductible_amt,excluded.first_addl_cov_ded_desc,excluded.second_addl_cov_limit,excluded.second_addl_cov_deductible_amt,excluded.second_addl_cov_ded_desc,excluded.addl_cov_desc,excluded.addl_cov_addl_info,excluded.addl_cov_rate,excluded.addl_cov_endorse_form,excluded.addl_cov_endorse_form_date,excluded.addl_cov_premium_amt); 
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_br_coverages_additional_coverage_info_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_br_coverages_additional_coverage_info_upsert() TO rl_sagitta_x;
GO 

CREATE OR REPLACE FUNCTION sagitta.sp_cp_coverages_lsci_extension_excl_optional_info_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$ 

DECLARE rc int;

BEGIN 
	INSERT INTO sagitta.cp_coverages_lsci_extension_excl_optional_info (
		 sagitem 
		,lis 
		,optional_coverages_cd 
		,optional_limit 
		,optional_deductible_ind 
		,optional_deductible 
		,optional_deductible_type_cd 
		,optional_deductible_basis_cd 
		,reporting_period_cd 
		,optional_coverages_desc 
		,optional_peak_season_start_dt 
		,optional_peak_season_end_dt 
		,option_form_number 
		,option_edition_dt 
		,optional_amt 
	)
	SELECT 	 sagitem 
			,lis 
			,optional_coverages_cd 
			,optional_limit 
			,optional_deductible_ind 
			,optional_deductible 
			,optional_deductible_type_cd 
			,optional_deductible_basis_cd 
			,reporting_period_cd 
			,optional_coverages_desc 
			,optional_peak_season_start_dt 
			,optional_peak_season_end_dt 
			,option_form_number 
			,option_edition_dt 
			,optional_amt 
	FROM 	sagitta.stg_cp_coverages_lsci_extension_excl_optional_info
	ON CONFLICT (sagitem,lis) DO UPDATE 
	SET 	 optional_coverages_cd 			= excluded.optional_coverages_cd 
			,optional_limit 				= excluded.optional_limit 
			,optional_deductible_ind 		= excluded.optional_deductible_ind 
			,optional_deductible 			= excluded.optional_deductible 
			,optional_deductible_type_cd 	= excluded.optional_deductible_type_cd 
			,optional_deductible_basis_cd 	= excluded.optional_deductible_basis_cd 
			,reporting_period_cd 			= excluded.reporting_period_cd 
			,optional_coverages_desc 		= excluded.optional_coverages_desc 
			,optional_peak_season_start_dt 	= excluded.optional_peak_season_start_dt 
			,optional_peak_season_end_dt 	= excluded.optional_peak_season_end_dt 
			,option_form_number 			= excluded.option_form_number 
			,option_edition_dt 				= excluded.option_edition_dt 
			,optional_amt 					= excluded.optional_amt 
	WHERE 	(cp_coverages_lsci_extension_excl_optional_info.optional_coverages_cd,cp_coverages_lsci_extension_excl_optional_info.optional_limit,cp_coverages_lsci_extension_excl_optional_info.optional_deductible_ind,cp_coverages_lsci_extension_excl_optional_info.optional_deductible,cp_coverages_lsci_extension_excl_optional_info.optional_deductible_type_cd,cp_coverages_lsci_extension_excl_optional_info.optional_deductible_basis_cd,cp_coverages_lsci_extension_excl_optional_info.reporting_period_cd,cp_coverages_lsci_extension_excl_optional_info.optional_coverages_desc,cp_coverages_lsci_extension_excl_optional_info.optional_peak_season_start_dt,cp_coverages_lsci_extension_excl_optional_info.optional_peak_season_end_dt,cp_coverages_lsci_extension_excl_optional_info.option_form_number,cp_coverages_lsci_extension_excl_optional_info.option_edition_dt,cp_coverages_lsci_extension_excl_optional_info.optional_amt) 
		IS DISTINCT FROM 	(excluded.optional_coverages_cd,excluded.optional_limit,excluded.optional_deductible_ind,excluded.optional_deductible,excluded.optional_deductible_type_cd,excluded.optional_deductible_basis_cd,excluded.reporting_period_cd,excluded.optional_coverages_desc,excluded.optional_peak_season_start_dt,excluded.optional_peak_season_end_dt,excluded.option_form_number,excluded.option_edition_dt,excluded.optional_amt); 
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_cp_coverages_lsci_extension_excl_optional_info_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_cp_coverages_lsci_extension_excl_optional_info_upsert() TO rl_sagitta_x;
GO 

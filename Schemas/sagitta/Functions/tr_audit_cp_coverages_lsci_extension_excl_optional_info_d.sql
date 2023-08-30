CREATE OR REPLACE FUNCTION sagitta.tr_audit_cp_coverages_lsci_extension_excl_optional_info_d()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$ 

BEGIN 
	INSERT INTO sagitta.audit_cp_coverages_lsci_extension_excl_optional_info(
		 sagitem 
		,lis 
		,old_optional_coverages_cd 
		,old_optional_limit 
		,old_optional_deductible_ind 
		,old_optional_deductible 
		,old_optional_deductible_type_cd 
		,old_optional_deductible_basis_cd 
		,old_reporting_period_cd 
		,old_optional_coverages_desc 
		,old_optional_peak_season_start_dt 
		,old_optional_peak_season_end_dt 
		,old_option_form_number 
		,old_option_edition_dt 
		,old_optional_amt 
		,audit_action 
	)
	SELECT 		 OLD.sagitem 
				,OLD.lis 
				,OLD.optional_coverages_cd 
				,OLD.optional_limit 
				,OLD.optional_deductible_ind 
				,OLD.optional_deductible 
				,OLD.optional_deductible_type_cd 
				,OLD.optional_deductible_basis_cd 
				,OLD.reporting_period_cd 
				,OLD.optional_coverages_desc 
				,OLD.optional_peak_season_start_dt 
				,OLD.optional_peak_season_end_dt 
				,OLD.option_form_number 
				,OLD.option_edition_dt 
				,OLD.optional_amt 
				,'D';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_cp_coverages_lsci_extension_excl_optional_info_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_cp_coverages_lsci_extension_excl_optional_info_d() TO rl_sagitta_x;
GO 

CREATE OR REPLACE FUNCTION sagitta.tr_audit_cp_coverages_lsci_extension_excl_optional_info_u()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$ 

BEGIN 
	INSERT INTO sagitta.audit_cp_coverages_lsci_extension_excl_optional_info(
		 sagitem 
		,lis 
		,old_optional_coverages_cd 
		,new_optional_coverages_cd 
		,old_optional_limit 
		,new_optional_limit 
		,old_optional_deductible_ind 
		,new_optional_deductible_ind 
		,old_optional_deductible 
		,new_optional_deductible 
		,old_optional_deductible_type_cd 
		,new_optional_deductible_type_cd 
		,old_optional_deductible_basis_cd 
		,new_optional_deductible_basis_cd 
		,old_reporting_period_cd 
		,new_reporting_period_cd 
		,old_optional_coverages_desc 
		,new_optional_coverages_desc 
		,old_optional_peak_season_start_dt 
		,new_optional_peak_season_start_dt 
		,old_optional_peak_season_end_dt 
		,new_optional_peak_season_end_dt 
		,old_option_form_number 
		,new_option_form_number 
		,old_option_edition_dt 
		,new_option_edition_dt 
		,old_optional_amt 
		,new_optional_amt 
		,audit_action 
	)
	SELECT 		 OLD.sagitem 
				,OLD.lis 
				,OLD.optional_coverages_cd 
				,NEW.optional_coverages_cd 
				,OLD.optional_limit 
				,NEW.optional_limit 
				,OLD.optional_deductible_ind 
				,NEW.optional_deductible_ind 
				,OLD.optional_deductible 
				,NEW.optional_deductible 
				,OLD.optional_deductible_type_cd 
				,NEW.optional_deductible_type_cd 
				,OLD.optional_deductible_basis_cd 
				,NEW.optional_deductible_basis_cd 
				,OLD.reporting_period_cd 
				,NEW.reporting_period_cd 
				,OLD.optional_coverages_desc 
				,NEW.optional_coverages_desc 
				,OLD.optional_peak_season_start_dt 
				,NEW.optional_peak_season_start_dt 
				,OLD.optional_peak_season_end_dt 
				,NEW.optional_peak_season_end_dt 
				,OLD.option_form_number 
				,NEW.option_form_number 
				,OLD.option_edition_dt 
				,NEW.option_edition_dt 
				,OLD.optional_amt 
				,NEW.optional_amt 
				,'U';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_cp_coverages_lsci_extension_excl_optional_info_u() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_cp_coverages_lsci_extension_excl_optional_info_u() TO rl_sagitta_x;
GO 

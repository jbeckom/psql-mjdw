CREATE OR REPLACE FUNCTION sagitta.tr_audit_cp_coverages_lsci_extension_excl_optional_info_i()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$ 

BEGIN 
	INSERT INTO sagitta.audit_cp_coverages_lsci_extension_excl_optional_info(
		 sagitem 
		,lis 
		,new_optional_coverages_cd 
		,new_optional_limit 
		,new_optional_deductible_ind 
		,new_optional_deductible 
		,new_optional_deductible_type_cd 
		,new_optional_deductible_basis_cd 
		,new_reporting_period_cd 
		,new_optional_coverages_desc 
		,new_optional_peak_season_start_dt 
		,new_optional_peak_season_end_dt 
		,new_option_form_number 
		,new_option_edition_dt 
		,new_optional_amt 
		,audit_action 
	)
	SELECT 		 NEW.sagitem 
				,NEW.lis 
				,NEW.optional_coverages_cd 
				,NEW.optional_limit 
				,NEW.optional_deductible_ind 
				,NEW.optional_deductible 
				,NEW.optional_deductible_type_cd 
				,NEW.optional_deductible_basis_cd 
				,NEW.reporting_period_cd 
				,NEW.optional_coverages_desc 
				,NEW.optional_peak_season_start_dt 
				,NEW.optional_peak_season_end_dt 
				,NEW.option_form_number 
				,NEW.option_edition_dt 
				,NEW.optional_amt 
				,'I';
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_cp_coverages_lsci_extension_excl_optional_info_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_cp_coverages_lsci_extension_excl_optional_info_i() TO rl_sagitta_x;
GO 

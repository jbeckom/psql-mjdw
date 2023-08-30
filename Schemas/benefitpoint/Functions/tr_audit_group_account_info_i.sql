CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_group_account_info_i()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_group_account_info (
		 account_id
		,new_account_name
		,new_dba
		,new_number_of_ftes
		,new_number_of_ftes_as_of
		,new_number_of_full_time_equivalents
		,new_number_of_full_time_equivalents_as_of_date
		,new_coverage_subject_to_employer_mandate
		,new_market_size
		,new_business_type
		,new_sic_code
		,new_naics_code
		,new_requires_5500
		,new_locations_by_zip
		,new_affiliates
		,new_budgeted_total_annual_premium
		,new_budgeted_total_annual_revenue
		,new_multiple_payroll_cycles
		,new_multiple_payroll_cycles_differ_by
		,new_single_payroll_cycle
		,audit_action
	)
	SELECT 	 NEW.account_id
			,NEW.account_name
			,NEW.dba
			,NEW.number_of_ftes
			,NEW.number_of_ftes_as_of
			,NEW.number_of_full_time_equivalents
			,NEW.number_of_full_time_equivalents_as_of_date
			,NEW.coverage_subject_to_employer_mandate
			,NEW.market_size
			,NEW.business_type
			,NEW.sic_code
			,NEW.naics_code
			,NEW.requires_5500
			,NEW.locations_by_zip
			,NEW.affiliates
			,NEW.budgeted_total_annual_premium
			,NEW.budgeted_total_annual_revenue
			,NEW.multiple_payroll_cycles
			,NEW.multiple_payroll_cycles_differ_by
			,NEW.single_payroll_cycle
			,'I';
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_group_account_info_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_group_account_info_i() TO rl_benefitpoint_x;
GO 

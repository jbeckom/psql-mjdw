CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_group_account_info_u()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_group_account_info (
		 account_id
		,old_account_name
		,new_account_name
		,old_dba
		,new_dba
		,old_number_of_ftes
		,new_number_of_ftes
		,old_number_of_ftes_as_of
		,new_number_of_ftes_as_of
		,old_number_of_full_time_equivalents
		,new_number_of_full_time_equivalents
		,old_number_of_full_time_equivalents_as_of_date
		,new_number_of_full_time_equivalents_as_of_date
		,old_coverage_subject_to_employer_mandate
		,new_coverage_subject_to_employer_mandate
		,old_market_size
		,new_market_size
		,old_business_type
		,new_business_type
		,old_sic_code
		,new_sic_code
		,old_naics_code
		,new_naics_code
		,old_requires_5500
		,new_requires_5500
		,old_locations_by_zip
		,new_locations_by_zip
		,old_affiliates
		,new_affiliates
		,old_budgeted_total_annual_premium
		,new_budgeted_total_annual_premium
		,old_budgeted_total_annual_revenue
		,new_budgeted_total_annual_revenue
		,old_multiple_payroll_cycles
		,new_multiple_payroll_cycles
		,old_multiple_payroll_cycles_differ_by
		,new_multiple_payroll_cycles_differ_by
		,old_single_payroll_cycle
		,new_single_payroll_cycle
		,audit_action
	)
	SELECT 	 OLD.account_id
			,OLD.account_name
			,NEW.account_name
			,OLD.dba
			,NEW.dba
			,OLD.number_of_ftes
			,NEW.number_of_ftes
			,OLD.number_of_ftes_as_of
			,NEW.number_of_ftes_as_of
			,OLD.number_of_full_time_equivalents
			,NEW.number_of_full_time_equivalents
			,OLD.number_of_full_time_equivalents_as_of_date
			,NEW.number_of_full_time_equivalents_as_of_date
			,OLD.coverage_subject_to_employer_mandate
			,NEW.coverage_subject_to_employer_mandate
			,OLD.market_size
			,NEW.market_size
			,OLD.business_type
			,NEW.business_type
			,OLD.sic_code
			,NEW.sic_code
			,OLD.naics_code
			,NEW.naics_code
			,OLD.requires_5500
			,NEW.requires_5500
			,OLD.locations_by_zip
			,NEW.locations_by_zip
			,OLD.affiliates
			,NEW.affiliates
			,OLD.budgeted_total_annual_premium
			,NEW.budgeted_total_annual_premium
			,OLD.budgeted_total_annual_revenue
			,NEW.budgeted_total_annual_revenue
			,OLD.multiple_payroll_cycles
			,NEW.multiple_payroll_cycles
			,OLD.multiple_payroll_cycles_differ_by
			,NEW.multiple_payroll_cycles_differ_by
			,OLD.single_payroll_cycle
			,NEW.single_payroll_cycle
			,'U';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_group_account_info_u() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_group_account_info_u() TO rl_benefitpoint_x;
GO 

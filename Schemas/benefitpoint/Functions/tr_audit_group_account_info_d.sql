CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_group_account_info_d()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_group_account_info (
		 account_id
		,old_account_name
		,old_dba
		,old_number_of_ftes
		,old_number_of_ftes_as_of
		,old_number_of_full_time_equivalents
		,old_number_of_full_time_equivalents_as_of_date
		,old_coverage_subject_to_employer_mandate
		,old_market_size
		,old_business_type
		,old_sic_code
		,old_naics_code
		,old_requires_5500
		,old_locations_by_zip
		,old_affiliates
		,old_budgeted_total_annual_premium
		,old_budgeted_total_annual_revenue
		,old_multiple_payroll_cycles
		,old_multiple_payroll_cycles_differ_by
		,old_single_payroll_cycle
		,audit_action
	)
	SELECT 	 OLD.account_id
			,OLD.account_name
			,OLD.dba
			,OLD.number_of_ftes
			,OLD.number_of_ftes_as_of
			,OLD.number_of_full_time_equivalents
			,OLD.number_of_full_time_equivalents_as_of_date
			,OLD.coverage_subject_to_employer_mandate
			,OLD.market_size
			,OLD.business_type
			,OLD.sic_code
			,OLD.naics_code
			,OLD.requires_5500
			,OLD.locations_by_zip
			,OLD.affiliates
			,OLD.budgeted_total_annual_premium
			,OLD.budgeted_total_annual_revenue
			,OLD.multiple_payroll_cycles
			,OLD.multiple_payroll_cycles_differ_by
			,OLD.single_payroll_cycle
			,'D';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_group_account_info_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_group_account_info_d() TO rl_benefitpoint_x;
GO 

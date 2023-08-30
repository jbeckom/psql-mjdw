CREATE FUNCTION sagitta.tr_audit_br_coverages_d() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$ 

BEGIN 
	INSERT INTO sagitta.audit_br_coverages (
		 sagitem 
		,old_audit_staff_cd 
		,old_audit_entry_dt 
		,old_audit_time 
		,old_audit_cd 
		,old_audit_history_record_number 
		,old_audit_program 
		,old_audit_effective_dt 
		,old_audit_change_agency_id 
		,old_policy_agency_id 
		,old_builders_risk_yes_no_cd 
		,old_installation_yes_no_cd 
		,old_open_reporting_ind 
		,old_job_specified_ind 
		,old_completed_value 
		,old_job_specific_location_limit 
		,old_job_specific_temporary_limit 
		,old_job_specific_transit_limit 
		,old_job_specific_max_paid 
		,old_first_any_one_location_limit 
		,old_first_any_one_location_construction 
		,old_second_any_one_location_limit 
		,old_second_any_one_location_construction 
		,old_per_disaster_limit 
		,old_temporary_location_limit 
		,old_transit_limit 
		,old_addl_cov_ind 
		,old_off_dt 
		,old_reporting_annual_premium_amt 
		,old_reporting_adj_period 
		,old_reporting_deposit_amt 
		,old_reporting_period 
		,audit_action
	)
	SELECT 	 OLD.sagitem 
			,OLD.audit_staff_cd 
			,OLD.audit_entry_dt 
			,OLD.audit_time 
			,OLD.audit_cd 
			,OLD.audit_history_record_number 
			,OLD.audit_program 
			,OLD.audit_effective_dt 
			,OLD.audit_change_agency_id 
			,OLD.policy_agency_id 
			,OLD.builders_risk_yes_no_cd 
			,OLD.installation_yes_no_cd 
			,OLD.open_reporting_ind 
			,OLD.job_specified_ind 
			,OLD.completed_value 
			,OLD.job_specific_location_limit 
			,OLD.job_specific_temporary_limit 
			,OLD.job_specific_transit_limit 
			,OLD.job_specific_max_paid 
			,OLD.first_any_one_location_limit 
			,OLD.first_any_one_location_construction 
			,OLD.second_any_one_location_limit 
			,OLD.second_any_one_location_construction 
			,OLD.per_disaster_limit 
			,OLD.temporary_location_limit 
			,OLD.transit_limit 
			,OLD.addl_cov_ind 
			,OLD.off_dt 
			,OLD.reporting_annual_premium_amt 
			,OLD.reporting_adj_period 
			,OLD.reporting_deposit_amt 
			,OLD.reporting_period
			,'D'; 
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_br_coverages_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_br_coverages_d() TO rl_sagitta_x;
GO 

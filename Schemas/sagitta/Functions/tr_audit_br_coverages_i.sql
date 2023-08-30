CREATE FUNCTION sagitta.tr_audit_br_coverages_i() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$ 

BEGIN 
	INSERT INTO sagitta.audit_br_coverages (
		 sagitem 
		,new_audit_staff_cd 
		,new_audit_entry_dt 
		,new_audit_time 
		,new_audit_cd 
		,new_audit_history_record_number 
		,new_audit_program 
		,new_audit_effective_dt 
		,new_audit_change_agency_id 
		,new_policy_agency_id 
		,new_builders_risk_yes_no_cd 
		,new_installation_yes_no_cd 
		,new_open_reporting_ind 
		,new_job_specified_ind 
		,new_completed_value 
		,new_job_specific_location_limit 
		,new_job_specific_temporary_limit 
		,new_job_specific_transit_limit 
		,new_job_specific_max_paid 
		,new_first_any_one_location_limit 
		,new_first_any_one_location_construction 
		,new_second_any_one_location_limit 
		,new_second_any_one_location_construction 
		,new_per_disaster_limit 
		,new_temporary_location_limit 
		,new_transit_limit 
		,new_addl_cov_ind 
		,new_off_dt 
		,new_reporting_annual_premium_amt 
		,new_reporting_adj_period 
		,new_reporting_deposit_amt 
		,new_reporting_period 
		,audit_action
	)
	SELECT 	 NEW.sagitem 
			,NEW.audit_staff_cd 
			,NEW.audit_entry_dt 
			,NEW.audit_time 
			,NEW.audit_cd 
			,NEW.audit_history_record_number 
			,NEW.audit_program 
			,NEW.audit_effective_dt 
			,NEW.audit_change_agency_id 
			,NEW.policy_agency_id 
			,NEW.builders_risk_yes_no_cd 
			,NEW.installation_yes_no_cd 
			,NEW.open_reporting_ind 
			,NEW.job_specified_ind 
			,NEW.completed_value 
			,NEW.job_specific_location_limit 
			,NEW.job_specific_temporary_limit 
			,NEW.job_specific_transit_limit 
			,NEW.job_specific_max_paid 
			,NEW.first_any_one_location_limit 
			,NEW.first_any_one_location_construction 
			,NEW.second_any_one_location_limit 
			,NEW.second_any_one_location_construction 
			,NEW.per_disaster_limit 
			,NEW.temporary_location_limit 
			,NEW.transit_limit 
			,NEW.addl_cov_ind 
			,NEW.off_dt 
			,NEW.reporting_annual_premium_amt 
			,NEW.reporting_adj_period 
			,NEW.reporting_deposit_amt 
			,NEW.reporting_period
			,'I'; 
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_br_coverages_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_br_coverages_i() TO rl_sagitta_x;
GO 

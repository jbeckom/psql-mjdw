CREATE OR REPLACE FUNCTION sagitta.sp_br_coverages_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE rc int;

BEGIN 
	INSERT INTO sagitta.br_coverages (
		 sagitem 
		,audit_staff_cd 
		,audit_entry_dt 
		,audit_time 
		,audit_cd 
		,audit_history_record_number 
		,audit_program 
		,audit_effective_dt 
		,audit_change_agency_id 
		,policy_agency_id 
		,builders_risk_yes_no_cd 
		,installation_yes_no_cd 
		,open_reporting_ind 
		,job_specified_ind 
		,completed_value 
		,job_specific_location_limit 
		,job_specific_temporary_limit 
		,job_specific_transit_limit 
		,job_specific_max_paid 
		,first_any_one_location_limit 
		,first_any_one_location_construction 
		,second_any_one_location_limit 
		,second_any_one_location_construction 
		,per_disaster_limit 
		,temporary_location_limit 
		,transit_limit 
		,addl_cov_ind 
		,off_dt 
		,reporting_annual_premium_amt 
		,reporting_adj_period 
		,reporting_deposit_amt 
		,reporting_period 
	)
	SELECT 	 sagitem 
			,audit_staff_cd 
			,audit_entry_dt 
			,audit_time 
			,audit_cd 
			,audit_history_record_number 
			,audit_program 
			,audit_effective_dt 
			,audit_change_agency_id 
			,policy_agency_id 
			,builders_risk_yes_no_cd 
			,installation_yes_no_cd 
			,open_reporting_ind 
			,job_specified_ind 
			,completed_value 
			,job_specific_location_limit 
			,job_specific_temporary_limit 
			,job_specific_transit_limit 
			,job_specific_max_paid 
			,first_any_one_location_limit 
			,first_any_one_location_construction 
			,second_any_one_location_limit 
			,second_any_one_location_construction 
			,per_disaster_limit 
			,temporary_location_limit 
			,transit_limit 
			,addl_cov_ind 
			,off_dt 
			,reporting_annual_premium_amt 
			,reporting_adj_period 
			,reporting_deposit_amt 
			,reporting_period 
	FROM 	sagitta.stg_br_coverages 
	ON CONFLICT (sagitem) DO UPDATE 
	SET 	 audit_staff_cd 						= excluded.audit_staff_cd 
			,audit_entry_dt 						= excluded.audit_entry_dt 
			,audit_time 							= excluded.audit_time 
			,audit_cd 								= excluded.audit_cd 
			,audit_history_record_number 			= excluded.audit_history_record_number 
			,audit_program 							= excluded.audit_program 
			,audit_effective_dt 					= excluded.audit_effective_dt 
			,audit_change_agency_id 				= excluded.audit_change_agency_id 
			,policy_agency_id 						= excluded.policy_agency_id 
			,builders_risk_yes_no_cd 				= excluded.builders_risk_yes_no_cd 
			,installation_yes_no_cd 				= excluded.installation_yes_no_cd 
			,open_reporting_ind 					= excluded.open_reporting_ind 
			,job_specified_ind 						= excluded.job_specified_ind 
			,completed_value 						= excluded.completed_value 
			,job_specific_location_limit 			= excluded.job_specific_location_limit 
			,job_specific_temporary_limit 			= excluded.job_specific_temporary_limit 
			,job_specific_transit_limit 			= excluded.job_specific_transit_limit 
			,job_specific_max_paid 					= excluded.job_specific_max_paid 
			,first_any_one_location_limit 			= excluded.first_any_one_location_limit 
			,first_any_one_location_construction 	= excluded.first_any_one_location_construction 
			,second_any_one_location_limit 			= excluded.second_any_one_location_limit 
			,second_any_one_location_construction 	= excluded.second_any_one_location_construction 
			,per_disaster_limit 					= excluded.per_disaster_limit 
			,temporary_location_limit 				= excluded.temporary_location_limit 
			,transit_limit 							= excluded.transit_limit 
			,addl_cov_ind 							= excluded.addl_cov_ind 
			,off_dt 								= excluded.off_dt 
			,reporting_annual_premium_amt 			= excluded.reporting_annual_premium_amt 
			,reporting_adj_period 					= excluded.reporting_adj_period 
			,reporting_deposit_amt 					= excluded.reporting_deposit_amt 
			,reporting_period 						= excluded.reporting_period 
	WHERE 	(br_coverages.audit_staff_cd,br_coverages.audit_entry_dt,br_coverages.audit_time,br_coverages.audit_cd,br_coverages.audit_history_record_number,br_coverages.audit_program,br_coverages.audit_effective_dt,br_coverages.audit_change_agency_id,br_coverages.policy_agency_id,br_coverages.builders_risk_yes_no_cd,br_coverages.installation_yes_no_cd,br_coverages.open_reporting_ind,br_coverages.job_specified_ind,br_coverages.completed_value,br_coverages.job_specific_location_limit,br_coverages.job_specific_temporary_limit,br_coverages.job_specific_transit_limit,br_coverages.job_specific_max_paid,br_coverages.first_any_one_location_limit,br_coverages.first_any_one_location_construction,br_coverages.second_any_one_location_limit,br_coverages.second_any_one_location_construction,br_coverages.per_disaster_limit,br_coverages.temporary_location_limit,br_coverages.transit_limit,br_coverages.addl_cov_ind,br_coverages.off_dt,br_coverages.reporting_annual_premium_amt,br_coverages.reporting_adj_period,br_coverages.reporting_deposit_amt,br_coverages.reporting_period) 
		IS DISTINCT FROM 	(excluded.audit_staff_cd,excluded.audit_entry_dt,excluded.audit_time,excluded.audit_cd,excluded.audit_history_record_number,excluded.audit_program,excluded.audit_effective_dt,excluded.audit_change_agency_id,excluded.policy_agency_id,excluded.builders_risk_yes_no_cd,excluded.installation_yes_no_cd,excluded.open_reporting_ind,excluded.job_specified_ind,excluded.completed_value,excluded.job_specific_location_limit,excluded.job_specific_temporary_limit,excluded.job_specific_transit_limit,excluded.job_specific_max_paid,excluded.first_any_one_location_limit,excluded.first_any_one_location_construction,excluded.second_any_one_location_limit,excluded.second_any_one_location_construction,excluded.per_disaster_limit,excluded.temporary_location_limit,excluded.transit_limit,excluded.addl_cov_ind,excluded.off_dt,excluded.reporting_annual_premium_amt,excluded.reporting_adj_period,excluded.reporting_deposit_amt,excluded.reporting_period); 
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_br_coverages_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_br_coverages_upsert() TO rl_sagitta_x;
GO 

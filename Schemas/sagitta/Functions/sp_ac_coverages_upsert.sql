CREATE OR REPLACE FUNCTION sagitta.sp_ac_coverages_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE rc int;

BEGIN 
	INSERT INTO sagitta.ac_coverages (
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
		,state_prov_cd 
		,named_customer_name 
		,reporting 
		,non_reporting 
		,accts_rec_dep_premium_amt 
		,accts_rec_min_premium_amt 
		,accts_rec_reporting_period 
		,accts_rec_prem_adjustment_period_desc 
		,accts_rec_first_rate 
		,accts_re_second_rate 
		,accts_rec_rate_premium_amt 
		,not_at_your_premises 
		,all_covered_prop_all_location 
		,accts_rec_in_transit_limit 
		,accts_rec_collapse 
		,accts_rec_removal 
		,libraries_endorsment_applies 
		,val_papers_lmt_away_from_premises 
		,val_papers_blanket 
		,val_papers_blanket_amt 
		,val_papers_specified 
		,val_papers_specified_amt 
		,val_papers_collapse 
		,val_papers_occurence_ded_amt 
		,val_papers_removal 
		,val_papers_removal_limit 
		,off_dt 
		,accts_rec_reporting_period_cd 
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
			,state_prov_cd 
			,named_customer_name 
			,reporting 
			,non_reporting 
			,accts_rec_dep_premium_amt 
			,accts_rec_min_premium_amt 
			,accts_rec_reporting_period 
			,accts_rec_prem_adjustment_period_desc 
			,accts_rec_first_rate 
			,accts_re_second_rate 
			,accts_rec_rate_premium_amt 
			,not_at_your_premises 
			,all_covered_prop_all_location 
			,accts_rec_in_transit_limit 
			,accts_rec_collapse 
			,accts_rec_removal 
			,libraries_endorsment_applies 
			,val_papers_lmt_away_from_premises 
			,val_papers_blanket 
			,val_papers_blanket_amt 
			,val_papers_specified 
			,val_papers_specified_amt 
			,val_papers_collapse 
			,val_papers_occurence_ded_amt 
			,val_papers_removal 
			,val_papers_removal_limit 
			,off_dt 
			,accts_rec_reporting_period_cd 
	FROM 	sagitta.stg_ac_coverages
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
			,state_prov_cd 							= excluded.state_prov_cd 
			,named_customer_name 					= excluded.named_customer_name 
			,reporting 								= excluded.reporting 
			,non_reporting 							= excluded.non_reporting 
			,accts_rec_dep_premium_amt 				= excluded.accts_rec_dep_premium_amt 
			,accts_rec_min_premium_amt 				= excluded.accts_rec_min_premium_amt 
			,accts_rec_reporting_period 			= excluded.accts_rec_reporting_period 
			,accts_rec_prem_adjustment_period_desc 	= excluded.accts_rec_prem_adjustment_period_desc 
			,accts_rec_first_rate 					= excluded.accts_rec_first_rate 
			,accts_re_second_rate 					= excluded.accts_re_second_rate 
			,accts_rec_rate_premium_amt 			= excluded.accts_rec_rate_premium_amt 
			,not_at_your_premises 					= excluded.not_at_your_premises 
			,all_covered_prop_all_location 			= excluded.all_covered_prop_all_location 
			,accts_rec_in_transit_limit 			= excluded.accts_rec_in_transit_limit 
			,accts_rec_collapse 					= excluded.accts_rec_collapse 
			,accts_rec_removal 						= excluded.accts_rec_removal 
			,libraries_endorsment_applies 			= excluded.libraries_endorsment_applies 
			,val_papers_lmt_away_from_premises 		= excluded.val_papers_lmt_away_from_premises 
			,val_papers_blanket 					= excluded.val_papers_blanket 
			,val_papers_blanket_amt 				= excluded.val_papers_blanket_amt 
			,val_papers_specified 					= excluded.val_papers_specified 
			,val_papers_specified_amt 				= excluded.val_papers_specified_amt 
			,val_papers_collapse 					= excluded.val_papers_collapse 
			,val_papers_occurence_ded_amt 			= excluded.val_papers_occurence_ded_amt 
			,val_papers_removal 					= excluded.val_papers_removal 
			,val_papers_removal_limit 				= excluded.val_papers_removal_limit 
			,off_dt 								= excluded.off_dt 
			,accts_rec_reporting_period_cd 			= excluded.accts_rec_reporting_period_cd 
	WHERE 	(ac_coverages.audit_staff_cd,ac_coverages.audit_entry_dt,ac_coverages.audit_time,ac_coverages.audit_cd,ac_coverages.audit_history_record_number,ac_coverages.audit_program,ac_coverages.audit_effective_dt,ac_coverages.audit_change_agency_id,ac_coverages.policy_agency_id,ac_coverages.state_prov_cd,ac_coverages.named_customer_name,ac_coverages.reporting,ac_coverages.non_reporting,ac_coverages.accts_rec_dep_premium_amt,ac_coverages.accts_rec_min_premium_amt,ac_coverages.accts_rec_reporting_period,ac_coverages.accts_rec_prem_adjustment_period_desc,ac_coverages.accts_rec_first_rate,ac_coverages.accts_re_second_rate,ac_coverages.accts_rec_rate_premium_amt,ac_coverages.not_at_your_premises,ac_coverages.all_covered_prop_all_location,ac_coverages.accts_rec_in_transit_limit,ac_coverages.accts_rec_collapse,ac_coverages.accts_rec_removal,ac_coverages.libraries_endorsment_applies,ac_coverages.val_papers_lmt_away_from_premises,ac_coverages.val_papers_blanket,ac_coverages.val_papers_blanket_amt,ac_coverages.val_papers_specified,ac_coverages.val_papers_specified_amt,ac_coverages.val_papers_collapse,ac_coverages.val_papers_occurence_ded_amt,ac_coverages.val_papers_removal,ac_coverages.val_papers_removal_limit,ac_coverages.off_dt,ac_coverages.accts_rec_reporting_period_cd) 
		IS DISTINCT FROM 	(excluded.audit_staff_cd,excluded.audit_entry_dt,excluded.audit_time,excluded.audit_cd,excluded.audit_history_record_number,excluded.audit_program,excluded.audit_effective_dt,excluded.audit_change_agency_id,excluded.policy_agency_id,excluded.state_prov_cd,excluded.named_customer_name,excluded.reporting,excluded.non_reporting,excluded.accts_rec_dep_premium_amt,excluded.accts_rec_min_premium_amt,excluded.accts_rec_reporting_period,excluded.accts_rec_prem_adjustment_period_desc,excluded.accts_rec_first_rate,excluded.accts_re_second_rate,excluded.accts_rec_rate_premium_amt,excluded.not_at_your_premises,excluded.all_covered_prop_all_location,excluded.accts_rec_in_transit_limit,excluded.accts_rec_collapse,excluded.accts_rec_removal,excluded.libraries_endorsment_applies,excluded.val_papers_lmt_away_from_premises,excluded.val_papers_blanket,excluded.val_papers_blanket_amt,excluded.val_papers_specified,excluded.val_papers_specified_amt,excluded.val_papers_collapse,excluded.val_papers_occurence_ded_amt,excluded.val_papers_removal,excluded.val_papers_removal_limit,excluded.off_dt,excluded.accts_rec_reporting_period_cd);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_ac_coverages_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_ac_coverages_upsert() TO rl_sagitta_x;
GO 
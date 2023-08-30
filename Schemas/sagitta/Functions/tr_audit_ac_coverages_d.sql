CREATE OR REPLACE FUNCTION sagitta.tr_audit_ac_coverages_d() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$ 

BEGIN 
	INSERT INTO sagitta.audit_ac_coverages (
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
		,old_state_prov_cd 
		,old_named_customer_name 
		,old_reporting 
		,old_non_reporting 
		,old_accts_rec_dep_premium_amt 
		,old_accts_rec_min_premium_amt 
		,old_accts_rec_reporting_period 
		,old_accts_rec_prem_adjustment_period_desc 
		,old_accts_rec_first_rate 
		,old_accts_re_second_rate 
		,old_accts_rec_rate_premium_amt 
		,old_not_at_your_premises 
		,old_all_covered_prop_all_location 
		,old_accts_rec_in_transit_limit 
		,old_accts_rec_collapse 
		,old_accts_rec_removal 
		,old_libraries_endorsment_applies 
		,old_val_papers_lmt_away_from_premises 
		,old_val_papers_blanket 
		,old_val_papers_blanket_amt 
		,old_val_papers_specified 
		,old_val_papers_specified_amt 
		,old_val_papers_collapse 
		,old_val_papers_occurence_ded_amt 
		,old_val_papers_removal 
		,old_val_papers_removal_limit 
		,old_off_dt 
		,old_accts_rec_reporting_period_cd 
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
			,OLD.state_prov_cd 
			,OLD.named_customer_name 
			,OLD.reporting 
			,OLD.non_reporting 
			,OLD.accts_rec_dep_premium_amt 
			,OLD.accts_rec_min_premium_amt 
			,OLD.accts_rec_reporting_period 
			,OLD.accts_rec_prem_adjustment_period_desc 
			,OLD.accts_rec_first_rate 
			,OLD.accts_re_second_rate 
			,OLD.accts_rec_rate_premium_amt 
			,OLD.not_at_your_premises 
			,OLD.all_covered_prop_all_location 
			,OLD.accts_rec_in_transit_limit 
			,OLD.accts_rec_collapse 
			,OLD.accts_rec_removal 
			,OLD.libraries_endorsment_applies 
			,OLD.val_papers_lmt_away_from_premises 
			,OLD.val_papers_blanket 
			,OLD.val_papers_blanket_amt 
			,OLD.val_papers_specified 
			,OLD.val_papers_specified_amt 
			,OLD.val_papers_collapse 
			,OLD.val_papers_occurence_ded_amt 
			,OLD.val_papers_removal 
			,OLD.val_papers_removal_limit 
			,OLD.off_dt 
			,OLD.accts_rec_reporting_period_cd 
			,'D';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_ac_coverages_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_ac_coverages_d() TO rl_sagitta_x;
GO 

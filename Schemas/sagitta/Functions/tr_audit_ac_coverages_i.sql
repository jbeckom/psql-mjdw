CREATE OR REPLACE FUNCTION sagitta.tr_audit_ac_coverages_i() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$ 

BEGIN 
	INSERT INTO sagitta.audit_ac_coverages (
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
		,new_state_prov_cd 
		,new_named_customer_name 
		,new_reporting 
		,new_non_reporting 
		,new_accts_rec_dep_premium_amt 
		,new_accts_rec_min_premium_amt 
		,new_accts_rec_reporting_period 
		,new_accts_rec_prem_adjustment_period_desc 
		,new_accts_rec_first_rate 
		,new_accts_re_second_rate 
		,new_accts_rec_rate_premium_amt 
		,new_not_at_your_premises 
		,new_all_covered_prop_all_location 
		,new_accts_rec_in_transit_limit 
		,new_accts_rec_collapse 
		,new_accts_rec_removal 
		,new_libraries_endorsment_applies 
		,new_val_papers_lmt_away_from_premises 
		,new_val_papers_blanket 
		,new_val_papers_blanket_amt 
		,new_val_papers_specified 
		,new_val_papers_specified_amt 
		,new_val_papers_collapse 
		,new_val_papers_occurence_ded_amt 
		,new_val_papers_removal 
		,new_val_papers_removal_limit 
		,new_off_dt 
		,new_accts_rec_reporting_period_cd 
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
			,NEW.state_prov_cd 
			,NEW.named_customer_name 
			,NEW.reporting 
			,NEW.non_reporting 
			,NEW.accts_rec_dep_premium_amt 
			,NEW.accts_rec_min_premium_amt 
			,NEW.accts_rec_reporting_period 
			,NEW.accts_rec_prem_adjustment_period_desc 
			,NEW.accts_rec_first_rate 
			,NEW.accts_re_second_rate 
			,NEW.accts_rec_rate_premium_amt 
			,NEW.not_at_your_premises 
			,NEW.all_covered_prop_all_location 
			,NEW.accts_rec_in_transit_limit 
			,NEW.accts_rec_collapse 
			,NEW.accts_rec_removal 
			,NEW.libraries_endorsment_applies 
			,NEW.val_papers_lmt_away_from_premises 
			,NEW.val_papers_blanket 
			,NEW.val_papers_blanket_amt 
			,NEW.val_papers_specified 
			,NEW.val_papers_specified_amt 
			,NEW.val_papers_collapse 
			,NEW.val_papers_occurence_ded_amt 
			,NEW.val_papers_removal 
			,NEW.val_papers_removal_limit 
			,NEW.off_dt 
			,NEW.accts_rec_reporting_period_cd 
			,'I';
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_ac_coverages_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_ac_coverages_i() TO rl_sagitta_x;
GO 

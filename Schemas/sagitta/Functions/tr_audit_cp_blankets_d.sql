CREATE OR REPLACE FUNCTION sagitta.tr_audit_cp_blankets_d() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO sagitta.audit_cp_blankets (
		 sagitem 
		,old_audit_staff_cd 
		,old_audit_entry_dt 
		,old_audit_time 
		,old_audit_cd 
		,old_audit_history_record_number 
		,old_audit_program 
		,old_audit_effective_dt 
		,old_audit_change_agency_id 
		,old_blanket_number 
		,old_policy_agency_id 
		,old_cause 
		,old_coinsurance_pct 
		,old_inflation_guard_pct 
		,old_rate 
		,old_total_blk_limit 
		,old_total_blk_premium 
		,old_blanket_type_cd 
		,old_blanket_type_desc 
		,old_valuation_cd 
		,old_agree_amt_ind 
		,old_ded_symbol 
		,old_ded_amt 
		,old_deductible_type_cd 
		,old_deductible_basis_cd 
		,old_off_dt 
		,old_start_dt 
		,old_second_amt_value_type 
		,old_second_amt_value 
		,old_end_dt 
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
			,OLD.blanket_number 
			,OLD.policy_agency_id 
			,OLD.cause 
			,OLD.coinsurance_pct 
			,OLD.inflation_guard_pct 
			,OLD.rate 
			,OLD.total_blk_limit 
			,OLD.total_blk_premium 
			,OLD.blanket_type_cd 
			,OLD.blanket_type_desc 
			,OLD.valuation_cd 
			,OLD.agree_amt_ind 
			,OLD.ded_symbol 
			,OLD.ded_amt 
			,OLD.deductible_type_cd 
			,OLD.deductible_basis_cd 
			,OLD.off_dt 
			,OLD.start_dt 
			,OLD.second_amt_value_type 
			,OLD.second_amt_value 
			,OLD.end_dt 
			,'D';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_cp_blankets_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_cp_blankets_d() TO rl_sagitta_x;
GO 

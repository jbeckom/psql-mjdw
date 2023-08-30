CREATE OR REPLACE FUNCTION sagitta.tr_audit_cp_blankets_i() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO sagitta.audit_cp_blankets (
		 sagitem 
		,new_audit_staff_cd 
		,new_audit_entry_dt 
		,new_audit_time 
		,new_audit_cd 
		,new_audit_history_record_number 
		,new_audit_program 
		,new_audit_effective_dt 
		,new_audit_change_agency_id 
		,new_blanket_number 
		,new_policy_agency_id 
		,new_cause 
		,new_coinsurance_pct 
		,new_inflation_guard_pct 
		,new_rate 
		,new_total_blk_limit 
		,new_total_blk_premium 
		,new_blanket_type_cd 
		,new_blanket_type_desc 
		,new_valuation_cd 
		,new_agree_amt_ind 
		,new_ded_symbol 
		,new_ded_amt 
		,new_deductible_type_cd 
		,new_deductible_basis_cd 
		,new_off_dt 
		,new_start_dt 
		,new_second_amt_value_type 
		,new_second_amt_value 
		,new_end_dt 
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
			,NEW.blanket_number 
			,NEW.policy_agency_id 
			,NEW.cause 
			,NEW.coinsurance_pct 
			,NEW.inflation_guard_pct 
			,NEW.rate 
			,NEW.total_blk_limit 
			,NEW.total_blk_premium 
			,NEW.blanket_type_cd 
			,NEW.blanket_type_desc 
			,NEW.valuation_cd 
			,NEW.agree_amt_ind 
			,NEW.ded_symbol 
			,NEW.ded_amt 
			,NEW.deductible_type_cd 
			,NEW.deductible_basis_cd 
			,NEW.off_dt 
			,NEW.start_dt 
			,NEW.second_amt_value_type 
			,NEW.second_amt_value 
			,NEW.end_dt 
			,'I';
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_cp_blankets_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_cp_blankets_i() TO rl_sagitta_x;
GO 

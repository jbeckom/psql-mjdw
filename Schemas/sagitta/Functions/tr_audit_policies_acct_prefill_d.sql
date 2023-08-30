CREATE OR REPLACE FUNCTION sagitta.tr_audit_policies_acct_prefill_d()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO sagitta.audit_policies_acct_prefill (
		 sagitem
		,old_audit_staff_cd
		,old_audit_entry_dt
		,old_audit_time
		,old_audit_cd
		,old_audit_history_record_number
		,old_audit_program
		,old_audit_effective_dt
		,old_audit_change_agency_id
		,old_policy_number
		,old_client_cd
		,old_net_commission_pct
		,old_create_producer_payable
		,old_filing_state
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
			,OLD.policy_number
			,OLD.client_cd
			,OLD.net_commission_pct
			,OLD.create_producer_payable
			,OLD.filing_state
			,'D';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_policies_acct_prefill_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_policies_acct_prefill_d() TO rl_sagitta_x;
GO 

CREATE OR REPLACE FUNCTION sagitta.tr_audit_policies_acct_prefill_i()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO sagitta.audit_policies_acct_prefill (
		 sagitem
		,new_audit_staff_cd
		,new_audit_entry_dt
		,new_audit_time
		,new_audit_cd
		,new_audit_history_record_number
		,new_audit_program
		,new_audit_effective_dt
		,new_audit_change_agency_id
		,new_policy_number
		,new_client_cd
		,new_net_commission_pct
		,new_create_producer_payable
		,new_filing_state
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
			,NEW.policy_number
			,NEW.client_cd
			,NEW.net_commission_pct
			,NEW.create_producer_payable
			,NEW.filing_state
			,'I';
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_policies_acct_prefill_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_policies_acct_prefill_i() TO rl_sagitta_x;
GO 

CREATE OR REPLACE FUNCTION sagitta.tr_audit_policies_acct_prefill_u()
RETURNS trigger
LANGUAGE plpgsql
AS $$

BEGIN 
	INSERT INTO sagitta.audit_policies_acct_prefill (
		 sagitem
		,old_audit_staff_cd
        ,new_audit_staff_cd
		,old_audit_entry_dt
        ,new_audit_entry_dt
		,old_audit_time
        ,new_audit_time
		,old_audit_cd
        ,new_audit_cd
		,old_audit_history_record_number
        ,new_audit_history_record_number
		,old_audit_program
        ,new_audit_program
		,old_audit_effective_dt
        ,new_audit_effective_dt
		,old_audit_change_agency_id
        ,new_audit_change_agency_id
		,old_policy_number
        ,new_policy_number
		,old_client_cd
        ,new_client_cd
		,old_net_commission_pct
        ,new_net_commission_pct
		,old_create_producer_payable
        ,new_create_producer_payable
		,old_filing_state
        ,new_filing_state
		,audit_action 
	)
	SELECT 	 OLD.sagitem
			,OLD.audit_staff_cd
            ,NEW.audit_staff_cd
			,OLD.audit_entry_dt
            ,NEW.audit_entry_dt
			,OLD.audit_time
            ,NEW.audit_time
			,OLD.audit_cd
            ,NEW.audit_cd
			,OLD.audit_history_record_number
            ,NEW.audit_history_record_number
			,OLD.audit_program
            ,NEW.audit_program
			,OLD.audit_effective_dt
            ,NEW.audit_effective_dt
			,OLD.audit_change_agency_id
            ,NEW.audit_change_agency_id
			,OLD.policy_number
            ,NEW.policy_number
			,OLD.client_cd
            ,NEW.client_cd
			,OLD.net_commission_pct
            ,NEW.net_commission_pct
			,OLD.create_producer_payable
            ,NEW.create_producer_payable
			,OLD.filing_state
            ,NEW.filing_state
			,'U';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_policies_acct_prefill_u() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_policies_acct_prefill_u() TO rl_sagitta_x;
GO 

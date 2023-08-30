CREATE OR REPLACE FUNCTION sagitta.tr_audit_policies_acct_prefill_mbpati_i()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO sagitta.audit_policies_acct_prefill_mbpati (
		 sagitem
		,lis
		,new_billto
		,new_billto_percent
		,new_billto_amount
		,new_ins
		,new_payee
		,new_payee_percent
		,new_payee_amt
		,new_agency_pct
		,new_agency_amt
		,audit_action
	)
	SELECT 	 NEW.sagitem
			,NEW.lis
			,NEW.billto
			,NEW.billto_percent
			,NEW.billto_amount
			,NEW.ins
			,NEW.payee
			,NEW.payee_percent
			,NEW.payee_amt
			,NEW.agency_pct
			,NEW.agency_amt
			,'I';
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_policies_acct_prefill_mbpati_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_policies_acct_prefill_mbpati_i() TO rl_sagitta_x;
GO 
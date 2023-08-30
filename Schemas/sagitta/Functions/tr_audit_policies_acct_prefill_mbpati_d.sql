CREATE OR REPLACE FUNCTION sagitta.tr_audit_policies_acct_prefill_mbpati_d()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO sagitta.audit_policies_acct_prefill_mbpati (
		 sagitem
		,lis
		,old_billto
		,old_billto_percent
		,old_billto_amount
		,old_ins
		,old_payee
		,old_payee_percent
		,old_payee_amt
		,old_agency_pct
		,old_agency_amt
		,audit_action
	)
	SELECT 	 OLD.sagitem
			,OLD.lis
			,OLD.billto
			,OLD.billto_percent
			,OLD.billto_amount
			,OLD.ins
			,OLD.payee
			,OLD.payee_percent
			,OLD.payee_amt
			,OLD.agency_pct
			,OLD.agency_amt
			,'D';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_policies_acct_prefill_mbpati_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_policies_acct_prefill_mbpati_d() TO rl_sagitta_x;
GO 

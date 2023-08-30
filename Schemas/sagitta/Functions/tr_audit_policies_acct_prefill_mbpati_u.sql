CREATE OR REPLACE FUNCTION sagitta.tr_audit_policies_acct_prefill_mbpati_u()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO sagitta.audit_policies_acct_prefill_mbpati (
		 sagitem
		,lis
		,old_billto
		,new_billto
		,old_billto_percent
		,new_billto_percent
		,old_billto_amount
		,new_billto_amount
		,old_ins
		,new_ins
		,old_payee
		,new_payee
		,old_payee_percent
		,new_payee_percent
		,old_payee_amt
		,new_payee_amt
		,old_agency_pct
		,new_agency_pct
		,old_agency_amt
		,new_agency_amt
		,audit_action
	)
	SELECT 	 OLD.sagitem
			,OLD.lis
			,OLD.billto
			,NEW.billto
			,OLD.billto_percent
			,NEW.billto_percent
			,OLD.billto_amount
			,NEW.billto_amount
			,OLD.ins
			,NEW.ins
			,OLD.payee
			,NEW.payee
			,OLD.payee_percent
			,NEW.payee_percent
			,OLD.payee_amt
			,NEW.payee_amt
			,OLD.agency_pct
			,NEW.agency_pct
			,OLD.agency_amt
			,NEW.agency_amt
			,'U';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_policies_acct_prefill_mbpati_u() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_policies_acct_prefill_mbpati_u() TO mj_admin;
GO 

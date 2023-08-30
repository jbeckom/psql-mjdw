CREATE OR REPLACE FUNCTION sagitta.tr_audit_policies_acct_prefill_mpci_u()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO sagitta.audit_policies_acct_prefill_mpci (
		 sagitem
		,lis
		,old_producer_cd
		,new_producer_cd
		,old_producer_new_pct
		,new_producer_new_pct
		,old_ig_rel_ind
		,new_ig_rel_ind
		,old_producer_renewal_pct
		,new_producer_renewal_pct
		,audit_action
	)
	SELECT 	 OLD.sagitem
			,OLD.lis
			,OLD.producer_cd
			,NEW.producer_cd
			,OLD.producer_new_pct
			,NEW.producer_new_pct
			,OLD.ig_rel_ind
			,NEW.ig_rel_ind
			,OLD.producer_renewal_pct
			,NEW.producer_renewal_pct
			,'U';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_policies_acct_prefill_mpci_u() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_policies_acct_prefill_mpci_u() TO rl_sagitta_x;
GO 

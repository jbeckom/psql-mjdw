CREATE OR REPLACE FUNCTION sagitta.tr_audit_policies_acct_prefill_mpci_i()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO sagitta.audit_policies_acct_prefill_mpci (
		 sagitem
		,lis
		,new_producer_cd
		,new_producer_new_pct
		,new_ig_rel_ind
		,new_producer_renewal_pct
		,audit_action
	)
	SELECT 	 NEW.sagitem
			,NEW.lis
			,NEW.producer_cd
			,NEW.producer_new_pct
			,NEW.ig_rel_ind
			,NEW.producer_renewal_pct
			,'I';
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_policies_acct_prefill_mpci_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_policies_acct_prefill_mpci_i() TO rl_sagitta_x;
GO 

CREATE OR REPLACE FUNCTION sagitta.tr_audit_policies_acct_prefill_ati_u()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO sagitta.audit_policies_acct_prefill_ati (
		 sagitem
		,lis
		,old_transaction_cd
		,new_transaction_cd
		,old_transaction_cov_cd
		,new_transaction_cov_cd
		,old_transaction_payee_cd
		,new_transaction_payee_cd
		,old_transaction_amt
		,new_transaction_amt
		,old_transaction_prorated_repeated
		,new_transaction_prorated_repeated
		,old_transaction_admitted_yes_no_ind
		,new_transaction_admitted_yes_no_ind
		,old_transaction_percentage
		,new_transaction_percentage
		,old_transaction_basis
		,new_transaction_basis
		,old_transaction_rounding
		,new_transaction_rounding
		,old_transaction_taxable
		,new_transaction_taxable
		,old_transaction_indicator
		,new_transaction_indicator
		,audit_action
	)
	SELECT 	 OLD.sagitem
			,OLD.lis
			,OLD.transaction_cd
			,NEW.transaction_cd
			,OLD.transaction_cov_cd
			,NEW.transaction_cov_cd
			,OLD.transaction_payee_cd
			,NEW.transaction_payee_cd
			,OLD.transaction_amt
			,NEW.transaction_amt
			,OLD.transaction_prorated_repeated
			,NEW.transaction_prorated_repeated
			,OLD.transaction_admitted_yes_no_ind
			,NEW.transaction_admitted_yes_no_ind
			,OLD.transaction_percentage
			,NEW.transaction_percentage
			,OLD.transaction_basis
			,NEW.transaction_basis
			,OLD.transaction_rounding
			,NEW.transaction_rounding
			,OLD.transaction_taxable
			,NEW.transaction_taxable
			,OLD.transaction_indicator
			,NEW.transaction_indicator
			,'U';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_policies_acct_prefill_ati_u() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_policies_acct_prefill_ati_u() TO rl_sagitta_x;
GO 

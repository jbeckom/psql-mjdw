CREATE OR REPLACE FUNCTION sagitta.tr_audit_policies_acct_prefill_ati_d()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO sagitta.audit_policies_acct_prefill_ati (
		 sagitem
		,lis
		,old_transaction_cd
		,old_transaction_cov_cd
		,old_transaction_payee_cd
		,old_transaction_amt
		,old_transaction_prorated_repeated
		,old_transaction_admitted_yes_no_ind
		,old_transaction_percentage
		,old_transaction_basis
		,old_transaction_rounding
		,old_transaction_taxable
		,old_transaction_indicator
		,audit_action
	)
	SELECT 	 OLD.sagitem
			,OLD.lis
			,OLD.transaction_cd
			,OLD.transaction_cov_cd
			,OLD.transaction_payee_cd
			,OLD.transaction_amt
			,OLD.transaction_prorated_repeated
			,OLD.transaction_admitted_yes_no_ind
			,OLD.transaction_percentage
			,OLD.transaction_basis
			,OLD.transaction_rounding
			,OLD.transaction_taxable
			,OLD.transaction_indicator
			,'D';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_policies_acct_prefill_ati_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_policies_acct_prefill_ati_d() TO rl_sagitta_x;
GO 

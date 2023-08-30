CREATE OR REPLACE FUNCTION sagitta.tr_audit_policies_acct_prefill_ati_i()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO sagitta.audit_policies_acct_prefill_ati (
		 sagitem
		,lis
		,new_transaction_cd
		,new_transaction_cov_cd
		,new_transaction_payee_cd
		,new_transaction_amt
		,new_transaction_prorated_repeated
		,new_transaction_admitted_yes_no_ind
		,new_transaction_percentage
		,new_transaction_basis
		,new_transaction_rounding
		,new_transaction_taxable
		,new_transaction_indicator
		,audit_action
	)
	SELECT 	 NEW.sagitem
			,NEW.lis
			,NEW.transaction_cd
			,NEW.transaction_cov_cd
			,NEW.transaction_payee_cd
			,NEW.transaction_amt
			,NEW.transaction_prorated_repeated
			,NEW.transaction_admitted_yes_no_ind
			,NEW.transaction_percentage
			,NEW.transaction_basis
			,NEW.transaction_rounding
			,NEW.transaction_taxable
			,NEW.transaction_indicator
			,'I';
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_policies_acct_prefill_ati_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_policies_acct_prefill_ati_i() TO rl_sagitta_x;
GO 

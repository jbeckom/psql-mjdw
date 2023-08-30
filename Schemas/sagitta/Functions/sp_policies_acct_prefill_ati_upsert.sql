DROP FUNCTION IF EXISTS sagitta.sp_policies_acct_prefill_ati_upsert(int, int, text);
GO 

CREATE OR REPLACE FUNCTION sagitta.sp_policies_acct_prefill_ati_upsert()
RETURNS int 
LANGUAGE plpgsql 
AS $$ 

DECLARE rc int; 

BEGIN 
	INSERT INTO sagitta.policies_acct_prefill_ati (
		 sagitem 
		,lis 
		,transaction_cd 
		,transaction_cov_cd 
		,transaction_payee_cd 
		,transaction_amt 
		,transaction_prorated_repeated 
		,transaction_admitted_yes_no_ind 
		,transaction_percentage 
		,transaction_basis 
		,transaction_rounding 
		,transaction_taxable 
		,transaction_indicator 
	)
	SELECT 	 sagitem 
			,lis 
			,transaction_cd 
			,transaction_cov_cd 
			,transaction_payee_cd 
			,transaction_amt 
			,transaction_prorated_repeated 
			,transaction_admitted_yes_no_ind 
			,transaction_percentage 
			,transaction_basis 
			,transaction_rounding 
			,transaction_taxable 
			,transaction_indicator 
	FROM 	sagitta.stg_policies_acct_prefill_ati 
	ON CONFLICT (sagitem, lis) DO UPDATE 
	SET 	 transaction_cd 					= excluded.transaction_cd 
			,transaction_cov_cd 				= excluded.transaction_cov_cd 
			,transaction_payee_cd 				= excluded.transaction_payee_cd 
			,transaction_amt 					= excluded.transaction_amt 
			,transaction_prorated_repeated 		= excluded.transaction_prorated_repeated 
			,transaction_admitted_yes_no_ind 	= excluded.transaction_admitted_yes_no_ind 
			,transaction_percentage 			= excluded.transaction_percentage 
			,transaction_basis 					= excluded.transaction_basis 
			,transaction_rounding 				= excluded.transaction_rounding 
			,transaction_taxable 				= excluded.transaction_taxable 
			,transaction_indicator 				= excluded.transaction_indicator 
	WHERE 	(policies_acct_prefill_ati.transaction_cd,policies_acct_prefill_ati.transaction_cov_cd,policies_acct_prefill_ati.transaction_payee_cd,policies_acct_prefill_ati.transaction_amt,policies_acct_prefill_ati.transaction_prorated_repeated,policies_acct_prefill_ati.transaction_admitted_yes_no_ind,policies_acct_prefill_ati.transaction_percentage,policies_acct_prefill_ati.transaction_basis,policies_acct_prefill_ati.transaction_rounding,policies_acct_prefill_ati.transaction_taxable,policies_acct_prefill_ati.transaction_indicator) 
		IS DISTINCT FROM 	(excluded.transaction_cd,excluded.transaction_cov_cd,excluded.transaction_payee_cd,excluded.transaction_amt,excluded.transaction_prorated_repeated,excluded.transaction_admitted_yes_no_ind,excluded.transaction_percentage,excluded.transaction_basis,excluded.transaction_rounding,excluded.transaction_taxable,excluded.transaction_indicator); 
	
	GET DIAGNOSTICS rc = row_count; 

	RETURN rc; 
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_policies_acct_prefill_ati_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_policies_acct_prefill_ati_upsert() TO rl_sagitta_x;
GO 

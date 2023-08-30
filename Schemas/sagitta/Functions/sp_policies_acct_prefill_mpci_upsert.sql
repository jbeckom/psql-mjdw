DROP FUNCTION IF EXISTS sagitta.sp_policies_acct_prefill_mpci_upsert(int, int, text);
GO 

CREATE OR REPLACE FUNCTION sagitta.sp_policies_acct_prefill_mpci_upsert()
RETURNS int  
LANGUAGE plpgsql 
AS $$ 

DECLARE rc int; 

BEGIN 
	INSERT INTO sagitta.policies_acct_prefill_mpci (
		 sagitem
		,lis
		,producer_cd
		,producer_new_pct
		,ig_rel_ind
		,producer_renewal_pct
	)
	SELECT 	 sagitem
			,lis
			,producer_cd
			,producer_new_pct
			,ig_rel_ind
			,producer_renewal_pct
	FROM 	sagitta.stg_policies_acct_prefill_mpci 
	ON CONFLICT (sagitem, lis) DO UPDATE 
	SET 	 producer_cd 			= excluded.producer_cd 
			,producer_new_pct 		= excluded.producer_new_pct 
			,ig_rel_ind 			= excluded.ig_rel_ind 
			,producer_renewal_pct 	= excluded.producer_renewal_pct 
	WHERE 	(policies_acct_prefill_mpci.producer_cd,policies_acct_prefill_mpci.producer_new_pct,policies_acct_prefill_mpci.ig_rel_ind,policies_acct_prefill_mpci.producer_renewal_pct) 
		IS DISTINCT FROM 	(excluded.producer_cd,excluded.producer_new_pct,excluded.ig_rel_ind,excluded.producer_renewal_pct); 
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_policies_acct_prefill_mpci_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_policies_acct_prefill_mpci_upsert() TO rl_sagitta_x;
GO 

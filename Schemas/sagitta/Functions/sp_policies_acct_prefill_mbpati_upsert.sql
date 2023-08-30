DROP FUNCTION IF EXISTS sagitta.sp_policies_acct_prefill_mbpati_upsert(int, int, text);
GO 

CREATE OR REPLACE FUNCTION sagitta.sp_policies_acct_prefill_mbpati_upsert()
RETURNS int 
LANGUAGE plpgsql 
AS $$ 

DECLARE rc int;

BEGIN 
	INSERT INTO sagitta.policies_acct_prefill_mbpati (
		 sagitem
		,lis
		,billto
		,billto_percent
		,billto_amount
		,ins
		,payee
		,payee_percent
		,payee_amt
		,agency_pct
		,agency_amt
	)
	SELECT 	 sagitem
			,lis
			,billto
			,billto_percent
			,billto_amount
			,ins
			,payee
			,payee_percent
			,payee_amt
			,agency_pct
			,agency_amt
	FROM 	sagitta.stg_policies_acct_prefill_mbpati
	ON CONFLICT (sagitem, lis) DO UPDATE 
	SET 	 billto 			= excluded.billto 
			,billto_percent 	= excluded.billto_percent 
			,billto_amount 		= excluded.billto_amount 
			,ins 				= excluded.ins 
			,payee 				= excluded.payee 
			,payee_percent 		= excluded.payee_percent 
			,payee_amt 			= excluded.payee_amt 
			,agency_pct 		= excluded.agency_pct 
			,agency_amt 		= excluded.agency_amt 
	WHERE 	(policies_acct_prefill_mbpati.billto,policies_acct_prefill_mbpati.billto_percent,policies_acct_prefill_mbpati.billto_amount,policies_acct_prefill_mbpati.ins,policies_acct_prefill_mbpati.payee,policies_acct_prefill_mbpati.payee_percent,policies_acct_prefill_mbpati.payee_amt,policies_acct_prefill_mbpati.agency_pct,policies_acct_prefill_mbpati.agency_amt) 
		IS DISTINCT FROM 	(excluded.billto,excluded.billto_percent,excluded.billto_amount,excluded.ins,excluded.payee,excluded.payee_percent,excluded.payee_amt,excluded.agency_pct,excluded.agency_amt); 
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_policies_acct_prefill_mbpati_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_policies_acct_prefill_mbpati_upsert() TO rl_sagitta_x;
GO 

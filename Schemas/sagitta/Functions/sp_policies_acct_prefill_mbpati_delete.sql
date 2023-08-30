CREATE OR REPLACE FUNCTION sagitta.sp_policies_acct_prefill_mbpati_delete(_sagitem int)
RETURNS void 
LANGUAGE plpgsql 
AS $$

BEGIN 
	DELETE FROM sagitta.policies_acct_prefill_mbpati
	WHERE 	sagitem = _sagitem;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_policies_acct_prefill_mbpati_delete(int) OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_policies_acct_prefill_mbpati_delete(int) TO rl_sagitta_x;
GO 

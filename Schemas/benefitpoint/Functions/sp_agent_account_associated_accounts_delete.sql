CREATE OR REPLACE FUNCTION benefitpoint.sp_agent_account_associated_accounts_delete(_agent_account_id int)
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE 
	rc 	int;
	
BEGIN 
	rc := 0;

	DELETE 
	FROM 	benefitpoint.agent_account_associated_accounts 
	WHERE 	agent_account_id = _agent_account_id;

	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.sp_agent_account_associated_accounts_delete (int) OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.sp_agent_account_associated_accounts_delete (int) TO rl_benefitpoint_x;
GO 

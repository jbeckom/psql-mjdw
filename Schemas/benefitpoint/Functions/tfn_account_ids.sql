CREATE OR REPLACE FUNCTION benefitpoint.tfn_account_ids()
RETURNS TABLE (_account_id int)
LANGUAGE plpgsql 
AS $$

BEGIN 
	RETURN query (
		SELECT 	account_id 
		FROM 	benefitpoint.account
	);
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tfn_account_ids() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tfn_account_ids() TO rl_benefitpoint_x;
GO 

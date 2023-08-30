CREATE OR REPLACE FUNCTION powerapps.fn_account_last_update (_account_source text)
RETURNS timestamp 
LANGUAGE plpgsql 
AS $$

BEGIN 
	RETURN (
		SELECT 	max(a.modify_dt) 	AS last_mod
		FROM 	powerapps.account 	AS a
		WHERE 	a.account_source = upper(_account_source)
	);
END;
$$;
GO

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.fn_account_last_update (text) OWNER TO mj_admin;
GO

GRANT EXECUTE ON FUNCTION powerapps.fn_account_last_update TO rl_powerapps_x;
GO
DROP FUNCTION IF EXISTS benefitpoint.fn_account_last_modified();
GO 

CREATE OR REPLACE FUNCTION benefitpoint.fn_account_last_modified()
RETURNS timestamptz 
LANGUAGE plpgsql 
AS $$

BEGIN 
	RETURN (
		SELECT 	max(a.last_modified_on)
		FROM 	benefitpoint.account 	AS a
	);
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.fn_account_last_modified() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.fn_account_last_modified() TO rl_benefitpoint_x;
GO 

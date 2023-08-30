CREATE OR REPLACE FUNCTION benefitpoint.fn_account_contact_last_modified() 
RETURNS timestamptz 
LANGUAGE plpgsql 
AS $$

BEGIN 
	RETURN (
		SELECT 	max(last_modified_on)
		FROM 	benefitpoint.account_contact
	);
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.fn_account_contact_last_modified() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.fn_account_contact_last_modified() TO rl_benefitpoint_x;
GO 
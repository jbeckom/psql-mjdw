CREATE OR REPLACE FUNCTION benefitpoint.sp_account_contact_locations_delete (_account_id int)
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE rc int;

BEGIN 
	rc := 0;

	DELETE 
	FROM 	benefitpoint.account_contact_locations 
	WHERE 	account_id = _account_id;

	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.sp_account_contact_locations_delete (int) OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.sp_account_contact_locations_delete (int) TO rl_benefitpoint_x;
GO 

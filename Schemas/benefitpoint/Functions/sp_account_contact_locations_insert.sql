CREATE OR REPLACE FUNCTION benefitpoint.sp_account_contact_locations_insert (_account_id int, _location_id int) 
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE rc int;

BEGIN 
	rc := 0;

	INSERT INTO benefitpoint.account_contact_locations (account_id, location_id)
	VALUES (_account_id, _location_id);

	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.sp_account_contact_locations_insert(int, int) OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.sp_account_contact_locations_insert(int, int) TO rl_benefitpoint_x;
GO 

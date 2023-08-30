CREATE OR REPLACE FUNCTION benefitpoint.sp_carrier_contact_users_insert (_carrier_id int, _contact_id int, _user_id int) 
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE rc int;

BEGIN 
	rc := 0;

	INSERT INTO benefitpoint.carrier_contact_users (carrier_id, contact_id, user_id) 
	VALUES (_carrier_id, _contact_id, _user_id);

	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.sp_carrier_contact_users_insert (int, int, int) OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.sp_carrier_contact_users_insert (int, int, int) TO rl_benefitpoint_x;
GO 

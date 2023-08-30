CREATE OR REPLACE FUNCTION benefitpoint.sp_carrier_contact_offices_delete (_carrier_id int, _contact_id int) 
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE rc int;

BEGIN 
	DELETE
	FROM 	benefitpoint.carrier_contact_offices 
	WHERE 	carrier_id 	= _carrier_id 
		AND contact_id 	= _contact_id;
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.sp_carrier_contact_offices_delete (int, int) OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.sp_carrier_contact_offices_delete (int, int) TO rl_benefitpoint_x;
GO 

CREATE OR REPLACE FUNCTION benefitpoint.sp_carrier_contact_supported_territories_insert (_carrier_id int, _contact_id int, _supported_territory text) 
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE rc int;

BEGIN 
	rc := 0;

	INSERT INTO benefitpoint.carrier_contact_supported_territories (carrier_id, contact_id, supported_territory)
	VALUES (_carrier_id, _contact_id, _supported_territory::benefitpoint.state);

	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.sp_carrier_contact_supported_territories_insert (int, int, text) OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.sp_carrier_contact_supported_territories_insert (int, int, text) TO rl_benefitpoint_x;
GO 

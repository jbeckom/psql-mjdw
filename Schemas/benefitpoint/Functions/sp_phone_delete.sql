CREATE OR REPLACE FUNCTION benefitpoint.sp_phone_delete (_phone_source TEXT, _source_type TEXT, _source_key int)
RETURNS int
LANGUAGE plpgsql 
AS $$

DECLARE rc int;

BEGIN 
	rc := 0;
	
	DELETE 
	FROM 	benefitpoint.phone 
	WHERE 	phone_source 	= _phone_source 
		AND source_type 	= _source_type 
		AND source_key 		= _source_key;
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.sp_phone_delete (TEXT, TEXT, int) OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.sp_phone_delete (TEXT, TEXT, int) TO rl_benefitpoint_x;
GO 

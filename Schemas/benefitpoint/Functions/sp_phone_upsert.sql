CREATE OR REPLACE FUNCTION benefitpoint.sp_phone_upsert()
RETURNS int
LANGUAGE plpgsql
AS $$

DECLARE rc int;

BEGIN 
	INSERT INTO benefitpoint.phone(
		 phone_source
		,source_type
		,source_key
		,area_code
		,"number"
		,"type"
	)
	SELECT 	 phone_source
			,source_type
			,source_key::int
			,area_code
			,"number"
			,"type"
	FROM 	benefitpoint.stg_phone 
	ON CONFLICT (phone_source, source_type, source_key, area_code, "number", "type") DO NOTHING;

	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.sp_phone_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.sp_phone_upsert() TO rl_benefitpoint_x;
GO 

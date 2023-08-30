CREATE OR REPLACE FUNCTION benefitpoint.sp_license_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE rc int;

BEGIN 
	INSERT INTO benefitpoint.license (
		 license_source 
		,source_key 
		,license_id 
		,state 
		,license_number 
		,residence_license 
		,license_on 
		,license_expires_on 
		,e_and_o_expires_on 
	)
	SELECT 	 license_source 
			,source_key 
			,license_id 
			,state 
			,license_number 
			,residence_license::bool 
			,license_on::timestamp 
			,license_expires_on::timestamp 
			,e_and_o_expires_on::timestamp 
	FROM 	benefitpoint.stg_license 
	ON CONFLICT (license_source, source_key, license_id) DO UPDATE 
	SET 	 state 					= excluded.state
			,license_number 		= excluded.license_number
			,residence_license 		= excluded.residence_license
			,license_on 			= excluded.license_on
			,license_expires_on 	= excluded.license_expires_on
			,e_and_o_expires_on 	= excluded.e_and_o_expires_on
	WHERE 	(license.state,license.license_number,license.residence_license,license.license_on,license.license_expires_on,license.e_and_o_expires_on) 
		IS DISTINCT FROM 	(excluded.state,excluded.license_number,excluded.residence_license,excluded.license_on,excluded.license_expires_on,excluded.e_and_o_expires_on);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.sp_license_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.sp_license_upsert() TO rl_benefitpoint_x;
GO 

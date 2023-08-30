ALTER TABLE benefitpoint.address 
	 ALTER COLUMN country SET DATA TYPE TEXT USING country::TEXT 
	,ALTER COLUMN state SET DATA TYPE TEXT USING state::TEXT;
GO 

ALTER TABLE benefitpoint.audit_license 
	 ALTER COLUMN old_state SET DATA TYPE TEXT USING old_state::TEXT
	,ALTER COLUMN new_state SET DATA TYPE TEXT USING new_state::TEXT;
GO 

ALTER TABLE benefitpoint.carrier_contact_supported_territories 
	ALTER COLUMN supported_territory SET DATA TYPE TEXT USING supported_territory::TEXT;
GO 

ALTER TABLE benefitpoint.license 
	ALTER COLUMN state SET DATA TYPE TEXT USING state::TEXT;
GO 

DROP TYPE IF EXISTS benefitpoint."country";
GO 

DROP TYPE IF EXISTS benefitpoint."state";
GO 

DROP FUNCTION IF EXISTS benefitpoint.sp_address_upsert(TEXT, TEXT, int, text);
GO 

CREATE OR REPLACE FUNCTION benefitpoint.sp_address_upsert()
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE rc int;

BEGIN 
	INSERT INTO benefitpoint.address(
		 address_source
		,source_type
		,source_key
		,street_1
		,street_2
		,city
		,state
		,zip
		,country
	)
	SELECT 	 address_source
			,source_type
			,source_key
			,street_1
			,street_2
			,city
			,state
			,zip
			,country
	FROM 	benefitpoint.stg_address
	ON CONFLICT (address_source, source_type, source_key) DO UPDATE 
	SET 	 street_1 	= excluded.street_1
			,street_2 	= excluded.street_2
			,city 		= excluded.city
			,state 		= excluded.state
			,zip 		= excluded.zip
			,country 	= excluded.country
	WHERE 	(address.street_1,address.street_2,address.city,address.state,address.zip,address.country) 
		IS DISTINCT FROM 	(excluded.street_1,excluded.street_2,excluded.city,excluded.state,excluded.zip,excluded.country);
	
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.sp_address_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.sp_address_upsert() TO rl_benefitpoint_x;
GO 

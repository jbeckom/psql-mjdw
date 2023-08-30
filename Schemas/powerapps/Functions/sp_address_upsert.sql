CREATE OR REPLACE FUNCTION powerapps.sp_address_upsert()
RETURNS int
LANGUAGE plpgsql
AS $$ 

DECLARE rc int;

BEGIN 
	INSERT INTO powerapps.address(
		 address_source
		,source_type
		,source_key
		,source_address_type 
		,address_type 
		,street_1
		,street_2
		,city
		,state_province
		,zip_post_code
		,country_region
		,modify_dt
	) 
	SELECT 	 address_source
			,source_type
			,source_key 
			,source_address_type 
			,address_type 
			,street_1
			,street_2
			,city
			,state_province
			,zip_post_code
			,country_region
			,modify_dt
	FROM 	powerapps.stg_address 
	ON CONFLICT (address_source, source_type, source_key, source_address_type) DO UPDATE 
	SET 	 address_type 		= excluded.address_type 
			,street_1 			= excluded.street_1
			,street_2 			= excluded.street_2
			,city 				= excluded.city
			,state_province 	= excluded.state_province
			,zip_post_code 		= excluded.zip_post_code
			,country_region 	= excluded.country_region
			,modify_dt 			= excluded.modify_dt 
	WHERE 	(address.address_type,address.street_1,address.street_2,address.city,address.state_province,address.zip_post_code,address.country_region,address.modify_dt) 
		IS DISTINCT FROM 	(excluded.address_type,excluded.street_1,excluded.street_2,excluded.city,excluded.state_province,excluded.zip_post_code,excluded.country_region,excluded.modify_dt);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.sp_address_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION powerapps.sp_address_upsert() TO rl_powerapps_x;
GO 
 
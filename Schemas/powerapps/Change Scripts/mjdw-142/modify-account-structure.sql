DROP FUNCTION IF EXISTS powerapps.sp_account_address_link(TEXT, text);
GO 

DROP FUNCTION IF EXISTS powerapps.sp_contact_address_link(TEXT, TEXT, text);
GO 

DROP FUNCTION IF EXISTS powerapps.sp_sagitta_account_address_upsert(int);
GO 

DROP FUNCTION IF EXISTS powerapps.sp_sagitta_contact_address_delete(int);
GO 

DROP FUNCTION IF EXISTS powerapps.sp_sagitta_contact_address_upsert(int);
GO 

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
		,address_type
		,street_1
		,street_2
		,city
		,state_province
		,zip_post_code
		,country_region
		,modify_dt
		,is_dirty
	) 
	SELECT 	 address_source
			,source_type
			,source_key
			,address_type
			,street_1
			,street_2
			,city
			,state_province
			,zip_post_code
			,country_region
			,modify_dt
			,TRUE 
	FROM 	powerapps.stg_address 
	ON CONFLICT (address_source, source_type, source_key, address_type) DO UPDATE 
	SET 	 street_1 			= excluded.street_1
			,street_2 			= excluded.street_2
			,city 				= excluded.city
			,state_province 	= excluded.state_province
			,zip_post_code 		= excluded.zip_post_code
			,country_region 	= excluded.country_region
			,modify_dt 			= excluded.modify_dt
			,is_dirty 			= TRUE
	WHERE 	(address.street_1,address.street_2,address.city,address.state_province,address.zip_post_code,address.country_region,address.modify_dt) 
		IS DISTINCT FROM 	(excluded.street_1,excluded.street_2,excluded.city,excluded.state_province,excluded.zip_post_code,excluded.country_region,excluded.modify_dt);
	
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
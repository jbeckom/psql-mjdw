CREATE OR REPLACE FUNCTION powerapps.sp_sagitta_contact_address_upsert (client_key int)
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE 
	rc 	int;

BEGIN 
	rc := 0;
	
	INSERT INTO powerapps.address (
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
	)
	SELECT 	'SAGITTA' 									AS address_source 
			,'CONTACT' 									AS source_type 
			,concat_ws ('-', cag.sagitem, cag.lis)  	AS source_key 
			,cag."type" 								AS address_type 
			,cag.address 								AS street_1 
			,cag.address_2 								AS street_2 
			,cag.city 									AS city 
			,COALESCE (sp.state_province, cag.state)	AS state_province
			,concat_ws ('-', cag.zip, cag.zip_ext) 		AS zip_post_code
			,COALESCE (cag.country, c.country_name)		AS country_region 
			,cag.modify_dt 								AS modify_dt
	FROM 	sagitta.contacts_address_group 	AS cag 
		LEFT JOIN public.iso_state_province 	AS sp
			ON cag.state::TEXT = sp.iso_2::TEXT 
		LEFT JOIN public.iso_country 	AS c
			ON sp.country_id::int = c.id::int
	WHERE 	cag.sagitem = client_key
		AND COALESCE (cag.address, cag.address_2, cag.city, cag.state, cag.zip, cag.country) 	IS NOT NULL 
	ON CONFLICT (address_source, source_type, source_key, address_type) DO NOTHING;
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.sp_sagitta_contact_address_upsert (int) OWNER TO mj_admin;
GO

GRANT EXECUTE ON FUNCTION powerapps.sp_sagitta_contact_address_upsert TO rl_powerapps_x;
GO
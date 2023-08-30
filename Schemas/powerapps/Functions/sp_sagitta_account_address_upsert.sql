CREATE OR REPLACE FUNCTION powerapps.sp_sagitta_account_address_upsert (client_key int)
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
		,zip_post_code 
		,state_province
		,address_owner
	)	
	SELECT 	 'SAGITTA' 										AS address_source 
			,'CLIENT' 										AS source_type 
			,c.sagitem 										AS source_key 
			,'Client' 										AS address_type
			,c.addr_1 										AS street_1
			,c.addr_2 										AS street_2 
			,c.city 										AS city 
			,CASE 
				WHEN c.postal_code IS NOT NULL AND c.postal_extension_code IS NOT NULL 
					THEN concat_ws ('-', c.postal_code, c.postal_extension_code)
				ELSE c.postal_code 
			 END 											AS zip_post_code 
			,c.state_prov_cd 								AS state_province
			,COALESCE (p1.p_name, p2.p_name, p3.p_name) 	AS address_owner
	FROM 	sagitta.clients 	AS c
		LEFT JOIN LATERAL (
			SELECT 	COALESCE (sa.only_staff_name, s.staff_name) AS p_name
			FROM 	sagitta.staff 	AS s
				LEFT JOIN 	sagitta.staff_addlinfo 	AS sa
					ON s.sagitem::TEXT = sa.sagitem::TEXT 
			WHERE c.producer_1_cd = s.sagitem 
		) 	AS p1 	ON TRUE 
		LEFT JOIN LATERAL (
			SELECT 	COALESCE (sa.only_staff_name, s.staff_name) AS p_name
			FROM 	sagitta.staff 	AS s
				LEFT JOIN 	sagitta.staff_addlinfo 	AS sa
					ON s.sagitem::TEXT = sa.sagitem::TEXT 
			WHERE c.producer_2_cd = s.sagitem 
		) 	AS p2 	ON TRUE 
		LEFT JOIN LATERAL (
			SELECT 	COALESCE (sa.only_staff_name, s.staff_name) AS p_name
			FROM 	sagitta.staff 	AS s
				LEFT JOIN 	sagitta.staff_addlinfo 	AS sa
					ON s.sagitem::TEXT = sa.sagitem::TEXT 
			WHERE c.producer_3_cd = s.sagitem 
		) 	AS p3 	ON TRUE 
	WHERE 	c.sagitem = client_key
		AND COALESCE (c.addr_1 , c.addr_2, c.city, c.postal_code, c.state_prov_cd) 	IS NOT NULL
	ON CONFLICT (address_source, source_type, source_key, address_type) DO UPDATE 
	SET 	 street_1 			= excluded.street_1 
			,street_2 			= excluded.street_2 
			,city 				= excluded.city 
			,zip_post_code 		= excluded.zip_post_code 
			,state_province 	= excluded.state_province 
			,modify_dt 			= excluded.modify_dt
			,is_dirty 			= TRUE 
	WHERE (address.street_1, address.street_2, address.city, address.zip_post_code, address.state_province, address.address_owner)
		IS DISTINCT FROM (excluded.street_1, excluded.street_2, excluded.city, excluded.zip_post_code, excluded.state_province, excluded.address_owner);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.sp_sagitta_account_address_upsert (int) OWNER TO mj_admin;
GO

GRANT EXECUTE ON FUNCTION powerapps.sp_sagitta_account_address_upsert TO rl_powerapps_x;
GO
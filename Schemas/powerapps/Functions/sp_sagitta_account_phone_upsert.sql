CREATE OR REPLACE FUNCTION powerapps.sp_sagitta_account_phone_upsert (client_key int)
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE
	rc 	int;

BEGIN 
	rc := 0;

	WITH cte AS (
		SELECT 	 'SAGITTA' 	AS phone_source 
				,'CLIENT' 	AS source_type 
				,c.sagitem 	AS source_key 
				,concat_ws (' X. ', c.phone_1_number, c.phone_1_extension_number) 	AS phone
				,COALESCE (c.phone_1_type, 'Client 1')								AS phone_type
				,c.modify_dt 														AS modify_dt
		FROM 	sagitta.clients 	AS c
		WHERE 	c.sagitem = client_key 
			AND c.phone_1_number 	IS NOT NULL 			
		
		UNION 
		
		SELECT 	 'SAGITTA' 	AS phone_source 
				,'CLIENT' 	AS source_type 
				,c.sagitem 	AS source_key 
				,concat_ws (' X. ', c.phone_2_number, c.phone_2_extension_number) 	AS phone 
				,COALESCE (c.phone_2_type, 'Client 2')								AS phone_type
				,c.modify_dt 														AS modify_dt
		FROM 	sagitta.clients 	AS c
		WHERE 	c.sagitem = client_key 
			AND c.phone_2_number 	IS NOT NULL
		
		UNION
		
		SELECT 	 'SAGITTA' 	AS phone_source 
				,'CLIENT' 	AS source_type 
				,c.sagitem 	AS source_key 
				,concat_ws (' X. ', c.inspection_phone_number, c.inspection_phone_extension_number) 	AS phone 
				,COALESCE (c.inspection_phone_type, 'Inspection')										AS phone_type
				,c.modify_dt 														AS modify_dt
		FROM 	sagitta.clients 	AS c
		WHERE 	c.sagitem = client_key 
			AND c.inspection_phone_number 	IS NOT NULL
			
		UNION 	
		
		SELECT 	 'SAGITTA' 	AS phone_source 
				,'CLIENT' 	AS source_type 
				,c.sagitem 	AS source_key 
				,concat_ws (' X. ', c.accounting_phone_number, c.accounting_phone_extension_number) 	AS phone 
				,COALESCE (c.accounting_phone_type, 'Accounting')										AS phone_type
				,c.modify_dt 														AS modify_dt
		FROM 	sagitta.clients 	AS c
		WHERE 	c.sagitem = client_key 
			AND c.accounting_phone_number 	IS NOT NULL
	)
	
	INSERT INTO powerapps.phone (phone_source, source_type, source_key, phone_type, phone, phone_owner, status, modify_dt)
	SELECT 	 cte.phone_source
			,cte.source_type
			,cte.source_key
			,cte.phone_type
			,cte.phone
			,COALESCE (p1.p_name, p2.p_name, p3.p_name) 	AS phone_owner
			,CASE 
				WHEN 'DIP' IN (c.status_1_cd, c.status_2_cd, c.status_3_cd) 	THEN 'INACTIVE'
				ELSE 'ACTIVE'
			 END 											AS status
			,c.modify_dt 
	FROM 	cte 	AS cte
		INNER JOIN 	sagitta.clients 	AS c
			ON cte.source_key 	= c.sagitem
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
	ON CONFLICT (phone_source, source_type, source_key, phone_type) DO UPDATE
		SET 	 phone 			= excluded.phone 
				,phone_owner 	= excluded.phone_owner
				,status 		= excluded.status
				,modify_dt 		= excluded.modify_dt
				,is_dirty 		= TRUE
		WHERE 	(phone.phone, phone.phone_owner, phone.status)
			IS DISTINCT FROM (excluded.phone, excluded.phone_owner, excluded.status);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;

END;
$$;
GO

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.sp_sagitta_account_phone_upsert(int) OWNER TO mj_admin;
GO

GRANT EXECUTE ON FUNCTION powerapps.sp_sagitta_account_phone_upsert TO rl_powerapps_x;
GO
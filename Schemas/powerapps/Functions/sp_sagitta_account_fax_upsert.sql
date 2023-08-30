CREATE OR REPLACE FUNCTION powerapps.sp_sagitta_account_fax_upsert(client_key int)
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE 
	rc 	int;

BEGIN 
	rc := 0;

	INSERT INTO powerapps.fax (fax_source, source_type, source_key, fax_type, fax, fax_owner, status, modify_dt)
	SELECT 	 'SAGITTA' 		AS fax_source
			,'CLIENT' 		AS source_type 
			,c.sagitem 		AS source_key
			,'Client' 		AS fax_type
			,c.fax_number 	AS fax 
			,COALESCE (p1.p_name, p2.p_name, p3.p_name) 				AS fax_owner
			,CASE 
				WHEN 'DIP' IN (c.status_1_cd, c.status_2_cd, c.status_3_cd) 	THEN 'INACTIVE'
				ELSE 'ACTIVE'
			 END 														AS status 
			,c.modify_dt 	AS modify_dt
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
	WHERE 	c.fax_number 	IS NOT NULL
		AND c.sagitem 	= client_key
	ON CONFLICT (fax_source, source_type, source_key, fax_type) DO UPDATE 
		SET 	 fax 		= excluded.fax 
				,fax_owner 	= excluded.fax_owner
				,status 	= excluded.status
				,modify_dt 	= excluded.modify_dt
				,is_dirty 	= TRUE 
		WHERE 	(fax.fax, fax.fax_owner, fax.status)
			IS DISTINCT FROM (excluded.fax, excluded.fax_owner, excluded.status);

	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.sp_sagitta_account_fax_upsert(int) OWNER TO mj_admin;
GO

GRANT EXECUTE ON FUNCTION powerapps.sp_sagitta_account_fax_upsert TO rl_powerapps_x;
GO
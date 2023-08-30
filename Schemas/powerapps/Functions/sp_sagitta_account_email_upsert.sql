CREATE OR REPLACE FUNCTION powerapps.sp_sagitta_account_email_upsert (client_key int)
RETURNS int
LANGUAGE plpgsql 
AS $$

DECLARE
	rc 	int;

BEGIN 
	rc := 0;

	WITH cte AS (
		SELECT 	 'SAGITTA' 										AS email_source
				,'CLIENT' 										AS source_type
				,c.sagitem 										AS source_key
				,'Inspection' 									AS email_type 
				,inspection_email_address  						AS email 
				,c.modify_dt 									AS modify_dt
		FROM 	sagitta.clients AS c
		WHERE 	c.sagitem = client_key
			AND inspection_email_address IS NOT NULL
		
		UNION 
		
		SELECT 	 'SAGITTA' 										AS email_source
				,'CLIENT' 										AS source_type
				,c.sagitem 										AS source_key
				,'Accounting' 									AS email_type 
				,accounting_email_address  						AS email 
				,c.modify_dt 									AS modify_dt
		FROM 	sagitta.clients AS c
		WHERE 	c.sagitem = client_key
			AND accounting_email_address IS NOT NULL
		
		UNION 
		
		SELECT 	 'SAGITTA' 										AS email_source
				,'CLIENT' 										AS source_type
				,c.sagitem 										AS source_key
				,'Client' 										AS email_type 
				,email_addr  									AS email 
				,c.modify_dt 									AS modify_dt
		FROM 	sagitta.clients AS c
		WHERE 	c.sagitem = client_key
			AND email_addr IS NOT NULL
	)
	INSERT INTO powerapps.email (
		 email_source
		,source_type 
		,source_key 
		,email_type 
		,email 
		,email_owner 
		,status
		,modify_dt 
	)
	SELECT 	 cte.email_source 
			,cte.source_type 
			,cte.source_key 
			,cte.email_type
			,cte.email 										AS email_type 
			,COALESCE (p1.p_name, p2.p_name, p3.p_name) 	AS email_owner
			,CASE 
				WHEN 'DIP' IN (c.status_1_cd, c.status_2_cd, c.status_3_cd) 	THEN 'INACTIVE'
				ELSE 'ACTIVE'
			 END 											AS status
			,c.modify_dt 
	FROM 	cte 	AS cte
		INNER JOIN 	sagitta.clients 	AS c
			ON cte.source_key = c.sagitem
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
	ON CONFLICT (email_source, source_type, source_key, email_type) DO UPDATE 
		SET 	 email 			= excluded.email
				,email_owner 	= excluded.email_owner
				,status 		= excluded.status
				,modify_dt 		= excluded.modify_dt
				,is_dirty 		= TRUE 
		WHERE 	(email.email, email.email_owner, email.status)
			IS DISTINCT FROM (excluded.email, excluded.email_owner, excluded.status);
		
	GET DIAGNOSTICS rc = ROW_COUNT;

	RETURN rc;
END;
$$;
GO

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.sp_sagitta_account_email_upsert(int) OWNER TO mj_admin;
GO

GRANT EXECUTE ON FUNCTION powerapps.sp_sagitta_account_email_upsert TO rl_powerapps_x;
GO
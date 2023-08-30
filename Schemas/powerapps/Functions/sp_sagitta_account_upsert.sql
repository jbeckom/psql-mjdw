--DROP FUNCTION IF EXISTS powerapps.sp_sagitta_account_upsert(int);

CREATE OR REPLACE FUNCTION powerapps.sp_sagitta_account_upsert (client_key int)
RETURNS int
LANGUAGE plpgsql 
AS $$

DECLARE 
	rc 	int;

BEGIN 
	rc := 0;

	INSERT INTO powerapps.account (
		 account_source 
		,source_key 
		,account_name 
		,client_code 
		,pc_client_category 
		,industry 
		,pc_primary_sic 
		,pc_second_sic 
		,pc_tertiary_sic 
		,pc_client_profile 
		,ein 
		,client_rev_25k 
		,web_url 
		,parent_account 
		,account_owner 
		,status_code 
		,modify_dt 
		,is_dirty 
	)
	SELECT 	 'SAGITTA' 			AS account_source
			,c.sagitem 			AS source_key 
			,c.client_name 		AS account_name 
			,c.client_cd 		AS client_code 
			,c.cat_1_cd 		AS pc_client_category 
			,c.business_nature 	AS industry 
			,sc1.description 	AS pc_primary_sic 
			,sc2.description 	AS pc_second_sic 
			,sc3.description  	AS pc_tertiary_sic
			,TRUE 				AS pc_client_profile 
			,c.fein 			AS ein
			,CASE 
				WHEN addl.budgeted_revenue::money > 25000::money 	THEN TRUE 
				ELSE FALSE 
			 END 														AS client_rev_25k
			,NULLIF(trim(REPLACE(c.web_site_link,'http://','')),'') 	AS web_url
			,parent.client_name 										AS parent_account 
			,COALESCE (p1.p_name, p2.p_name, p3.p_name) 				AS account_owner
			,CASE 
				WHEN 'DIP' IN (c.status_1_cd, c.status_2_cd, c.status_3_cd) 	THEN 'INACTIVE'
				ELSE 'ACTIVE'
			 END 														AS status_code 
			,c.modify_dt 													AS modify_dt 
			,TRUE 														AS is_dirty
	FROM 	sagitta.clients 	AS c
		LEFT JOIN 	sagitta.sic_codes 	AS sc1
			ON c.sic_1_cd 	= sc1.sagitem
		LEFT JOIN 	sagitta.sic_codes 	AS sc2
			ON c.sic_2_cd 	= sc2.sagitem
		LEFT JOIN 	sagitta.sic_codes 	AS sc3
			ON c.sic_3_cd  	= sc3.sagitem 
		LEFT JOIN 	sagitta.clients_addlinfo 	AS addl 
			ON c.sagitem 	= addl.sagitem 
		LEFT JOIN 	sagitta.clients 	AS parent
			ON c.parent_client = parent.sagitem 
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
	ON CONFLICT (account_source, source_key) 	DO UPDATE 
	SET 	 account_name 			= excluded.account_name 
			,client_code 			= excluded.client_code 
			,pc_client_category 	= excluded.pc_client_category 
			,industry 				= excluded.industry 
			,pc_primary_sic 		= excluded.pc_primary_sic 
			,pc_second_sic 			= excluded.pc_second_sic 
			,pc_tertiary_sic 		= excluded.pc_tertiary_sic 
			,pc_client_profile 		= excluded.pc_client_profile 
			,ein 					= excluded.ein 
			,client_rev_25k 		= excluded.client_rev_25k 
			,web_url 				= excluded.web_url 
			,parent_account 		= excluded.parent_account 
			,account_owner 			= excluded.account_owner 
			,status_reason 			= excluded.status_reason 
			,is_dirty				= excluded.is_dirty
			,modify_dt 				= excluded.modify_dt
	WHERE 	(account.account_source,account.source_key,account.account_name,account.client_code,account.pc_client_category,account.industry,account.pc_primary_sic,account.pc_second_sic,account.pc_tertiary_sic,account.pc_client_profile,account.ein,account.client_rev_25k,account.web_url,account.parent_account,account.account_owner,account.status_reason)
		IS DISTINCT FROM (excluded.account_source,excluded.source_key,excluded.account_name,excluded.client_code,excluded.pc_client_category,excluded.industry,excluded.pc_primary_sic,excluded.pc_second_sic,excluded.pc_tertiary_sic,excluded.pc_client_profile,excluded.ein,excluded.client_rev_25k,excluded.web_url,excluded.parent_account,excluded.account_owner,excluded.status_reason);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.sp_sagitta_account_upsert (int) OWNER TO mj_admin;
GO

GRANT EXECUTE ON FUNCTION powerapps.sp_sagitta_account_upsert TO rl_powerapps_x;
GO
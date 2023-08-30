CREATE OR REPLACE FUNCTION powerapps.sp_sagitta_contact_fax_upsert (client_key int)
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE
	rc 	int;

BEGIN 
	rc := 0;

	INSERT INTO powerapps.fax (fax_source, source_type, source_key, fax_type, fax)
	SELECT 	 'SAGITTA' 								AS fax_source
			,'CONTACT' 								AS source_type
			,concat_ws ('-', cpg.sagitem, cpg.lis) 	AS source_key
			,cpg."type" 							AS fax_type
			,cpg.fax 								AS fax
	FROM 	sagitta.contacts_phone_group cpg 
	WHERE 	cpg.sagitem = client_key
		AND cpg.fax 	IS NOT NULL 
	ON CONFLICT (fax_source, source_type, source_key, fax_type) DO NOTHING;

	GET DIAGNOSTICS rc = row_count;
	
	RETURN rc;
END;
$$;
GO

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.sp_sagitta_contact_fax_upsert (int) OWNER TO mj_admin;
GO

GRANT EXECUTE ON FUNCTION powerapps.sp_sagitta_contact_fax_upsert TO rl_powerapps_x;
GO
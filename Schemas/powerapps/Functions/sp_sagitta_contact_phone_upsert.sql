CREATE OR REPLACE FUNCTION powerapps.sp_sagitta_contact_phone_upsert (client_key int)
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE 
	rc 	int;

BEGIN 
	rc := 0;

	INSERT INTO powerapps.phone(phone_source, source_type, source_key, phone_type, phone)
	SELECT 	 'SAGITTA' 	AS phone_source
			,'CONTACT' 	AS source_type
			,concat_ws ('-', cpg.sagitem, cpg.lis) 					AS source_key
			,cpg."type" 											AS phone_type
			,concat_ws (' X. ',cpg.phone_number, cpg."extension") 	AS phone
	FROM 	sagitta.contacts_phone_group 	AS cpg 
	WHERE 	cpg.sagitem = client_key
		AND cpg.phone_number 	IS NOT NULL 
	
	UNION 
	
	SELECT 	 'SAGITTA' 	AS phone_source 
			,'CONTACT' 	AS source_type 
			,concat_ws ('-', cpg.sagitem, cpg.lis) 	AS source_key
			,concat_ws ('-', cpg."type", 'Mobile') 	AS phone_type
			,cpg.mobile_number 						AS phone
	FROM 	sagitta.contacts_phone_group 	AS cpg
	WHERE 	cpg.sagitem = client_key
		AND cpg.mobile_number 	IS NOT NULL 
	ON CONFLICT (phone_source, source_type, source_key, phone_type) DO NOTHING;

	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.sp_sagitta_contact_phone_upsert (int) OWNER TO mj_admin;
GO

GRANT EXECUTE ON FUNCTION powerapps.sp_sagitta_contact_phone_upsert TO rl_powerapps_x;
GO
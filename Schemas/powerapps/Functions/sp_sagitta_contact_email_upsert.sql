CREATE OR REPLACE FUNCTION powerapps.sp_sagitta_contact_email_upsert(client_key int)
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE 
	rc 	int;

BEGIN 
	rc := 0;

	INSERT INTO powerapps.email (
		 email_source
		,source_type 
		,source_key 
		,email_type 
		,email
	)
	SELECT 	 'SAGITTA' 								AS email_source 
			,'CONTACT' 								AS source_type 
			,concat_ws ('-', ceg.sagitem, ceg.lis) 	AS source_key
			,ceg."type"								AS email_type
			,ceg.email_address 						AS email
	FROM 	sagitta.contacts_email_group 	AS ceg
	WHERE 	ceg.sagitem 	= client_key
		AND ceg.email_address 	IS NOT NULL
	ON CONFLICT (email_source, source_type, source_key, email_type) DO NOTHING;

	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.sp_sagitta_contact_email_upsert (int) OWNER TO mj_admin;
GO

GRANT EXECUTE ON FUNCTION powerapps.sp_sagitta_contact_email_upsert TO rl_powerapps_x;
GO
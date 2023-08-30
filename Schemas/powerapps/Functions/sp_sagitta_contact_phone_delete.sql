CREATE OR REPLACE FUNCTION powerapps.sp_sagitta_contact_phone_delete (contact_key int)
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE 
	rc 	int;
	
BEGIN 
	rc := 0;

	DELETE FROM powerapps.phone 	AS p
	WHERE 	p.phone_source 	= 'SAGITTA'
		AND p.source_type 	= 'CONTACT'
		AND split_part (p.source_key, '-', 1)::int = contact_key;
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.sp_sagitta_contact_phone_delete (int) OWNER TO mj_admin;
GO

GRANT EXECUTE ON FUNCTION powerapps.sp_sagitta_contact_phone_delete TO rl_powerapps_x;
GO

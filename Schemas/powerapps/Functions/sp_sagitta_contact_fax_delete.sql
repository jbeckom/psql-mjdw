CREATE OR REPLACE FUNCTION powerapps.sp_sagitta_contact_fax_delete (contact_key int)
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE 
	rc 	int;
	
BEGIN 
	rc := 0;

	DELETE FROM powerapps.fax 	AS f
	WHERE 	f.fax_source 	= 'SAGITTA'
		AND f.source_type 	= 'CONTACT'
		AND split_part (f.source_key, '-', 1)::int = contact_key;
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.sp_sagitta_contact_fax_delete (int) OWNER TO mj_admin;
GO

GRANT EXECUTE ON FUNCTION powerapps.sp_sagitta_contact_fax_delete TO rl_powerapps_x;
GO

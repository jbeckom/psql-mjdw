CREATE OR REPLACE FUNCTION powerapps.sp_sagitta_contact_address_delete (contact_key int)
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE rc 	int;

BEGIN 
	rc := 0;

	DELETE FROM powerapps.address 	AS a
	WHERE 	a.address_source 	= 'SAGITTA'
		AND a.source_type 		= 'CONTACT'
		AND split_part(a.source_key,'-',1)::int = contact_key;
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.sp_sagitta_contact_address_delete (int) OWNER TO mj_admin;
GO

GRANT EXECUTE ON FUNCTION powerapps.sp_sagitta_contact_address_delete TO rl_powerapps_x;
GO
CREATE OR REPLACE FUNCTION powerapps.sp_contact_fax_upsert()
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE rc int;

BEGIN 
	INSERT INTO powerapps.contact_fax (
		 contact_guid
		,fax_guid
		,fax_type
		,modify_dt
	)
	SELECT 	 contact_guid::uuid
			,fax_guid::uuid
			,fax_type
			,modify_dt
	FROM 	powerapps.stg_contact_fax
	ON CONFLICT (contact_guid, fax_guid, fax_type) DO UPDATE 
	SET 	modify_dt 	= excluded.modify_dt 
	WHERE 	(contact_fax.modify_dt)
		IS DISTINCT FROM 	(excluded.modify_dt);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;	
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.sp_contact_fax_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION powerapps.sp_contact_fax_upsert() TO rl_powerapps_x;
GO 

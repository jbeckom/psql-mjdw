CREATE OR REPLACE FUNCTION powerapps.sp_contact_tag_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$ 

DECLARE rc int;

BEGIN 
	INSERT INTO powerapps.contact_tag (
		 contact_guid 
		,tag_guid 
		,modify_dt 
	)
	SELECT 	 contact_guid::uuid 
			,tag_guid::uuid 
			,modify_dt 
	FROM 	powerapps.stg_contact_tag 
	ON CONFLICT (contact_guid, tag_guid) DO UPDATE 
	SET 	modify_dt 	= excluded.modify_dt 
	WHERE 	(contact_tag.modify_dt)
		IS DISTINCT FROM 	(excluded.modify_dt); 
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.sp_contact_tag_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION powerapps.sp_contact_tag_upsert() TO rl_powerapps_x;
GO 

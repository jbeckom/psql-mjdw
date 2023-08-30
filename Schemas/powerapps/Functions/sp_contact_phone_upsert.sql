DROP FUNCTION IF EXISTS powerapps.sp_contact_phone_link(TEXT, TEXT, text);
GO 

CREATE OR REPLACE FUNCTION powerapps.sp_contact_phone_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$ 

DECLARE rc int;

BEGIN 
	INSERT INTO powerapps.contact_phone (
		 contact_guid
		,phone_guid
		,phone_type
		,modify_dt
	)
	SELECT 	 contact_guid::uuid
			,phone_guid::uuid
			,phone_type
			,modify_dt
	FROM 	powerapps.stg_contact_phone 
	ON CONFLICT (contact_guid, phone_guid, phone_type) DO UPDATE 
	SET 	modify_dt 	= excluded.modify_dt 
	WHERE 	(contact_phone.modify_dt) 
		IS DISTINCT FROM 	(excluded.modify_dt);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.sp_contact_phone_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION powerapps.sp_contact_phone_upsert() TO rl_powerapps_x;
GO 

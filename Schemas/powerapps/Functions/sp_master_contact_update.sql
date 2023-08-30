CREATE OR REPLACE FUNCTION powerapps.sp_master_contact_update() 
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE rc int;

BEGIN
	UPDATE 	powerapps.contact AS c
	SET 	master_contact = stg.master_contact::text
	FROM 	powerapps.stg_master_contacts AS stg
	WHERE 	c.contact_source = stg.contact_source 
		AND c.source_key  = stg.source_key::text 
		AND (c.master_contact IS NULL OR c.master_contact != stg.master_contact::text);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

ALTER FUNCTION powerapps.sp_master_contact_update() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION powerapps.sp_master_contact_update()	TO rl_powerapps_x;
GO 

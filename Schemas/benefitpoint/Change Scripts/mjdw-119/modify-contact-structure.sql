DROP FUNCTION IF EXISTS benefitpoint.sp_contact_upsert(TEXT, int, int, text);
GO 

CREATE OR REPLACE FUNCTION benefitpoint.sp_contact_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$ 

DECLARE rc int;

BEGIN 
	INSERT INTO benefitpoint.contact (
		 contact_source
		,source_key
		,contact_id
		,first_name
		,last_name
		,email
	)
	SELECT 	 contact_source
			,source_key
			,contact_id
			,first_name
			,last_name
			,email
	FROM 	benefitpoint.stg_contact 
	ON CONFLICT (contact_source, source_key, contact_id) DO UPDATE 
	SET 	 first_name 	= excluded.first_name
			,last_name 		= excluded.last_name
			,email 			= excluded.email
	WHERE 	(contact.first_name,contact.last_name,contact.email) 
		IS DISTINCT FROM 	(excluded.first_name,excluded.last_name,excluded.email);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.sp_contact_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.sp_contact_upsert() TO rl_benefitpoint_x;
GO 

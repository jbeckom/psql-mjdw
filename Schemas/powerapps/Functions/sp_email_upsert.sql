CREATE OR REPLACE FUNCTION powerapps.sp_email_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$ 

DECLARE rc int;

BEGIN 
	INSERT INTO powerapps.email (
		 email_source
		,source_type
		,source_key
		,source_email_type 
		,email_type
		,email
		,modify_dt
	)
	SELECT 	 email_source
			,source_type
			,source_key 
			,source_email_type 
			,email_type
			,email
			,modify_dt
	FROM 	powerapps.stg_email 
	ON CONFLICT (email_source,source_type,source_key,source_email_type) DO UPDATE 
	SET 	 email_type 	= excluded.email_type 
			,email 			= excluded.email  
			,modify_dt 		= excluded.modify_dt 
	WHERE 	(email.email_type,email.email,email.modify_dt) 
		IS DISTINCT FROM 	(excluded.email_type,excluded.email,excluded.modify_dt);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/ 
ALTER FUNCTION powerapps.sp_email_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION powerapps.sp_email_upsert() TO rl_powerapps_x;
GO 
 
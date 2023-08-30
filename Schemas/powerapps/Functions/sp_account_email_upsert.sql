CREATE OR REPLACE FUNCTION powerapps.sp_account_email_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE rc int;

BEGIN 
	INSERT INTO powerapps.account_email (
		 account_guid
		,email_guid
		,email_type
		,status
		,modify_dt
		,is_dirty
	)
	SELECT 	 account_guid::uuid
			,email_guid::uuid
			,email_type
			,status
			,modify_dt
			,TRUE
	FROM 	powerapps.stg_account_email 
	ON CONFLICT (account_guid,email_guid,email_type) DO UPDATE 
	SET 	 status 	= excluded.status 
			,modify_dt 	= excluded.modify_dt 
			,is_dirty 	= TRUE 
	WHERE 	(account_email.status,account_email.modify_dt) 
		IS DISTINCT FROM 	(excluded.status,excluded.modify_dt);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.sp_account_email_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION powerapps.sp_account_email_upsert() TO rl_powerapps_x;
GO 

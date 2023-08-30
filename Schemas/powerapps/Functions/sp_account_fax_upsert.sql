CREATE OR REPLACE FUNCTION powerapps.sp_account_fax_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$ 

DECLARE rc int; 

BEGIN 
	INSERT INTO powerapps.account_fax (
		 account_guid 
		,fax_guid 
		,fax_type 
		,modify_dt
	)
	SELECT 	 account_guid::uuid 
			,fax_guid::uuid 
			,fax_type 
			,modify_dt
	FROM 	powerapps.stg_account_fax 
	ON CONFLICT (account_guid, fax_guid, fax_type) DO UPDATE 
	SET 	 modify_dt 	= excluded.modify_dt 
	WHERE 	(account_fax.status, account_fax.modify_dt) 
		IS DISTINCT FROM 	(excluded.status, excluded.modify_dt);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.sp_account_fax_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION powerapps.sp_account_fax_upsert() TO rl_powerapps_x;
GO 

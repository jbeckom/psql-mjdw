CREATE OR REPLACE FUNCTION powerapps.sp_account_address_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$ 

DECLARE rc int;

BEGIN 
	INSERT INTO powerapps.account_address (
		 account_guid
		,address_guid
		,address_type
		,modify_dt
	)
	SELECT 	 account_guid::uuid
			,address_guid::uuid
			,address_type
			,modify_dt
	FROM 	powerapps.stg_account_address 
	ON CONFLICT (account_guid, address_guid, address_type) DO UPDATE
	SET 	 modify_dt 	= excluded.modify_dt 
	WHERE 	(account_address.modify_dt)
		IS DISTINCT FROM 	(excluded.modify_dt);

	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.sp_account_address_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION powerapps.sp_account_address_upsert() TO rl_powerapps_x;
GO 

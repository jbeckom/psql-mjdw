DROP FUNCTION IF EXISTS powerapps.sp_account_phone_link(TEXT,TEXT);
GO 

DROP FUNCTION IF EXISTS powerapps.sp_sagitta_account_phone_upsert(int);
GO 

ALTER TABLE powerapps.phone 
	 DROP CONSTRAINT IF EXISTS phone_source_type_key_uid
	,ADD CONSTRAINT phone_source_type_key_uid UNIQUE (phone_source, source_type, source_key, phone_type, phone);
GO 

CREATE OR REPLACE FUNCTION powerapps.sp_phone_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$ 

DECLARE rc int;

BEGIN 
	INSERT INTO powerapps.phone (
		 phone_source
		,source_type
		,source_key
		,phone_type
		,phone
		,modify_dt
	)
	SELECT 	 phone_source
			,source_type
			,source_key
			,phone_type
			,phone
			,modify_dt
	FROM 	powerapps.stg_phone sp 
	ON CONFLICT (phone_source, source_type, source_key, phone_type, phone) DO UPDATE 
	SET 	 modify_dt 	= excluded.modify_dt 
	WHERE 	(phone.modify_dt) 
		IS DISTINCT FROM 	(excluded.modify_dt);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.sp_phone_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION powerapps.sp_phone_upsert() TO rl_powerapps_x;
GO 

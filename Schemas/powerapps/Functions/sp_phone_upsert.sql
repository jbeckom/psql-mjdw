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
		,source_phone_type 
		,phone_type
		,phone
		,modify_dt
	)
	SELECT 	 phone_source
			,source_type
			,source_key 
			,source_phone_type 
			,phone_type
			,phone
			,modify_dt
	FROM 	powerapps.stg_phone 
	ON CONFLICT (phone_source, source_type, source_key, source_phone_type, phone) DO UPDATE 
	SET 	 phone_type 	= excluded.phone_type
			,modify_dt 		= excluded.modify_dt 
	WHERE 	(phone.phone_type,phone.modify_dt) 
		IS DISTINCT FROM 	(excluded.phone_type,excluded.modify_dt);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 
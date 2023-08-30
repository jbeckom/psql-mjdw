CREATE OR REPLACE FUNCTION powerapps.sp_fax_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$ 

DECLARE rc int;

BEGIN 
	INSERT INTO powerapps.fax (
		 fax_source
		,source_type
		,source_key
		,source_fax_type 
		,fax_type
		,fax
		,modify_dt
	)
	SELECT 	 fax_source
			,source_type
			,source_key 
			,source_fax_type 
			,fax_type
			,fax
			,modify_dt
	FROM 	powerapps.stg_fax 
	ON CONFLICT (fax_source,source_type,source_key,source_fax_type) DO UPDATE 
	SET 	 fax_type 	= excluded.fax_type 
			,fax 		= excluded.fax 
			,modify_dt 	= excluded.modify_dt 
	WHERE 	(fax.fax_type, fax.fax, fax.status, fax.modify_dt) 
		IS DISTINCT FROM 	(excluded.fax_type, excluded.fax, excluded.status, excluded.modify_dt);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.sp_fax_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION powerapps.sp_fax_upsert() TO rl_powerapps_x;
GO 


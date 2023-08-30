DROP FUNCTION IF EXISTS powerapps.sp_account_fax_link(TEXT, TEXT);
GO 

DROP FUNCTION IF EXISTS powerapps.sp_sagitta_account_fax_upsert(int);
GO 

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
		,fax_type
		,fax
		,modify_dt
	)
	SELECT 	 fax_source
			,source_type
			,source_key
			,fax_type
			,fax
			,modify_dt
	FROM 	powerapps.stg_fax 
	ON CONFLICT (fax_source,source_type,source_key,fax_type) DO UPDATE 
	SET 	 fax 		= excluded.fax 
			,modify_dt 	= excluded.modify_dt 
	WHERE 	(fax.fax, fax.status, fax.modify_dt) 
		IS DISTINCT FROM 	(excluded.fax, excluded.status, excluded.modify_dt);
	
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


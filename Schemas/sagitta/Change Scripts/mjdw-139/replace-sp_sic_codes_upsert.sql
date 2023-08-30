ALTER TABLE sagitta.sic_codes 
	 DROP COLUMN IF EXISTS modify_dt
	,ALTER COLUMN sagitem SET DATA TYPE TEXT USING sagitem::TEXT;
GO 

ALTER TABLE sagitta.audit_sic_codes 
	 DROP COLUMN IF EXISTS old_modify_dt
	,DROP COLUMN IF EXISTS new_modify_dt 
	,ALTER COLUMN sagitem SET DATA TYPE TEXT USING sagitem::TEXT;
GO 

DROP FUNCTION IF EXISTS sagitta.sp_sic_codes_upsert(int, text);
GO 

CREATE OR REPLACE FUNCTION sagitta.sp_sic_codes_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE rc int;

BEGIN 
	INSERT INTO sagitta.sic_codes (
		 sagitem
		,uc
		,description
		,category
	)
	SELECT 	 sagitem
			,uc
			,description
			,category
	FROM 	sagitta.stg_sic_codes
	ON CONFLICT (sagitem) DO UPDATE 
	SET 	 uc 			= excluded.uc
			,description 	= excluded.description
			,category 		= excluded.category
	WHERE 	(sic_codes.uc,sic_codes.description,sic_codes.category) 
		IS DISTINCT FROM 	(excluded.uc,excluded.description,excluded.category);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_sic_codes_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_sic_codes_upsert() TO rl_sagitta_x;
GO 

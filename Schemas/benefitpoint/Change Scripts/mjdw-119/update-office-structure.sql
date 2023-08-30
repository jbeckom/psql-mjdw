DROP FUNCTION IF EXISTS benefitpoint.sp_office_upsert(TEXT,int,int,TEXT);
GO 

CREATE OR REPLACE FUNCTION benefitpoint.sp_office_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE rc int;

BEGIN 
	INSERT INTO benefitpoint.office (
		 office_source 
		,source_key 
		,office_id 
		,office_name 
		,region_name 
	)
	SELECT 	office_source 
			,source_key 
			,office_id 
			,office_name 
			,region_name 
	FROM 	benefitpoint.stg_office 
	ON CONFLICT (office_source,source_key,office_id) DO UPDATE 
	SET 	 office_name 	= excluded.office_name 
			,region_name 	= excluded.region_name 
	WHERE 	(office.office_name, office.region_name) 
		IS DISTINCT FROM 	(excluded.office_name, excluded.region_name);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.sp_office_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.sp_office_upsert() TO rl_benefitpoint_x;
GO 

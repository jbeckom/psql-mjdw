CREATE OR REPLACE FUNCTION sagitta.sp_br_coverages_completed_value_location_limit_info_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$ 

DECLARE rc int;

BEGIN 
	INSERT INTO sagitta.br_coverages_completed_value_location_limit_info (
		 sagitem 
		,lis 
		,completed_value_location_number 
		,completed_value_sub_location_number 
		,completed_value_site_limit 
	)
	SELECT 	 sagitem 
			,lis 
			,completed_value_location_number 
			,completed_value_sub_location_number 
			,completed_value_site_limit 
	FROM 	sagitta.stg_br_coverages_completed_value_location_limit_info
	ON CONFLICT (sagitem, lis) DO UPDATE 
	SET 	 sagitem 								= excluded.sagitem 
			,lis 									= excluded.lis 
			,completed_value_location_number 		= excluded.completed_value_location_number 
			,completed_value_sub_location_number 	= excluded.completed_value_sub_location_number 
			,completed_value_site_limit 			= excluded.completed_value_site_limit 
	WHERE 	(br_coverages_completed_value_location_limit_info.sagitem,br_coverages_completed_value_location_limit_info.lis,br_coverages_completed_value_location_limit_info.completed_value_location_number,br_coverages_completed_value_location_limit_info.completed_value_sub_location_number,br_coverages_completed_value_location_limit_info.completed_value_site_limit) 
		IS DISTINCT FROM 	(excluded.sagitem,excluded.lis,excluded.completed_value_location_number,excluded.completed_value_sub_location_number,excluded.completed_value_site_limit); 
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_br_coverages_completed_value_location_limit_info_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_br_coverages_completed_value_location_limit_info_upsert() TO rl_sagitta_x;
GO 

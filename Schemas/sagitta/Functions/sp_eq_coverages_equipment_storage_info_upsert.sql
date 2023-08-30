CREATE OR REPLACE FUNCTION sagitta.sp_eq_coverages_equipment_storage_info_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$ 

DECLARE rc int;

BEGIN 
	INSERT INTO sagitta.eq_coverages_equipment_storage_info(
		 sagitem 
		,lis 
		,location_agency_id 
		,num_months_in_storage 
		,max_value_in_building 
		,max_value_out_building 
		,equip_storage_security 
	) 
	SELECT 	 sagitem 
			,lis 
			,location_agency_id 
			,num_months_in_storage 
			,max_value_in_building 
			,max_value_out_building 
			,equip_storage_security 
	FROM 	sagitta.stg_eq_coverages_equipment_storage_info 
	ON CONFLICT (sagitem,lis) DO UPDATE 
	SET 	 location_agency_id 				= excluded.location_agency_id 
			,num_months_in_storage 				= excluded.num_months_in_storage 
			,max_value_in_building 				= excluded.max_value_in_building 
			,max_value_out_building 			= excluded.max_value_out_building 
			,equip_storage_security 			= excluded.equip_storage_security 
	WHERE 	(eq_coverages_equipment_storage_info.location_agency_id,eq_coverages_equipment_storage_info.num_months_in_storage,eq_coverages_equipment_storage_info.max_value_in_building,eq_coverages_equipment_storage_info.max_value_out_building,eq_coverages_equipment_storage_info.equip_storage_security) 
		IS DISTINCT FROM 	(excluded.location_agency_id,excluded.num_months_in_storage,excluded.max_value_in_building,excluded.max_value_out_building,excluded.equip_storage_security); 
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_eq_coverages_equipment_storage_info_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_eq_coverages_equipment_storage_info_upsert() TO rl_sagitta_x;
GO 

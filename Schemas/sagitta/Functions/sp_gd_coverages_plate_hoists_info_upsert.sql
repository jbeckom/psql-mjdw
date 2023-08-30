CREATE OR REPLACE FUNCTION sagitta.sp_gd_coverages_plate_hoists_info_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$ 

DECLARE rc int;

BEGIN 
	INSERT INTO sagitta.gd_coverages_plate_hoists_info (
		 sagitem 
		,lis 
		,plates_hoists_location_number 
		,num_dealer_plates 
		,num_repairer_plates 
		,num_transportation_plates 
		,num_hoists 
	)
	SELECT 	 sagitem 
			,lis 
			,plates_hoists_location_number 
			,num_dealer_plates 
			,num_repairer_plates 
			,num_transportation_plates 
			,num_hoists 
	FROM 	sagitta.stg_gd_coverages_plate_hoists_info 
	ON CONFLICT (sagitem,lis) DO UPDATE 
	SET 	 plates_hoists_location_number 	= excluded.plates_hoists_location_number 
			,num_dealer_plates 				= excluded.num_dealer_plates 
			,num_repairer_plates 			= excluded.num_repairer_plates 
			,num_transportation_plates 		= excluded.num_transportation_plates 
			,num_hoists 					= excluded.num_hoists 
	WHERE 	(gd_coverages_plate_hoists_info.plates_hoists_location_number,gd_coverages_plate_hoists_info.num_dealer_plates,gd_coverages_plate_hoists_info.num_repairer_plates,gd_coverages_plate_hoists_info.num_transportation_plates,gd_coverages_plate_hoists_info.num_hoists) 
		IS DISTINCT FROM 	(excluded.plates_hoists_location_number,excluded.num_dealer_plates,excluded.num_repairer_plates,excluded.num_transportation_plates,excluded.num_hoists); 
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_gd_coverages_plate_hoists_info_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_gd_coverages_plate_hoists_info_upsert() TO rl_sagitta_x;
GO 

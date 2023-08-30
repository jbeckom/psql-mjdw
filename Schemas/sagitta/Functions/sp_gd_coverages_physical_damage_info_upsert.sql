CREATE OR REPLACE FUNCTION sagitta.sp_gd_coverages_physical_damage_info_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$ 

DECLARE rc int;

BEGIN 
	INSERT INTO sagitta.gd_coverages_physical_damage_info (
		 sagitem 
		,lis 
		,physical_damage_location_number 
		,building_limit 
		,standard_open_lot_limit 
		,non_standard_open_lot_limit 
		,miscellaneous_type_desc 
		,miscellaneous_limit 
		,total_limit 
		,per_auto_deductible_amt 
		,max_per_loss_deductible_amt 
		,fire_coverage_ind 
		,fire_theft_coverage_ind 
		,fire_thef_wind_coverage_ind 
		,limited_perils_coverage_ind 
		,physical_damage_premium_amt 
		,physical_damage_scheduled_noscheduled_ind 
	)
	SELECT 	 sagitem 
			,lis 
			,physical_damage_location_number 
			,building_limit 
			,standard_open_lot_limit 
			,non_standard_open_lot_limit 
			,miscellaneous_type_desc 
			,miscellaneous_limit 
			,total_limit 
			,per_auto_deductible_amt 
			,max_per_loss_deductible_amt 
			,fire_coverage_ind 
			,fire_theft_coverage_ind 
			,fire_thef_wind_coverage_ind 
			,limited_perils_coverage_ind 
			,physical_damage_premium_amt 
			,physical_damage_scheduled_noscheduled_ind 
	FROM 	sagitta.stg_gd_coverages_physical_damage_info 
	ON CONFLICT (sagitem,lis) DO UPDATE 
	SET 	 physical_damage_location_number 			= excluded.physical_damage_location_number 
			,building_limit 							= excluded.building_limit 
			,standard_open_lot_limit 					= excluded.standard_open_lot_limit 
			,non_standard_open_lot_limit 				= excluded.non_standard_open_lot_limit 
			,miscellaneous_type_desc 					= excluded.miscellaneous_type_desc 
			,miscellaneous_limit 						= excluded.miscellaneous_limit 
			,total_limit 								= excluded.total_limit 
			,per_auto_deductible_amt 					= excluded.per_auto_deductible_amt 
			,max_per_loss_deductible_amt 				= excluded.max_per_loss_deductible_amt 
			,fire_coverage_ind 							= excluded.fire_coverage_ind 
			,fire_theft_coverage_ind 					= excluded.fire_theft_coverage_ind 
			,fire_thef_wind_coverage_ind 				= excluded.fire_thef_wind_coverage_ind 
			,limited_perils_coverage_ind 				= excluded.limited_perils_coverage_ind 
			,physical_damage_premium_amt 				= excluded.physical_damage_premium_amt 
			,physical_damage_scheduled_noscheduled_ind 	= excluded.physical_damage_scheduled_noscheduled_ind 
	WHERE 	(gd_coverages_physical_damage_info.physical_damage_location_number,gd_coverages_physical_damage_info.building_limit,gd_coverages_physical_damage_info.standard_open_lot_limit,gd_coverages_physical_damage_info.non_standard_open_lot_limit,gd_coverages_physical_damage_info.miscellaneous_type_desc,gd_coverages_physical_damage_info.miscellaneous_limit,gd_coverages_physical_damage_info.total_limit,gd_coverages_physical_damage_info.per_auto_deductible_amt,gd_coverages_physical_damage_info.max_per_loss_deductible_amt,gd_coverages_physical_damage_info.fire_coverage_ind,gd_coverages_physical_damage_info.fire_theft_coverage_ind,gd_coverages_physical_damage_info.fire_thef_wind_coverage_ind,gd_coverages_physical_damage_info.limited_perils_coverage_ind,gd_coverages_physical_damage_info.physical_damage_premium_amt,gd_coverages_physical_damage_info.physical_damage_scheduled_noscheduled_ind) 
		IS DISTINCT FROM 	(excluded.physical_damage_location_number,excluded.building_limit,excluded.standard_open_lot_limit,excluded.non_standard_open_lot_limit,excluded.miscellaneous_type_desc,excluded.miscellaneous_limit,excluded.total_limit,excluded.per_auto_deductible_amt,excluded.max_per_loss_deductible_amt,excluded.fire_coverage_ind,excluded.fire_theft_coverage_ind,excluded.fire_thef_wind_coverage_ind,excluded.limited_perils_coverage_ind,excluded.physical_damage_premium_amt,excluded.physical_damage_scheduled_noscheduled_ind); 
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_gd_coverages_physical_damage_info_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_gd_coverages_physical_damage_info_upsert() TO rl_sagitta_x;
GO 

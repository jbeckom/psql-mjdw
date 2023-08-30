CREATE OR REPLACE FUNCTION sagitta.sp_gd_coverages_garage_keepers_otc_info_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$ 

DECLARE rc int;

BEGIN 
	INSERT INTO sagitta.gd_coverages_garage_keepers_otc_info (
		 sagitem 
		,lis 
		,garagekeepers_other_than_collisions_loc_number 
		,garagekeeps_other_than_collision_limit 
		,garagekeeps_other_than_collision_deductible_amt 
		,garagekeeps_other_than_collision_max_per_loss_deductible_amt 
		,garagekeeps_other_than_collision_auto_num 
		,garagekeeps_other_than_collision_premium_amt 
		,garagekeeps_other_than_collision_fire_ind 
		,garagekeeps_other_than_collision_fire_theft_ind 
		,garagekeeps_other_than_collision_fire_theft_wind_ind 
		,garagekeeps_other_than_collision_limited_perils_ind 
	)
	SELECT 	 sagitem 
			,lis 
			,garagekeepers_other_than_collisions_loc_number 
			,garagekeeps_other_than_collision_limit 
			,garagekeeps_other_than_collision_deductible_amt 
			,garagekeeps_other_than_collision_max_per_loss_deductible_amt 
			,garagekeeps_other_than_collision_auto_num 
			,garagekeeps_other_than_collision_premium_amt 
			,garagekeeps_other_than_collision_fire_ind 
			,garagekeeps_other_than_collision_fire_theft_ind 
			,garagekeeps_other_than_collision_fire_theft_wind_ind 
			,garagekeeps_other_than_collision_limited_perils_ind 
	FROM 	sagitta.stg_gd_coverages_garage_keepers_otc_info 
	ON CONFLICT (sagitem,lis) DO UPDATE 
	SET 	 garagekeepers_other_than_collisions_loc_number                         = excluded.garagekeepers_other_than_collisions_loc_number 
			,garagekeeps_other_than_collision_limit                                 = excluded.garagekeeps_other_than_collision_limit 
			,garagekeeps_other_than_collision_deductible_amt                        = excluded.garagekeeps_other_than_collision_deductible_amt 
			,garagekeeps_other_than_collision_max_per_loss_deductible_amt           = excluded.garagekeeps_other_than_collision_max_per_loss_deductible_amt 
			,garagekeeps_other_than_collision_auto_num                              = excluded.garagekeeps_other_than_collision_auto_num 
			,garagekeeps_other_than_collision_premium_amt                           = excluded.garagekeeps_other_than_collision_premium_amt 
			,garagekeeps_other_than_collision_fire_ind                              = excluded.garagekeeps_other_than_collision_fire_ind 
			,garagekeeps_other_than_collision_fire_theft_ind                        = excluded.garagekeeps_other_than_collision_fire_theft_ind 
			,garagekeeps_other_than_collision_fire_theft_wind_ind                   = excluded.garagekeeps_other_than_collision_fire_theft_wind_ind 
			,garagekeeps_other_than_collision_limited_perils_ind                    = excluded.garagekeeps_other_than_collision_limited_perils_ind 
	WHERE 	(gd_coverages_garage_keepers_otc_info.garagekeepers_other_than_collisions_loc_number,gd_coverages_garage_keepers_otc_info.garagekeeps_other_than_collision_limit,gd_coverages_garage_keepers_otc_info.garagekeeps_other_than_collision_deductible_amt,gd_coverages_garage_keepers_otc_info.garagekeeps_other_than_collision_max_per_loss_deductible_amt,gd_coverages_garage_keepers_otc_info.garagekeeps_other_than_collision_auto_num,gd_coverages_garage_keepers_otc_info.garagekeeps_other_than_collision_premium_amt,gd_coverages_garage_keepers_otc_info.garagekeeps_other_than_collision_fire_ind,gd_coverages_garage_keepers_otc_info.garagekeeps_other_than_collision_fire_theft_ind,gd_coverages_garage_keepers_otc_info.garagekeeps_other_than_collision_fire_theft_wind_ind,gd_coverages_garage_keepers_otc_info.garagekeeps_other_than_collision_limited_perils_ind) 
		IS DISTINCT FROM 	(excluded.garagekeepers_other_than_collisions_loc_number,excluded.garagekeeps_other_than_collision_limit,excluded.garagekeeps_other_than_collision_deductible_amt,excluded.garagekeeps_other_than_collision_max_per_loss_deductible_amt,excluded.garagekeeps_other_than_collision_auto_num,excluded.garagekeeps_other_than_collision_premium_amt,excluded.garagekeeps_other_than_collision_fire_ind,excluded.garagekeeps_other_than_collision_fire_theft_ind,excluded.garagekeeps_other_than_collision_fire_theft_wind_ind,excluded.garagekeeps_other_than_collision_limited_perils_ind); 
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_gd_coverages_garage_keepers_otc_info_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_gd_coverages_garage_keepers_otc_info_upsert() TO rl_sagitta_x;
GO 

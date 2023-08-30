CREATE OR REPLACE FUNCTION sagitta.tr_audit_gd_coverages_garage_keepers_otc_info_d() 
RETURNS TRIGGER  
LANGUAGE plpgsql 
AS $$ 

BEGIN 
	INSERT INTO sagitta.audit_gd_coverages_garage_keepers_otc_info (
		 sagitem 
		,lis 
		,old_garagekeepers_other_than_collisions_loc_number 
		,old_garagekeeps_other_than_collision_limit 
		,old_garagekeeps_other_than_collision_deductible_amt 
		,old_garagekeeps_other_than_collision_max_per_loss_deductible_am 
		,old_garagekeeps_other_than_collision_auto_num 
		,old_garagekeeps_other_than_collision_premium_amt 
		,old_garagekeeps_other_than_collision_fire_ind 
		,old_garagekeeps_other_than_collision_fire_theft_ind 
		,old_garagekeeps_other_than_collision_fire_theft_wind_ind 
		,old_garagekeeps_other_than_collision_limited_perils_ind 
		,audit_action 
	)
	SELECT 	 OLD.sagitem 
			,OLD.lis 
			,OLD.garagekeepers_other_than_collisions_loc_number 
			,OLD.garagekeeps_other_than_collision_limit 
			,OLD.garagekeeps_other_than_collision_deductible_amt 
			,OLD.garagekeeps_other_than_collision_max_per_loss_deductible_amt 
			,OLD.garagekeeps_other_than_collision_auto_num 
			,OLD.garagekeeps_other_than_collision_premium_amt 
			,OLD.garagekeeps_other_than_collision_fire_ind 
			,OLD.garagekeeps_other_than_collision_fire_theft_ind 
			,OLD.garagekeeps_other_than_collision_fire_theft_wind_ind 
			,OLD.garagekeeps_other_than_collision_limited_perils_ind 
			,'D'; 
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_gd_coverages_garage_keepers_otc_info_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_gd_coverages_garage_keepers_otc_info_d() TO rl_sagitta_x;
GO 

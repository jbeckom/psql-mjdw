CREATE OR REPLACE FUNCTION sagitta.tr_audit_gd_coverages_garage_keepers_otc_info_u() 
RETURNS TRIGGER  
LANGUAGE plpgsql 
AS $$ 

BEGIN 
	INSERT INTO sagitta.audit_gd_coverages_garage_keepers_otc_info (
		 sagitem 
		,lis 
		,old_garagekeepers_other_than_collisions_loc_number 
		,new_garagekeepers_other_than_collisions_loc_number 
		,old_garagekeeps_other_than_collision_limit 
		,new_garagekeeps_other_than_collision_limit 
		,old_garagekeeps_other_than_collision_deductible_amt 
		,new_garagekeeps_other_than_collision_deductible_amt 
		,old_garagekeeps_other_than_collision_max_per_loss_deductible_am 
		,new_garagekeeps_other_than_collision_max_per_loss_deductible_am 
		,old_garagekeeps_other_than_collision_auto_num 
		,new_garagekeeps_other_than_collision_auto_num 
		,old_garagekeeps_other_than_collision_premium_amt 
		,new_garagekeeps_other_than_collision_premium_amt 
		,old_garagekeeps_other_than_collision_fire_ind 
		,new_garagekeeps_other_than_collision_fire_ind 
		,old_garagekeeps_other_than_collision_fire_theft_ind 
		,new_garagekeeps_other_than_collision_fire_theft_ind 
		,old_garagekeeps_other_than_collision_fire_theft_wind_ind 
		,new_garagekeeps_other_than_collision_fire_theft_wind_ind 
		,old_garagekeeps_other_than_collision_limited_perils_ind 
		,new_garagekeeps_other_than_collision_limited_perils_ind 
		,audit_action 
	)
	SELECT 	 OLD.sagitem 
			,OLD.lis 
			,OLD.garagekeepers_other_than_collisions_loc_number 
			,NEW.garagekeepers_other_than_collisions_loc_number 
			,OLD.garagekeeps_other_than_collision_limit 
			,NEW.garagekeeps_other_than_collision_limit 
			,OLD.garagekeeps_other_than_collision_deductible_amt 
			,NEW.garagekeeps_other_than_collision_deductible_amt 
			,OLD.garagekeeps_other_than_collision_max_per_loss_deductible_amt 
			,NEW.garagekeeps_other_than_collision_max_per_loss_deductible_amt 
			,OLD.garagekeeps_other_than_collision_auto_num 
			,NEW.garagekeeps_other_than_collision_auto_num 
			,OLD.garagekeeps_other_than_collision_premium_amt 
			,NEW.garagekeeps_other_than_collision_premium_amt 
			,OLD.garagekeeps_other_than_collision_fire_ind 
			,NEW.garagekeeps_other_than_collision_fire_ind 
			,OLD.garagekeeps_other_than_collision_fire_theft_ind 
			,NEW.garagekeeps_other_than_collision_fire_theft_ind 
			,OLD.garagekeeps_other_than_collision_fire_theft_wind_ind 
			,NEW.garagekeeps_other_than_collision_fire_theft_wind_ind 
			,OLD.garagekeeps_other_than_collision_limited_perils_ind 
			,NEW.garagekeeps_other_than_collision_limited_perils_ind 
			,'U'; 
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_gd_coverages_garage_keepers_otc_info_u() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_gd_coverages_garage_keepers_otc_info_u() TO rl_sagitta_x;
GO 

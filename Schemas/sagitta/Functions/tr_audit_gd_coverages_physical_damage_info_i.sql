CREATE OR REPLACE FUNCTION sagitta.tr_audit_gd_coverages_physical_damage_info_i() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$ 

BEGIN 
	INSERT INTO sagitta.audit_gd_coverages_physical_damage_info (
		 sagitem 
		,lis 
		,new_physical_damage_location_number 
		,new_building_limit 
		,new_standard_open_lot_limit 
		,new_non_standard_open_lot_limit 
		,new_miscellaneous_type_desc 
		,new_miscellaneous_limit 
		,new_total_limit 
		,new_per_auto_deductible_amt 
		,new_max_per_loss_deductible_amt 
		,new_fire_coverage_ind 
		,new_fire_theft_coverage_ind 
		,new_fire_thef_wind_coverage_ind 
		,new_limited_perils_coverage_ind 
		,new_physical_damage_premium_amt 
		,new_physical_damage_scheduled_noscheduled_ind 
		,audit_action 
	)
	SELECT 	 NEW.sagitem 
			,NEW.lis 
			,NEW.physical_damage_location_number 
			,NEW.building_limit 
			,NEW.standard_open_lot_limit 
			,NEW.non_standard_open_lot_limit 
			,NEW.miscellaneous_type_desc 
			,NEW.miscellaneous_limit 
			,NEW.total_limit 
			,NEW.per_auto_deductible_amt 
			,NEW.max_per_loss_deductible_amt 
			,NEW.fire_coverage_ind 
			,NEW.fire_theft_coverage_ind 
			,NEW.fire_thef_wind_coverage_ind 
			,NEW.limited_perils_coverage_ind 
			,NEW.physical_damage_premium_amt 
			,NEW.physical_damage_scheduled_noscheduled_ind 
			,'I';
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_gd_coverages_physical_damage_info_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_gd_coverages_physical_damage_info_i() TO rl_sagitta_x;
GO 

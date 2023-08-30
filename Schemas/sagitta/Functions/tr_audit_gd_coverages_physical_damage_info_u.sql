CREATE OR REPLACE FUNCTION sagitta.tr_audit_gd_coverages_physical_damage_info_u() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$ 

BEGIN 
	INSERT INTO sagitta.audit_gd_coverages_physical_damage_info (
		 sagitem 
		,lis 
		,old_physical_damage_location_number 
		,new_physical_damage_location_number 
		,old_building_limit 
		,new_building_limit 
		,old_standard_open_lot_limit 
		,new_standard_open_lot_limit 
		,old_non_standard_open_lot_limit 
		,new_non_standard_open_lot_limit 
		,old_miscellaneous_type_desc 
		,new_miscellaneous_type_desc 
		,old_miscellaneous_limit 
		,new_miscellaneous_limit 
		,old_total_limit 
		,new_total_limit 
		,old_per_auto_deductible_amt 
		,new_per_auto_deductible_amt 
		,old_max_per_loss_deductible_amt 
		,new_max_per_loss_deductible_amt 
		,old_fire_coverage_ind 
		,new_fire_coverage_ind 
		,old_fire_theft_coverage_ind 
		,new_fire_theft_coverage_ind 
		,old_fire_thef_wind_coverage_ind 
		,new_fire_thef_wind_coverage_ind 
		,old_limited_perils_coverage_ind 
		,new_limited_perils_coverage_ind 
		,old_physical_damage_premium_amt 
		,new_physical_damage_premium_amt 
		,old_physical_damage_scheduled_noscheduled_ind 
		,new_physical_damage_scheduled_noscheduled_ind 
		,audit_action 
	)
	SELECT 	 OLD.sagitem 
			,OLD.lis 
			,OLD.physical_damage_location_number 
			,NEW.physical_damage_location_number 
			,OLD.building_limit 
			,NEW.building_limit 
			,OLD.standard_open_lot_limit 
			,NEW.standard_open_lot_limit 
			,OLD.non_standard_open_lot_limit 
			,NEW.non_standard_open_lot_limit 
			,OLD.miscellaneous_type_desc 
			,NEW.miscellaneous_type_desc 
			,OLD.miscellaneous_limit 
			,NEW.miscellaneous_limit 
			,OLD.total_limit 
			,NEW.total_limit 
			,OLD.per_auto_deductible_amt 
			,NEW.per_auto_deductible_amt 
			,OLD.max_per_loss_deductible_amt 
			,NEW.max_per_loss_deductible_amt 
			,OLD.fire_coverage_ind 
			,NEW.fire_coverage_ind 
			,OLD.fire_theft_coverage_ind 
			,NEW.fire_theft_coverage_ind 
			,OLD.fire_thef_wind_coverage_ind 
			,NEW.fire_thef_wind_coverage_ind 
			,OLD.limited_perils_coverage_ind 
			,NEW.limited_perils_coverage_ind 
			,OLD.physical_damage_premium_amt 
			,NEW.physical_damage_premium_amt 
			,OLD.physical_damage_scheduled_noscheduled_ind 
			,NEW.physical_damage_scheduled_noscheduled_ind 
			,'U';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_gd_coverages_physical_damage_info_u() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_gd_coverages_physical_damage_info_u() TO rl_sagitta_x;
GO 

CREATE OR REPLACE FUNCTION sagitta.tr_audit_gd_coverages_physical_damage_info_d() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$ 

BEGIN 
	INSERT INTO sagitta.audit_gd_coverages_physical_damage_info (
		 sagitem 
		,lis 
		,old_physical_damage_location_number 
		,old_building_limit 
		,old_standard_open_lot_limit 
		,old_non_standard_open_lot_limit 
		,old_miscellaneous_type_desc 
		,old_miscellaneous_limit 
		,old_total_limit 
		,old_per_auto_deductible_amt 
		,old_max_per_loss_deductible_amt 
		,old_fire_coverage_ind 
		,old_fire_theft_coverage_ind 
		,old_fire_thef_wind_coverage_ind 
		,old_limited_perils_coverage_ind 
		,old_physical_damage_premium_amt 
		,old_physical_damage_scheduled_noscheduled_ind 
		,audit_action 
	)
	SELECT 	 OLD.sagitem 
			,OLD.lis 
			,OLD.physical_damage_location_number 
			,OLD.building_limit 
			,OLD.standard_open_lot_limit 
			,OLD.non_standard_open_lot_limit 
			,OLD.miscellaneous_type_desc 
			,OLD.miscellaneous_limit 
			,OLD.total_limit 
			,OLD.per_auto_deductible_amt 
			,OLD.max_per_loss_deductible_amt 
			,OLD.fire_coverage_ind 
			,OLD.fire_theft_coverage_ind 
			,OLD.fire_thef_wind_coverage_ind 
			,OLD.limited_perils_coverage_ind 
			,OLD.physical_damage_premium_amt 
			,OLD.physical_damage_scheduled_noscheduled_ind 
			,'D';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_gd_coverages_physical_damage_info_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_gd_coverages_physical_damage_info_d() TO rl_sagitta_x;
GO 

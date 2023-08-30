CREATE TABLE sagitta.audit_gd_coverages_physical_damage_info (
	 sagitem 												int 			NOT NULL 
	,lis 													int 			NOT NULL 
	,old_physical_damage_location_number 					TEXT 			NULL 
	,new_physical_damage_location_number 					TEXT 			NULL 
	,old_building_limit 									TEXT 			NULL 
	,new_building_limit 									TEXT 			NULL 
	,old_standard_open_lot_limit 							TEXT 			NULL 
	,new_standard_open_lot_limit 							TEXT 			NULL 
	,old_non_standard_open_lot_limit 						TEXT 			NULL 
	,new_non_standard_open_lot_limit 						TEXT 			NULL 
	,old_miscellaneous_type_desc 							TEXT 			NULL 
	,new_miscellaneous_type_desc 							TEXT 			NULL 
	,old_miscellaneous_limit 								TEXT 			NULL 
	,new_miscellaneous_limit 								TEXT 			NULL 
	,old_total_limit 										TEXT 			NULL 
	,new_total_limit 										TEXT 			NULL 
	,old_per_auto_deductible_amt 							TEXT 			NULL 
	,new_per_auto_deductible_amt 							TEXT 			NULL 
	,old_max_per_loss_deductible_amt 						TEXT 			NULL 
	,new_max_per_loss_deductible_amt 						TEXT 			NULL 
	,old_fire_coverage_ind 									TEXT 			NULL 
	,new_fire_coverage_ind 									TEXT 			NULL 
	,old_fire_theft_coverage_ind 							TEXT 			NULL 
	,new_fire_theft_coverage_ind 							TEXT 			NULL 
	,old_fire_thef_wind_coverage_ind 						TEXT 			NULL 
	,new_fire_thef_wind_coverage_ind 						TEXT 			NULL 
	,old_limited_perils_coverage_ind 						TEXT 			NULL 
	,new_limited_perils_coverage_ind 						TEXT 			NULL 
	,old_physical_damage_premium_amt 						TEXT 			NULL 
	,new_physical_damage_premium_amt 						TEXT 			NULL 
	,old_physical_damage_scheduled_noscheduled_ind 			TEXT 			NULL 
	,new_physical_damage_scheduled_noscheduled_ind 			TEXT 			NULL 
	,audit_action 											char(1) 		NOT NULL 
	,audit_user 											TEXT 			NOT NULL 			DEFAULT current_user 
	,audit_timestamp 										timestamp 		NOT NULL 			DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 												bigint 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.audit_gd_coverages_physical_damage_info OWNER TO mj_admin;
GO 

GRANT INSERT ON sagitta.audit_gd_coverages_physical_damage_info TO rl_sagitta_a;
GO
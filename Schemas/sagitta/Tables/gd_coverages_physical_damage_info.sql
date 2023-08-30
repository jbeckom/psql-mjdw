CREATE TABLE sagitta.gd_coverages_physical_damage_info (
	 sagitem 											int 			NOT NULL 
	,lis 												int 			NOT NULL 
	,physical_damage_location_number 					TEXT 			NULL 
	,building_limit 									TEXT 			NULL 
	,standard_open_lot_limit 							TEXT 			NULL 
	,non_standard_open_lot_limit 						TEXT 			NULL 
	,miscellaneous_type_desc 							TEXT 			NULL 
	,miscellaneous_limit 								TEXT 			NULL 
	,total_limit 										TEXT 			NULL 
	,per_auto_deductible_amt 							TEXT 			NULL 
	,max_per_loss_deductible_amt 						TEXT 			NULL 
	,fire_coverage_ind 									TEXT 			NULL 
	,fire_theft_coverage_ind 							TEXT 			NULL 
	,fire_thef_wind_coverage_ind 						TEXT 			NULL 
	,limited_perils_coverage_ind 						TEXT 			NULL 
	,physical_damage_premium_amt 						TEXT 			NULL 
	,physical_damage_scheduled_noscheduled_ind 			TEXT 			NULL 
	,CONSTRAINT gd_coverages_physical_damage_info_pkey 			PRIMARY KEY (sagitem,lis)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.gd_coverages_physical_damage_info OWNER TO mj_admin;
GO 

GRANT SELECT ON sagitta.gd_coverages_physical_damage_info TO rl_sagitta_r;
GO 

GRANT INSERT ON sagitta.gd_coverages_physical_damage_info TO rl_sagitta_a;
GO 

GRANT UPDATE ON sagitta.gd_coverages_physical_damage_info TO rl_sagitta_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON sagitta.gd_coverages_physical_damage_info FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_gd_coverages_physical_damage_info_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON sagitta.gd_coverages_physical_damage_info FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_gd_coverages_physical_damage_info_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON sagitta.gd_coverages_physical_damage_info FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION sagitta.tr_audit_gd_coverages_physical_damage_info_u();
GO 

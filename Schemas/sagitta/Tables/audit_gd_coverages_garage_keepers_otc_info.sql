CREATE TABLE sagitta.audit_gd_coverages_garage_keepers_otc_info (
 	 sagitem 																	int 			NOT NULL 
	,lis 																		int 			NOT NULL 
	,old_garagekeepers_other_than_collisions_loc_number                         TEXT            NULL
	,new_garagekeepers_other_than_collisions_loc_number                         TEXT            NULL
	,old_garagekeeps_other_than_collision_limit                                 TEXT            NULL
	,new_garagekeeps_other_than_collision_limit                                 TEXT            NULL
	,old_garagekeeps_other_than_collision_deductible_amt                        TEXT            NULL
	,new_garagekeeps_other_than_collision_deductible_amt                        TEXT            NULL
	,old_garagekeeps_other_than_collision_max_per_loss_deductible_amt           TEXT            NULL
	,new_garagekeeps_other_than_collision_max_per_loss_deductible_amt           TEXT            NULL
	,old_garagekeeps_other_than_collision_auto_num                              TEXT            NULL
	,new_garagekeeps_other_than_collision_auto_num                              TEXT            NULL
	,old_garagekeeps_other_than_collision_premium_amt                           TEXT            NULL
	,new_garagekeeps_other_than_collision_premium_amt                           TEXT            NULL
	,old_garagekeeps_other_than_collision_fire_ind                              TEXT            NULL
	,new_garagekeeps_other_than_collision_fire_ind                              TEXT            NULL
	,old_garagekeeps_other_than_collision_fire_theft_ind                        TEXT            NULL
	,new_garagekeeps_other_than_collision_fire_theft_ind                        TEXT            NULL
	,old_garagekeeps_other_than_collision_fire_theft_wind_ind                   TEXT            NULL
	,new_garagekeeps_other_than_collision_fire_theft_wind_ind                   TEXT            NULL
	,old_garagekeeps_other_than_collision_limited_perils_ind                    TEXT            NULL
	,new_garagekeeps_other_than_collision_limited_perils_ind                    TEXT            NULL
	,audit_action 																char(1) 		NOT NULL 
	,audit_user 																TEXT 			NOT NULL 			DEFAULT current_user 
	,audit_timestamp 															timestamp 		NOT NULL 			DEFAULT timezone('utc'::TEXT,clock_timestamp()) 
	,audit_id 																	bigint 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.audit_gd_coverages_garage_keepers_otc_info OWNER TO mj_admin;
GO 

GRANT INSERT ON sagitta.audit_gd_coverages_garage_keepers_otc_info TO rl_sagitta_a;
GO 

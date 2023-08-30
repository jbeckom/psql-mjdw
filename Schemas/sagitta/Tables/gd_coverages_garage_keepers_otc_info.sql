CREATE TABLE sagitta.gd_coverages_garage_keepers_otc_info(
	 sagitem 																int 			NOT NULL 
	,lis 																	int 			NOT NULL 
	,garagekeepers_other_than_collisions_loc_number                     	TEXT            NULL
	,garagekeeps_other_than_collision_limit                                 TEXT            NULL
	,garagekeeps_other_than_collision_deductible_amt                        TEXT            NULL
	,garagekeeps_other_than_collision_max_per_loss_deductible_amt           TEXT            NULL
	,garagekeeps_other_than_collision_auto_num                              TEXT            NULL
	,garagekeeps_other_than_collision_premium_amt                           TEXT            NULL
	,garagekeeps_other_than_collision_fire_ind                              TEXT            NULL
	,garagekeeps_other_than_collision_fire_theft_ind                        TEXT            NULL
	,garagekeeps_other_than_collision_fire_theft_wind_ind                   TEXT            NULL
	,garagekeeps_other_than_collision_limited_perils_ind                    TEXT            NULL
	,CONSTRAINT gd_coverages_garage_keepers_otc_info_pkey 			PRIMARY KEY (sagitem,lis)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.gd_coverages_garage_keepers_otc_info OWNER TO mj_admin;
GO 

GRANT SELECT ON sagitta.gd_coverages_garage_keepers_otc_info TO rl_sagitta_r;
GO 

GRANT INSERT ON sagitta.gd_coverages_garage_keepers_otc_info TO rl_sagitta_a;
GO 

GRANT UPDATE ON sagitta.gd_coverages_garage_keepers_otc_info TO rl_sagitta_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON sagitta.gd_coverages_garage_keepers_otc_info FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_gd_coverages_garage_keepers_otc_info_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON sagitta.gd_coverages_garage_keepers_otc_info FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_gd_coverages_garage_keepers_otc_info_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON sagitta.gd_coverages_garage_keepers_otc_info FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION sagitta.tr_audit_gd_coverages_garage_keepers_otc_info_u();
GO 

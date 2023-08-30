CREATE TABLE sagitta.ba_coverages_hired_info (
	 sagitem 								TEXT 		NOT NULL 
	,lis 									int 		NOT NULL 
	,hired_liability_class_cd 				TEXT 		NULL 
	,hired_location_agency_id 				TEXT 		NULL 
	,hired_state_prov_cd 					TEXT 		NULL 
	,hired_liability_cost_amt 				TEXT 		NULL 
	,hired_liability_rate 					TEXT 		NULL 
	,hired_physical_damage_rate 			TEXT 		NULL 
	,hired_liability_minimum_yes_no_cd 		TEXT 		NULL 
	,hired_num_days 						TEXT 		NULL 
	,hired_num_vehs 						TEXT 		NULL 
	,hired_comprehensive_deductible_amt 	TEXT 		NULL 
	,hired_specified_perils_deductible_amt 	TEXT 		NULL 
	,hired_collision_deductible_amt 		TEXT 		NULL 
	,CONSTRAINT ba_coverages_hired_info_pkey PRIMARY KEY (sagitem,lis)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.ba_coverages_hired_info OWNER TO mj_admin;
GO 

GRANT SELECT ON sagitta.ba_coverages_hired_info TO rl_sagitta_r;
GO 

GRANT INSERT ON sagitta.ba_coverages_hired_info TO rl_sagitta_a;
GO 

GRANT UPDATE ON sagitta.ba_coverages_hired_info TO rl_sagitta_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON sagitta.ba_coverages_hired_info FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_ba_coverages_hired_info_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON sagitta.ba_coverages_hired_info FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_ba_coverages_hired_info_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON sagitta.ba_coverages_hired_info FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION sagitta.tr_audit_ba_coverages_hired_info_u();
GO 
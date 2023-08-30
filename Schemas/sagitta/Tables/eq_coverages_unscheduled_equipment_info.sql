CREATE TABLE sagitta.eq_coverages_unscheduled_equipment_info (
	 sagitem 								int 		NOT NULL 
	,lis 									int 		NOT NULL 
	,unsch_equip_desc 						TEXT 		NULL 
	,unscheduled_equip_coins_pct 			TEXT 		NULL 
	,num_unscheduled_equip_max_item 		TEXT 		NULL 
	,unscheduled_equipm_insurance_amt 		TEXT 		NULL 
	,CONSTRAINT eq_coverages_unscheduled_equipment_info_pkey 			PRIMARY KEY (sagitem,lis)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.eq_coverages_unscheduled_equipment_info OWNER TO mj_admin;
GO 

GRANT SELECT ON sagitta.eq_coverages_unscheduled_equipment_info TO rl_sagitta_r;
GO 

GRANT INSERT ON sagitta.eq_coverages_unscheduled_equipment_info TO rl_sagitta_a;
GO

GRANT UPDATE ON sagitta.eq_coverages_unscheduled_equipment_info TO rl_sagitta_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON sagitta.eq_coverages_unscheduled_equipment_info FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_eq_coverages_unscheduled_equipment_info_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON sagitta.eq_coverages_unscheduled_equipment_info FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_eq_coverages_unscheduled_equipment_info_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON sagitta.eq_coverages_unscheduled_equipment_info FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION sagitta.tr_audit_eq_coverages_unscheduled_equipment_info_u();
GO 

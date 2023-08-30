CREATE TABLE sagitta.eq_coverages_equipment_storage_info (
	 sagitem 								int 		NOT NULL 
	,lis 									int 		NOT NULL 
	,location_agency_id 					TEXT 		NULL 
	,num_months_in_storage 					TEXT 		NULL 
	,max_value_in_building 					TEXT 		NULL 
	,max_value_out_building 				TEXT 		NULL 
	,equip_storage_security 				TEXT 		NULL 
	,CONSTRAINT eq_coverages_equipment_storage_info_pkey 		PRIMARY KEY (sagitem,lis)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.eq_coverages_equipment_storage_info OWNER TO mj_admin;
GO 

GRANT SELECT ON sagitta.eq_coverages_equipment_storage_info TO rl_sagitta_r;
GO 

GRANT INSERT ON sagitta.eq_coverages_equipment_storage_info TO rl_sagitta_a;
GO 

GRANT UPDATE ON sagitta.eq_coverages_equipment_storage_info TO rl_sagitta_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON sagitta.eq_coverages_equipment_storage_info FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_eq_coverages_equipment_storage_info_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON sagitta.eq_coverages_equipment_storage_info FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_eq_coverages_equipment_storage_info_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON sagitta.eq_coverages_equipment_storage_info FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION sagitta.tr_audit_eq_coverages_equipment_storage_info_u();
GO 

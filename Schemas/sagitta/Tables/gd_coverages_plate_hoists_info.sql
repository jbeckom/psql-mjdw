CREATE TABLE sagitta.gd_coverages_plate_hoists_info (
	 sagitem 								int 			NOT NULL 
	,lis 									int 			NOT NULL 
	,plates_hoists_location_number 			TEXT 			NULL 
	,num_dealer_plates 						TEXT 			NULL 
	,num_repairer_plates 					TEXT 			NULL 
	,num_transportation_plates 				TEXT 			NULL 
	,num_hoists 							TEXT 			NULL 
	,CONSTRAINT gd_coverages_plate_hoists_info_pkey 			PRIMARY KEY (sagitem,lis)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.gd_coverages_plate_hoists_info OWNER TO mj_admin;
GO 

GRANT SELECT ON sagitta.gd_coverages_plate_hoists_info TO rl_sagitta_r;
GO 

GRANT INSERT ON sagitta.gd_coverages_plate_hoists_info TO rl_sagitta_a;
GO 

GRANT UPDATE ON sagitta.gd_coverages_plate_hoists_info TO rl_sagitta_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON sagitta.gd_coverages_plate_hoists_info FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_gd_coverages_plate_hoists_info_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON sagitta.gd_coverages_plate_hoists_info FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_gd_coverages_plate_hoists_info_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON sagitta.gd_coverages_plate_hoists_info FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION sagitta.tr_audit_gd_coverages_plate_hoists_info_u();
GO 
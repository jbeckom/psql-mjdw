CREATE TABLE sagitta.eq_coverages_scheduled_equipment_item_number_info (
	 sagitem 								int 		NOT NULL 
	,lis 									int 		NOT NULL 
	,equipment_schedule_item_number 		TEXT 		NULL 
	,equipment_sch_model_yr 				TEXT 		NULL 
	,equip_sch_id_serial_number 			TEXT 		NULL 
	,equip_sch_purchase_dt 					TEXT 		NULL 
	,equip_sch_new_used_ind 				TEXT 		NULL 
	,equipment_schedule_deductible_amt 		TEXT 		NULL 
	,equip_sch_insurance_amt 				TEXT 		NULL 
	,equip_sch_desc 						TEXT 		NULL 
	,ded_type 								TEXT 		NULL 
	,ded_basis 								TEXT 		NULL 
	,limit_basis 							TEXT 		NULL 
	,model 									TEXT 		NULL 
	,item_value 							TEXT 		NULL 
	,item_value_type 						TEXT 		NULL 
	,schedule_equipment_limit_val_date 		TEXT 		NULL 
	,owned_leased 							TEXT 		NULL 
	,schedule 								TEXT 		NULL 
	,manufacturer 							TEXT 		NULL 
	,aoi_seq_no 							TEXT 		NULL 
	,CONSTRAINT eq_coverages_scheduled_equipment_item_number_info_pkey PRIMARY KEY (sagitem,lis)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.eq_coverages_scheduled_equipment_item_number_info OWNER TO mj_admin;
GO 

GRANT SELECT ON sagitta.eq_coverages_scheduled_equipment_item_number_info TO rl_sagitta_r;
GO 

GRANT INSERT ON sagitta.eq_coverages_scheduled_equipment_item_number_info TO rl_sagitta_a;
GO 

GRANT UPDATE ON sagitta.eq_coverages_scheduled_equipment_item_number_info TO rl_sagitta_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON sagitta.eq_coverages_scheduled_equipment_item_number_info FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_eq_coverages_scheduled_equipment_item_number_info_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON sagitta.eq_coverages_scheduled_equipment_item_number_info FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_eq_coverages_scheduled_equipment_item_number_info_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON sagitta.eq_coverages_scheduled_equipment_item_number_info FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION sagitta.tr_audit_eq_coverages_scheduled_equipment_item_number_info_u();
GO 

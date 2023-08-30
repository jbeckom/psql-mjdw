CREATE TABLE sagitta.audit_eq_coverages_scheduled_equipment_item_number_info (
	 sagitem 								int 		NOT NULL 
	,lis 									int 		NOT NULL 
	,old_equipment_schedule_item_number 		TEXT 		NULL 
	,new_equipment_schedule_item_number 		TEXT 		NULL 
	,old_equipment_sch_model_yr 				TEXT 		NULL 
	,new_equipment_sch_model_yr 				TEXT 		NULL 
	,old_equip_sch_id_serial_number 			TEXT 		NULL 
	,new_equip_sch_id_serial_number 			TEXT 		NULL 
	,old_equip_sch_purchase_dt 					TEXT 		NULL 
	,new_equip_sch_purchase_dt 					TEXT 		NULL 
	,old_equip_sch_new_used_ind 				TEXT 		NULL 
	,new_equip_sch_new_used_ind 				TEXT 		NULL 
	,old_equipment_schedule_deductible_amt 		TEXT 		NULL 
	,new_equipment_schedule_deductible_amt 		TEXT 		NULL 
	,old_equip_sch_insurance_amt 				TEXT 		NULL 
	,new_equip_sch_insurance_amt 				TEXT 		NULL 
	,old_equip_sch_desc 						TEXT 		NULL 
	,new_equip_sch_desc 						TEXT 		NULL 
	,old_ded_type 								TEXT 		NULL 
	,new_ded_type 								TEXT 		NULL 
	,old_ded_basis 								TEXT 		NULL 
	,new_ded_basis 								TEXT 		NULL 
	,old_limit_basis 							TEXT 		NULL 
	,new_limit_basis 							TEXT 		NULL 
	,old_model 									TEXT 		NULL 
	,new_model 									TEXT 		NULL 
	,old_item_value 							TEXT 		NULL 
	,new_item_value 							TEXT 		NULL 
	,old_item_value_type 						TEXT 		NULL 
	,new_item_value_type 						TEXT 		NULL 
	,old_schedule_equipment_limit_val_date 		TEXT 		NULL 
	,new_schedule_equipment_limit_val_date 		TEXT 		NULL 
	,old_owned_leased 							TEXT 		NULL 
	,new_owned_leased 							TEXT 		NULL 
	,old_schedule 								TEXT 		NULL 
	,new_schedule 								TEXT 		NULL 
	,old_manufacturer 							TEXT 		NULL 
	,new_manufacturer 							TEXT 		NULL 
	,old_aoi_seq_no 							TEXT 		NULL 
	,new_aoi_seq_no 							TEXT 		NULL 
	,audit_action 								char(1) 		NOT NULL 
	,audit_user 								TEXT 			NOT NULL 		DEFAULT current_user 
	,audit_timestamp 							timestamp 		NOT NULL 		DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 									bigint 			NOT NULL 		GENERATED ALWAYS AS IDENTITY 		PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.audit_eq_coverages_scheduled_equipment_item_number_info OWNER TO mj_admin;
GO 

GRANT INSERT ON sagitta.audit_eq_coverages_scheduled_equipment_item_number_info TO rl_sagitta_a;
GO 

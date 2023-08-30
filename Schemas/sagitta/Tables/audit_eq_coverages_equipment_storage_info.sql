CREATE TABLE sagitta.audit_eq_coverages_equipment_storage_info (
	 sagitem 									int 		NOT NULL 
	,lis 										int 		NOT NULL 
	,old_location_agency_id 					TEXT 		NULL 
	,new_location_agency_id 					TEXT 		NULL 
	,old_num_months_in_storage 					TEXT 		NULL 
	,new_num_months_in_storage 					TEXT 		NULL 
	,old_max_value_in_building 					TEXT 		NULL 
	,new_max_value_in_building 					TEXT 		NULL 
	,old_max_value_out_building 				TEXT 		NULL 
	,new_max_value_out_building 				TEXT 		NULL 
	,old_equip_storage_security 				TEXT 		NULL 
	,new_equip_storage_security 				TEXT 		NULL 
	,audit_action 								char(1) 		NOT NULL 
	,audit_user 								TEXT 			NOT NULL 		DEFAULT current_user 
	,audit_timestamp 							timestamp 		NOT NULL 		DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 									bigint 			NOT NULL 		GENERATED ALWAYS AS IDENTITY 		PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.audit_eq_coverages_equipment_storage_info OWNER TO mj_admin;
GO 

GRANT INSERT ON sagitta.audit_eq_coverages_equipment_storage_info TO rl_sagitta_a;
GO 

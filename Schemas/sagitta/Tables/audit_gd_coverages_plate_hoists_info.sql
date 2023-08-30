CREATE TABLE sagitta.audit_gd_coverages_plate_hoists_info (
	 sagitem 									int 			NOT NULL 
	,lis 										int 			NOT NULL 
	,old_plates_hoists_location_number 			TEXT 			NULL 
	,new_plates_hoists_location_number 			TEXT 			NULL 
	,old_num_dealer_plates 						TEXT 			NULL 
	,new_num_dealer_plates 						TEXT 			NULL 
	,old_num_repairer_plates 					TEXT 			NULL 
	,new_num_repairer_plates 					TEXT 			NULL 
	,old_num_transportation_plates 				TEXT 			NULL 
	,new_num_transportation_plates 				TEXT 			NULL 
	,old_num_hoists 							TEXT 			NULL 
	,new_num_hoists 							TEXT 			NULL 
	,audit_action 								char(1) 		NOT NULL 
	,audit_user 								TEXT 			NOT NULL 			DEFAULT current_user 
	,audit_timestamp 							timestamp 		NOT NULL 			DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 									bigint 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.audit_gd_coverages_plate_hoists_info OWNER TO mj_admin;
GO 

GRANT INSERT ON sagitta.audit_gd_coverages_plate_hoists_info TO rl_sagitta_a;
GO 
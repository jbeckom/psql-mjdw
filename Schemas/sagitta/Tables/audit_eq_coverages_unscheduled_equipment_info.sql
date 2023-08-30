CREATE TABLE sagitta.audit_eq_coverages_unscheduled_equipment_info (
	 sagitem 									int 			NOT NULL 
	,lis  										int 			NOT NULL 
	,old_unsch_equip_desc 						TEXT 			NULL 
	,new_unsch_equip_desc 						TEXT 			NULL 
	,old_unscheduled_equip_coins_pct 			TEXT 			NULL 
	,new_unscheduled_equip_coins_pct 			TEXT 			NULL 
	,old_num_unscheduled_equip_max_item 		TEXT 			NULL 
	,new_num_unscheduled_equip_max_item 		TEXT 			NULL 
	,old_unscheduled_equipm_insurance_amt 		TEXT 			NULL 
	,new_unscheduled_equipm_insurance_amt 		TEXT 			NULL 
	,audit_action 								char(1) 		NOT NULL 
	,audit_user 								TEXT 			NOT NULL 		DEFAULT current_user 
	,audit_timestamp 							timestamp 		NOT NULL 		DEFAULT timezone('utc'::TEXT, clock_timestamp()) 
	,audit_id 									bigint 			NOT NULL 		GENERATED ALWAYS AS IDENTITY 		PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.audit_eq_coverages_unscheduled_equipment_info OWNER TO mj_admin;
GO 

GRANT INSERT ON sagitta.audit_eq_coverages_unscheduled_equipment_info TO rl_sagitta_a;
GO 
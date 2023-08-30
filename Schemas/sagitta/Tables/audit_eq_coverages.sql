CREATE TABLE sagitta.audit_eq_coverages (
	 sagitem 											int 		NOT NULL 
	,old_audit_staff_cd 								TEXT 		NULL 
	,new_audit_staff_cd 								TEXT 		NULL 
	,old_audit_entry_dt 								int 		NULL 
	,new_audit_entry_dt 								int 		NULL 
	,old_audit_time_ind 								int 		NULL 
	,new_audit_time_ind 								int 		NULL 
	,old_audit_cd 										TEXT 		NULL 
	,new_audit_cd 										TEXT 		NULL 
	,old_audit_history_record_number 					TEXT 		NULL 
	,new_audit_history_record_number 					TEXT 		NULL 
	,old_audit_program 									TEXT 		NULL 
	,new_audit_program 									TEXT 		NULL 
	,old_audit_effective_dt 							TEXT 		NULL 
	,new_audit_effective_dt 							TEXT 		NULL 
	,old_audit_change_agency_id 						TEXT 		NULL 
	,new_audit_change_agency_id 						TEXT 		NULL 
	,old_policy_agency_id 								TEXT 		NULL 
	,new_policy_agency_id 								TEXT 		NULL 
	,old_property_at_acquired_locations 				TEXT 		NULL 
	,new_property_at_acquired_locations 				TEXT 		NULL 
	,old_property_covered_at_all_locations 				TEXT 		NULL 
	,new_property_covered_at_all_locations 				TEXT 		NULL 
	,old_property_in_transit 							TEXT 		NULL 
	,new_property_in_transit 							TEXT 		NULL 
	,old_prop_not_at_your_premises_not_on_schedule 		TEXT 		NULL 
	,new_prop_not_at_your_premises_not_on_schedule 		TEXT 		NULL 
	,old_ded_flat_dollar_amt 							TEXT 		NULL 
	,new_ded_flat_dollar_amt 							TEXT 		NULL 
	,old_ded_percentage_of_equipment_value 				TEXT 		NULL 
	,new_ded_percentage_of_equipment_value 				TEXT 		NULL 
	,old_ded_percentage_minimum 						TEXT 		NULL 
	,new_ded_percentage_minimum 						TEXT 		NULL 
	,old_ded_percentage_maximum 						TEXT 		NULL 
	,new_ded_percentage_maximum 						TEXT 		NULL 
	,old_ded_annual_aggregate 							TEXT 		NULL 
	,new_ded_annual_aggregate 							TEXT 		NULL 
	,old_catastrophe_limit_per_event_accident 			TEXT 		NULL 
	,new_catastrophe_limit_per_event_accident 			TEXT 		NULL 
	,old_eq_flood_catastrophe_loss_amt 					TEXT 		NULL 
	,new_eq_flood_catastrophe_loss_amt 					TEXT 		NULL 
	,old_equipment_blanket_amt 							TEXT 		NULL 
	,new_equipment_blanket_amt 							TEXT 		NULL 
	,old_equipment_coins_pct 							TEXT 		NULL 
	,new_equipment_coins_pct 							TEXT 		NULL 
	,old_off_dt 										TEXT 		NULL 
	,new_off_dt 										TEXT 		NULL 
	,old_schedule_type 									TEXT 		NULL 
	,new_schedule_type 									TEXT 		NULL 
	,old_location_no 									TEXT 		NULL 
	,new_location_no 									TEXT 		NULL 
	,old_building_no 									TEXT 		NULL 
	,new_building_no 									TEXT 		NULL 
	,old_building_desc 									TEXT 		NULL 
	,new_building_desc 									TEXT 		NULL 
	,old_reporting 										TEXT 		NULL 
	,new_reporting 										TEXT 		NULL 
	,old_reporting_deposit_premium 						TEXT 		NULL 
	,new_reporting_deposit_premium 						TEXT 		NULL 
	,old_reporting_minimum_ann_premium 					TEXT 		NULL 
	,new_reporting_minimum_ann_premium 					TEXT 		NULL 
	,old_reporting_reporting_period 					TEXT 		NULL 
	,new_reporting_reporting_period 					TEXT 		NULL 
	,old_reporting_adjustment_period 					TEXT 		NULL 
	,new_reporting_adjustment_period 					TEXT 		NULL 
	,old_reporting_first_prem_base 						TEXT 		NULL 
	,new_reporting_first_prem_base 						TEXT 		NULL 
	,old_reporting_second_prem_base 					TEXT 		NULL 
	,new_reporting_second_prem_base 					TEXT 		NULL 
	,old_reporting_third_prem_base 						TEXT 		NULL 
	,new_reporting_third_prem_base 						TEXT 		NULL 
	,old_reporting_first_rate 							TEXT 		NULL 
	,new_reporting_first_rate 							TEXT 		NULL 
	,old_reporting_second_rate 							TEXT 		NULL 
	,new_reporting_second_rate 							TEXT 		NULL 
	,old_non_reporting 									TEXT 		NULL 
	,new_non_reporting 									TEXT 		NULL 
	,old_non_reporting_first_rate 						TEXT 		NULL 
	,new_non_reporting_first_rate 						TEXT 		NULL 
	,old_non_reporting_rate 							TEXT 		NULL 
	,new_non_reporting_rate 							TEXT 		NULL 
	,old_non_reporting_premium 							TEXT 		NULL 
	,new_non_reporting_premium 							TEXT 		NULL 
	,old_aoi_seq_no 									TEXT 		NULL 
	,new_aoi_seq_no 									TEXT 		NULL 
	,audit_action 										char(1) 		NOT NULL 
	,audit_user 										TEXT 			NOT NULL 		DEFAULT current_user
	,audit_timestamp 									timestamp 		NOT NULL 		DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 											bigint 			NOT NULL 		GENERATED ALWAYS AS IDENTITY 		PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.audit_eq_coverages OWNER TO mj_admin;
GO 

GRANT INSERT ON sagitta.audit_eq_coverages TO rl_sagitta_a;
GO 

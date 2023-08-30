CREATE TABLE sagitta.eq_coverages (
	 sagitem 										int 		NOT NULL 
	,audit_staff_cd 								TEXT 		NULL 
	,audit_entry_dt 								int 		NULL 
	,audit_time_ind 								int 		NULL 
	,audit_cd 										TEXT 		NULL 
	,audit_history_record_number 					TEXT 		NULL 
	,audit_program 									TEXT 		NULL 
	,audit_effective_dt 							TEXT 		NULL 
	,audit_change_agency_id 						TEXT 		NULL 
	,policy_agency_id 								TEXT 		NULL 
	,property_at_acquired_locations 				TEXT 		NULL 
	,property_covered_at_all_locations 				TEXT 		NULL 
	,property_in_transit 							TEXT 		NULL 
	,prop_not_at_your_premises_not_on_schedule 		TEXT 		NULL 
	,ded_flat_dollar_amt 							TEXT 		NULL 
	,ded_percentage_of_equipment_value 				TEXT 		NULL 
	,ded_percentage_minimum 						TEXT 		NULL 
	,ded_percentage_maximum 						TEXT 		NULL 
	,ded_annual_aggregate 							TEXT 		NULL 
	,catastrophe_limit_per_event_accident 			TEXT 		NULL 
	,eq_flood_catastrophe_loss_amt 					TEXT 		NULL 
	,equipment_blanket_amt 							TEXT 		NULL 
	,equipment_coins_pct 							TEXT 		NULL 
	,off_dt 										TEXT 		NULL 
	,schedule_type 									TEXT 		NULL 
	,location_no 									TEXT 		NULL 
	,building_no 									TEXT 		NULL 
	,building_desc 									TEXT 		NULL 
	,reporting 										TEXT 		NULL 
	,reporting_deposit_premium 						TEXT 		NULL 
	,reporting_minimum_ann_premium 					TEXT 		NULL 
	,reporting_reporting_period 					TEXT 		NULL 
	,reporting_adjustment_period 					TEXT 		NULL 
	,reporting_first_prem_base 						TEXT 		NULL 
	,reporting_second_prem_base 					TEXT 		NULL 
	,reporting_third_prem_base 						TEXT 		NULL 
	,reporting_first_rate 							TEXT 		NULL 
	,reporting_second_rate 							TEXT 		NULL 
	,non_reporting 									TEXT 		NULL 
	,non_reporting_first_rate 						TEXT 		NULL 
	,non_reporting_rate 							TEXT 		NULL 
	,non_reporting_premium 							TEXT 		NULL 
	,aoi_seq_no 									TEXT 		NULL 
	,CONSTRAINT eq_coverages_pkey PRIMARY KEY (sagitem)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.eq_coverages OWNER TO mj_admin;
GO 

GRANT SELECT ON sagitta.eq_coverages TO rl_sagitta_r;
GO 

GRANT INSERT ON sagitta.eq_coverages TO rl_sagitta_a;
GO 

GRANT UPDATE ON sagitta.eq_coverages TO rl_sagitta_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON sagitta.eq_coverages FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_eq_coverages_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON sagitta.eq_coverages FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_eq_coverages_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON sagitta.eq_coverages FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION sagitta.tr_audit_eq_coverages_u();
GO 
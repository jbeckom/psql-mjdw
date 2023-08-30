/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE sagitta.eq_coverages 
	 DROP CONSTRAINT IF EXISTS eq_coverages_pkey 
	,ADD CONSTRAINT eq_coverages_sagitem_uq 	UNIQUE (sagitem)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON sagitta.eq_coverages; 
GO
DROP TRIGGER IF EXISTS audit_i ON sagitta.eq_coverages; 
GO
DROP TRIGGER IF EXISTS audit_u ON sagitta.eq_coverages; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON sagitta.eq_coverages; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON sagitta.eq_coverages FOR EACH ROW EXECUTE FUNCTION audit.tr_sagitta_log_change(); 
GO
 
/*** MOVE AUDIT DATA FROM LEGACY TABLE(S) TO NEW AUDIT SCHEMA ***/
INSERT INTO audit.sagitta_log (audit_time, audit_user, audit_client, operation, table_name, table_key, new_record) 
SELECT 	 x.audit_timestamp 			AS audit_time 
		,x.audit_user 			AS audit_user 
		,'0.0.0.0'::inet 			AS audit_client 
		,CASE 
			WHEN x.audit_action = 'D' THEN 'DELETE' 
			WHEN x.audit_action = 'I' THEN 'INSERT' 
			WHEN x.audit_action = 'U' THEN 'UPDATE' 
		END 			AS operation 
		,'eq_coverages' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.sagitem
						,x.old_audit_staff_cd 			AS audit_staff_cd 
						,x.old_audit_entry_dt 			AS audit_entry_dt 
						,x.old_audit_time_ind 			AS audit_time_ind 
						,x.old_audit_cd 			AS audit_cd 
						,x.old_audit_history_record_number 			AS audit_history_record_number 
						,x.old_audit_program 			AS audit_program 
						,x.old_audit_effective_dt 			AS audit_effective_dt 
						,x.old_audit_change_agency_id 			AS audit_change_agency_id 
						,x.old_policy_agency_id 			AS policy_agency_id 
						,x.old_property_at_acquired_locations 			AS property_at_acquired_locations 
						,x.old_property_covered_at_all_locations 			AS property_covered_at_all_locations 
						,x.old_property_in_transit 			AS property_in_transit 
						,x.old_prop_not_at_your_premises_not_on_schedule 			AS prop_not_at_your_premises_not_on_schedule 
						,x.old_ded_flat_dollar_amt 			AS ded_flat_dollar_amt 
						,x.old_ded_percentage_of_equipment_value 			AS ded_percentage_of_equipment_value 
						,x.old_ded_percentage_minimum 			AS ded_percentage_minimum 
						,x.old_ded_percentage_maximum 			AS ded_percentage_maximum 
						,x.old_ded_annual_aggregate 			AS ded_annual_aggregate 
						,x.old_catastrophe_limit_per_event_accident 			AS catastrophe_limit_per_event_accident 
						,x.old_eq_flood_catastrophe_loss_amt 			AS eq_flood_catastrophe_loss_amt 
						,x.old_equipment_blanket_amt 			AS equipment_blanket_amt 
						,x.old_equipment_coins_pct 			AS equipment_coins_pct 
						,x.old_off_dt 			AS off_dt 
						,x.old_schedule_type 			AS schedule_type 
						,x.old_location_no 			AS location_no 
						,x.old_building_no 			AS building_no 
						,x.old_building_desc 			AS building_desc 
						,x.old_reporting 			AS reporting 
						,x.old_reporting_deposit_premium 			AS reporting_deposit_premium 
						,x.old_reporting_minimum_ann_premium 			AS reporting_minimum_ann_premium 
						,x.old_reporting_reporting_period 			AS reporting_reporting_period 
						,x.old_reporting_adjustment_period 			AS reporting_adjustment_period 
						,x.old_reporting_first_prem_base 			AS reporting_first_prem_base 
						,x.old_reporting_second_prem_base 			AS reporting_second_prem_base 
						,x.old_reporting_third_prem_base 			AS reporting_third_prem_base 
						,x.old_reporting_first_rate 			AS reporting_first_rate 
						,x.old_reporting_second_rate 			AS reporting_second_rate 
						,x.old_non_reporting 			AS non_reporting 
						,x.old_non_reporting_first_rate 			AS non_reporting_first_rate 
						,x.old_non_reporting_rate 			AS non_reporting_rate 
						,x.old_non_reporting_premium 			AS non_reporting_premium 
						,x.old_aoi_seq_no 			AS aoi_seq_no 
			) 	AS _ 
		) 			AS new_record 
FROM sagitta.audit_eq_coverages 	AS x 
	INNER JOIN 	sagitta.eq_coverages 	AS y 
		ON x.sagitem = y.sagitem; 
GO 

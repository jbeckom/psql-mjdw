/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE sagitta.eq_coverages_scheduled_equipment_item_number_info 
	 DROP CONSTRAINT IF EXISTS eq_coverages_scheduled_equipment_item_number_info_pkey 
	,ADD CONSTRAINT eq_coverages_scheduled_equipment_item_number_info_sagitem_uq 	UNIQUE (sagitem)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON sagitta.eq_coverages_scheduled_equipment_item_number_info; 
GO
DROP TRIGGER IF EXISTS audit_i ON sagitta.eq_coverages_scheduled_equipment_item_number_info; 
GO
DROP TRIGGER IF EXISTS audit_u ON sagitta.eq_coverages_scheduled_equipment_item_number_info; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON sagitta.eq_coverages_scheduled_equipment_item_number_info; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON sagitta.eq_coverages_scheduled_equipment_item_number_info FOR EACH ROW EXECUTE FUNCTION audit.tr_sagitta_log_change(); 
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
		,'eq_coverages_scheduled_equipment_item_number_info' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.sagitem
						,x.lis
						,x.old_equipment_schedule_item_number 			AS equipment_schedule_item_number 
						,x.old_equipment_sch_model_yr 			AS equipment_sch_model_yr 
						,x.old_equip_sch_id_serial_number 			AS equip_sch_id_serial_number 
						,x.old_equip_sch_purchase_dt 			AS equip_sch_purchase_dt 
						,x.old_equip_sch_new_used_ind 			AS equip_sch_new_used_ind 
						,x.old_equipment_schedule_deductible_amt 			AS equipment_schedule_deductible_amt 
						,x.old_equip_sch_insurance_amt 			AS equip_sch_insurance_amt 
						,x.old_equip_sch_desc 			AS equip_sch_desc 
						,x.old_ded_type 			AS ded_type 
						,x.old_ded_basis 			AS ded_basis 
						,x.old_limit_basis 			AS limit_basis 
						,x.old_model 			AS model 
						,x.old_item_value 			AS item_value 
						,x.old_item_value_type 			AS item_value_type 
						,x.old_schedule_equipment_limit_val_date 			AS schedule_equipment_limit_val_date 
						,x.old_owned_leased 			AS owned_leased 
						,x.old_schedule 			AS schedule 
						,x.old_manufacturer 			AS manufacturer 
						,x.old_aoi_seq_no 			AS aoi_seq_no 
			) 	AS _ 
		) 			AS new_record 
FROM sagitta.audit_eq_coverages_scheduled_equipment_item_number_info 	AS x 
	INNER JOIN 	sagitta.eq_coverages_scheduled_equipment_item_number_info 	AS y 
		ON x.sagitem = y.sagitem
			 AND x.lis = y.lis; 
GO 

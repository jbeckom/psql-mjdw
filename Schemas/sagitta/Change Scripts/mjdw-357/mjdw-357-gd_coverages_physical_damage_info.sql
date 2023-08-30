/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE sagitta.gd_coverages_physical_damage_info 
	 DROP CONSTRAINT IF EXISTS gd_coverages_physical_damage_info_pkey 
	,ADD CONSTRAINT gd_coverages_physical_damage_info_sagitem_uq 	UNIQUE (sagitem)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON sagitta.gd_coverages_physical_damage_info; 
GO
DROP TRIGGER IF EXISTS audit_i ON sagitta.gd_coverages_physical_damage_info; 
GO
DROP TRIGGER IF EXISTS audit_u ON sagitta.gd_coverages_physical_damage_info; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON sagitta.gd_coverages_physical_damage_info; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON sagitta.gd_coverages_physical_damage_info FOR EACH ROW EXECUTE FUNCTION audit.tr_sagitta_log_change(); 
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
		,'gd_coverages_physical_damage_info' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.sagitem
						,x.lis
						,x.old_physical_damage_location_number 			AS physical_damage_location_number 
						,x.old_building_limit 			AS building_limit 
						,x.old_standard_open_lot_limit 			AS standard_open_lot_limit 
						,x.old_non_standard_open_lot_limit 			AS non_standard_open_lot_limit 
						,x.old_miscellaneous_type_desc 			AS miscellaneous_type_desc 
						,x.old_miscellaneous_limit 			AS miscellaneous_limit 
						,x.old_total_limit 			AS total_limit 
						,x.old_per_auto_deductible_amt 			AS per_auto_deductible_amt 
						,x.old_max_per_loss_deductible_amt 			AS max_per_loss_deductible_amt 
						,x.old_fire_coverage_ind 			AS fire_coverage_ind 
						,x.old_fire_theft_coverage_ind 			AS fire_theft_coverage_ind 
						,x.old_fire_thef_wind_coverage_ind 			AS fire_thef_wind_coverage_ind 
						,x.old_limited_perils_coverage_ind 			AS limited_perils_coverage_ind 
						,x.old_physical_damage_premium_amt 			AS physical_damage_premium_amt 
						,x.old_physical_damage_scheduled_noscheduled_ind 			AS physical_damage_scheduled_noscheduled_ind 
			) 	AS _ 
		) 			AS new_record 
FROM sagitta.audit_gd_coverages_physical_damage_info 	AS x 
	INNER JOIN 	sagitta.gd_coverages_physical_damage_info 	AS y 
		ON x.sagitem = y.sagitem
			 AND x.lis = y.lis; 
GO 

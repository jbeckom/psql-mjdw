/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE sagitta.cp_coverages_location_specific_coverage_info 
	 DROP CONSTRAINT IF EXISTS cp_coverages_location_specific_coverage_info_pkey 
	,ADD CONSTRAINT cp_coverages_location_specific_coverage_info_sagitem_uq 	UNIQUE (sagitem)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON sagitta.cp_coverages_location_specific_coverage_info; 
GO
DROP TRIGGER IF EXISTS audit_i ON sagitta.cp_coverages_location_specific_coverage_info; 
GO
DROP TRIGGER IF EXISTS audit_u ON sagitta.cp_coverages_location_specific_coverage_info; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON sagitta.cp_coverages_location_specific_coverage_info; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON sagitta.cp_coverages_location_specific_coverage_info FOR EACH ROW EXECUTE FUNCTION audit.tr_sagitta_log_change(); 
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
		,'cp_coverages_location_specific_coverage_info' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.sagitem
						,x.lis
						,x.old_building_number 			AS building_number 
						,x.old_subject_insurance_cd 			AS subject_insurance_cd 
						,x.old_subject_insurance_desc 			AS subject_insurance_desc 
						,x.old_insurance_amt 			AS insurance_amt 
						,x.old_blanket_number 			AS blanket_number 
						,x.old_loss_cause_cd 			AS loss_cause_cd 
						,x.old_coinsurance_pct 			AS coinsurance_pct 
						,x.old_inflation_guard_pct 			AS inflation_guard_pct 
						,x.old_valuation_type_cd 			AS valuation_type_cd 
						,x.old_agreed_value_id 			AS agreed_value_id 
						,x.old_deductible_symbol 			AS deductible_symbol 
						,x.old_deductible 			AS deductible 
						,x.old_deductible_type_cd 			AS deductible_type_cd 
						,x.old_deductible_type_desc 			AS deductible_type_desc 
						,x.old_deductible_basic_cd 			AS deductible_basic_cd 
						,x.old_premium_amt 			AS premium_amt 
						,x.old_building_desc 			AS building_desc 
						,x.old_start_dt 			AS start_dt 
						,x.old_end_dt 			AS end_dt 
						,x.old_second_value_format_cd 			AS second_value_format_cd 
						,x.old_second_value_amt 			AS second_value_amt 
						,x.old_off_premises_power_dep_property_commercial_name 			AS off_premises_power_dep_property_commercial_name 
						,x.old_off_premises_power_dep_property_addr 			AS off_premises_power_dep_property_addr 
						,x.old_off_premises_power_dep_property_addr_2 			AS off_premises_power_dep_property_addr_2 
						,x.old_off_premises_power_dep_property_city 			AS off_premises_power_dep_property_city 
						,x.old_off_premises_power_dep_property_postal_code 			AS off_premises_power_dep_property_postal_code 
						,x.old_off_premises_power_dep_property_postal_extension_code 			AS off_premises_power_dep_property_postal_extension_code 
						,x.old_off_premises_power_dep_property_county 			AS off_premises_power_dep_property_county 
						,x.old_off_premises_power_dep_property_state_prov_cd 			AS off_premises_power_dep_property_state_prov_cd 
						,x.old_off_premises_power_dep_property_country 			AS off_premises_power_dep_property_country 
			) 	AS _ 
		) 			AS new_record 
FROM sagitta.audit_cp_coverages_location_specific_coverage_info 	AS x 
	INNER JOIN 	sagitta.cp_coverages_location_specific_coverage_info 	AS y 
		ON x.sagitem = y.sagitem
			 AND x.lis = y.lis; 
GO 

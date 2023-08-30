/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE sagitta.ba_coverages 
	 DROP CONSTRAINT IF EXISTS ba_coverages_pkey 
	,ADD CONSTRAINT ba_coverages_sagitem_uq 	UNIQUE (sagitem)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON sagitta.ba_coverages; 
GO
DROP TRIGGER IF EXISTS audit_i ON sagitta.ba_coverages; 
GO
DROP TRIGGER IF EXISTS audit_u ON sagitta.ba_coverages; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON sagitta.ba_coverages; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON sagitta.ba_coverages FOR EACH ROW EXECUTE FUNCTION audit.tr_sagitta_log_change(); 
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
		,'ba_coverages' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.sagitem
						,x.old_audit_staff_cd 			AS audit_staff_cd 
						,x.old_audit_entry_dt 			AS audit_entry_dt 
						,x.old_audit_time 			AS audit_time 
						,x.old_audit_cd 			AS audit_cd 
						,x.old_audit_history_record_number 			AS audit_history_record_number 
						,x.old_audit_program 			AS audit_program 
						,x.old_audit_effective_dt 			AS audit_effective_dt 
						,x.old_audit_change_agency_id 			AS audit_change_agency_id 
						,x.old_obsolete_tag_1 			AS obsolete_tag_1 
						,x.old_obsolete_tag_2 			AS obsolete_tag_2 
						,x.old_count_hired_info 			AS count_hired_info 
						,x.old_count_doc_info 			AS count_doc_info 
						,x.old_count_comml_audit_addl_cov_info 			AS count_comml_audit_addl_cov_info 
						,x.old_total_premium 			AS total_premium 
						,x.old_policy_agency_id 			AS policy_agency_id 
						,x.old_liability_symbol_1_cd 			AS liability_symbol_1_cd 
						,x.old_liability_symbol_2_cd 			AS liability_symbol_2_cd 
						,x.old_liability_symbol_3_cd 			AS liability_symbol_3_cd 
						,x.old_liability_symbol_4_cd 			AS liability_symbol_4_cd 
						,x.old_liability_symbol_5_cd 			AS liability_symbol_5_cd 
						,x.old_liability_1_limit 			AS liability_1_limit 
						,x.old_liability_2_limit 			AS liability_2_limit 
						,x.old_liability_deductible_amt 			AS liability_deductible_amt 
						,x.old_liability_premium_amt 			AS liability_premium_amt 
						,x.old_property_damage_limit 			AS property_damage_limit 
						,x.old_property_damage_deductible_amt 			AS property_damage_deductible_amt 
						,x.old_property_damage_premium_amt 			AS property_damage_premium_amt 
						,x.old_pip_no_fault_symbol_1_cd 			AS pip_no_fault_symbol_1_cd 
						,x.old_pip_no_fault_symbol_2_cd 			AS pip_no_fault_symbol_2_cd 
						,x.old_pip_no_fault_symbol_3_cd 			AS pip_no_fault_symbol_3_cd 
						,x.old_pip_limit 			AS pip_limit 
						,x.old_pip_deductible_amt 			AS pip_deductible_amt 
						,x.old_pip_premium_amt 			AS pip_premium_amt 
						,x.old_apip_symbol_1_cd 			AS apip_symbol_1_cd 
						,x.old_apip_symbol_2_cd 			AS apip_symbol_2_cd 
						,x.old_apip_limit 			AS apip_limit 
						,x.old_apip_deductible_amt 			AS apip_deductible_amt 
						,x.old_apip_premium_amt 			AS apip_premium_amt 
						,x.old_auto_medical_payments_symbol_1_cd 			AS auto_medical_payments_symbol_1_cd 
						,x.old_auto_medical_payments_symbol_2_cd 			AS auto_medical_payments_symbol_2_cd 
						,x.old_auto_medical_payments_symbol_3_cd 			AS auto_medical_payments_symbol_3_cd 
						,x.old_auto_medical_payments_deductible_amt 			AS auto_medical_payments_deductible_amt 
						,x.old_auto_medical_payments_premium_amt 			AS auto_medical_payments_premium_amt 
						,x.old_uninsured_motorist_symbol_1_cd 			AS uninsured_motorist_symbol_1_cd 
						,x.old_uninsured_motorist_symbol_2_cd 			AS uninsured_motorist_symbol_2_cd 
						,x.old_uninsured_motorist_symbol_3_cd 			AS uninsured_motorist_symbol_3_cd 
						,x.old_underinsured_motorist_1_limit 			AS underinsured_motorist_1_limit 
						,x.old_underinsured_motorist_2_limit 			AS underinsured_motorist_2_limit 
						,x.old_underinsured_motorist_deductible_amt 			AS underinsured_motorist_deductible_amt 
						,x.old_underinsured_pd_limit 			AS underinsured_pd_limit 
						,x.old_underinsured_deductible_pd_limit 			AS underinsured_deductible_pd_limit 
						,x.old_underinsured_premium_pd_amt 			AS underinsured_premium_pd_amt 
						,x.old_towing_and_labor_symbol_1_cd 			AS towing_and_labor_symbol_1_cd 
						,x.old_towing_and_labor_symbol_2_cd 			AS towing_and_labor_symbol_2_cd 
						,x.old_towing_and_labor_symbol_3_cd 			AS towing_and_labor_symbol_3_cd 
						,x.old_towing_and_labor_limit 			AS towing_and_labor_limit 
						,x.old_towing_and_labor_deductible_amt 			AS towing_and_labor_deductible_amt 
						,x.old_towing_and_labor_premium_amt 			AS towing_and_labor_premium_amt 
						,x.old_comprehensive_symbol_1_cd 			AS comprehensive_symbol_1_cd 
						,x.old_comprehensive_symbol_2_cd 			AS comprehensive_symbol_2_cd 
						,x.old_comprehensive_symbol_3_cd 			AS comprehensive_symbol_3_cd 
						,x.old_comprehensive_symbol_4_cd 			AS comprehensive_symbol_4_cd 
						,x.old_comprehensive_limit 			AS comprehensive_limit 
						,x.old_comprehensive_deductible_amt 			AS comprehensive_deductible_amt 
						,x.old_comprehensive_premium_amt 			AS comprehensive_premium_amt 
						,x.old_specified_perils_symbol_1_cd 			AS specified_perils_symbol_1_cd 
						,x.old_specified_perils_symbol_2_cd 			AS specified_perils_symbol_2_cd 
						,x.old_specified_perils_symbol_3_cd 			AS specified_perils_symbol_3_cd 
						,x.old_specified_perils_symbol_4_cd 			AS specified_perils_symbol_4_cd 
						,x.old_specified_perils_limit 			AS specified_perils_limit 
						,x.old_specified_perils_deductible_amt 			AS specified_perils_deductible_amt 
						,x.old_specified_perils_premium_amt 			AS specified_perils_premium_amt 
						,x.old_collision_symbol_1_cd 			AS collision_symbol_1_cd 
						,x.old_collision_symbol_2_cd 			AS collision_symbol_2_cd 
						,x.old_collision_symbol_3_cd 			AS collision_symbol_3_cd 
						,x.old_collision_symbol_4_cd 			AS collision_symbol_4_cd 
						,x.old_collision_limit 			AS collision_limit 
						,x.old_collision_deductible_amt 			AS collision_deductible_amt 
						,x.old_collision_premium_amt 			AS collision_premium_amt 
						,x.old_combined_phsycial_damage_symbol_1_cd 			AS combined_phsycial_damage_symbol_1_cd 
						,x.old_combined_phsycial_damage_symbol_2_cd 			AS combined_phsycial_damage_symbol_2_cd 
						,x.old_combined_phsycial_damage_symbol_3_cd 			AS combined_phsycial_damage_symbol_3_cd 
						,x.old_combined_phsycial_damage_symbol_4_cd 			AS combined_phsycial_damage_symbol_4_cd 
						,x.old_combined_physical_damage_limit 			AS combined_physical_damage_limit 
						,x.old_combined_physical_damage_deductible_amt 			AS combined_physical_damage_deductible_amt 
						,x.old_combined_physical_damage_premium_amt 			AS combined_physical_damage_premium_amt 
						,x.old_off_dt 			AS off_dt 
						,x.old_hired_physical_damage_cost_amt 			AS hired_physical_damage_cost_amt 
			) 	AS _ 
		) 			AS new_record 
FROM sagitta.audit_ba_coverages 	AS x 
	INNER JOIN 	sagitta.ba_coverages 	AS y 
		ON x.sagitem = y.sagitem; 
GO 

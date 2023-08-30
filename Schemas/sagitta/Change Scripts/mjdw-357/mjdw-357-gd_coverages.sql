/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE sagitta.gd_coverages 
	 DROP CONSTRAINT IF EXISTS gd_coverages_pkey 
	,ADD CONSTRAINT gd_coverages_sagitem_uq 	UNIQUE (sagitem)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON sagitta.gd_coverages; 
GO
DROP TRIGGER IF EXISTS audit_i ON sagitta.gd_coverages; 
GO
DROP TRIGGER IF EXISTS audit_u ON sagitta.gd_coverages; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON sagitta.gd_coverages; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON sagitta.gd_coverages FOR EACH ROW EXECUTE FUNCTION audit.tr_sagitta_log_change(); 
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
		,'gd_coverages' 			AS table_name 
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
						,x.old_policy_seq_agency_id 			AS policy_seq_agency_id 
						,x.old_liability_symbol_1_cd 			AS liability_symbol_1_cd 
						,x.old_liability_symbol_2_cd 			AS liability_symbol_2_cd 
						,x.old_liability_symbol_3_cd 			AS liability_symbol_3_cd 
						,x.old_liability_symbol_4_cd 			AS liability_symbol_4_cd 
						,x.old_liability_symbol_5_cd 			AS liability_symbol_5_cd 
						,x.old_auto_only_liability_bi_limit 			AS auto_only_liability_bi_limit 
						,x.old_auto_only_liability_csl_limit 			AS auto_only_liability_csl_limit 
						,x.old_auto_only_liability_pd_limit 			AS auto_only_liability_pd_limit 
						,x.old_other_than_auto_only_liability_bi_limit 			AS other_than_auto_only_liability_bi_limit 
						,x.old_other_than_auto_only_liability_limit 			AS other_than_auto_only_liability_limit 
						,x.old_other_than_auto_only_liability_pd_limit 			AS other_than_auto_only_liability_pd_limit 
						,x.old_aggregate_other_than_auto_only_liability_limit 			AS aggregate_other_than_auto_only_liability_limit 
						,x.old_liability_deductible_amt 			AS liability_deductible_amt 
						,x.old_limited_liability_ind 			AS limited_liability_ind 
						,x.old_unlimited_liability_ind 			AS unlimited_liability_ind 
						,x.old_auto_only_premium_1_amt 			AS auto_only_premium_1_amt 
						,x.old_auto_only_premium_2_amt 			AS auto_only_premium_2_amt 
						,x.old_otherthan_auto_premium_1_amt 			AS otherthan_auto_premium_1_amt 
						,x.old_otherthan_auto_premium_2_amt 			AS otherthan_auto_premium_2_amt 
						,x.old_aggregate_other_than_auto_premium_1_amt 			AS aggregate_other_than_auto_premium_1_amt 
						,x.old_aggregate_other_than_auto_premium_2_amt 			AS aggregate_other_than_auto_premium_2_amt 
						,x.old_pip_no_fault_symbol_1_cd 			AS pip_no_fault_symbol_1_cd 
						,x.old_pip_no_fault_symbol_2_cd 			AS pip_no_fault_symbol_2_cd 
						,x.old_pip_no_fault_symbol_3_cd 			AS pip_no_fault_symbol_3_cd 
						,x.old_pip_no_fault_deductible_amt 			AS pip_no_fault_deductible_amt 
						,x.old_pip_no_fault_limit 			AS pip_no_fault_limit 
						,x.old_pip_no_fault_premium_amt 			AS pip_no_fault_premium_amt 
						,x.old_apip_symbol_1_cd 			AS apip_symbol_1_cd 
						,x.old_apip_symbol_2_cd 			AS apip_symbol_2_cd 
						,x.old_apip_symbol_3_cd 			AS apip_symbol_3_cd 
						,x.old_apip_limit 			AS apip_limit 
						,x.old_apip_deductible_amt 			AS apip_deductible_amt 
						,x.old_apip_premium_amt 			AS apip_premium_amt 
						,x.old_medical_payments_symbol_1_cd 			AS medical_payments_symbol_1_cd 
						,x.old_medical_payments_symbol_2_cd 			AS medical_payments_symbol_2_cd 
						,x.old_medical_payments_symbol_3_cd 			AS medical_payments_symbol_3_cd 
						,x.old_medical_payments_limit 			AS medical_payments_limit 
						,x.old_medical_payments_auto_ind 			AS medical_payments_auto_ind 
						,x.old_medical_payments_premises_operations_ind 			AS medical_payments_premises_operations_ind 
						,x.old_medical_payments_deductible_amt 			AS medical_payments_deductible_amt 
						,x.old_medical_payments_premium_1_amt 			AS medical_payments_premium_1_amt 
						,x.old_medical_payments_premium_2_amt 			AS medical_payments_premium_2_amt 
						,x.old_uninsured_motorist_symbol_1_cd 			AS uninsured_motorist_symbol_1_cd 
						,x.old_uninsured_motorist_symbol_2_cd 			AS uninsured_motorist_symbol_2_cd 
						,x.old_uninsured_motorist_symbol_3_cd 			AS uninsured_motorist_symbol_3_cd 
						,x.old_uninsured_motorist_liability_bi_limit 			AS uninsured_motorist_liability_bi_limit 
						,x.old_uninsured_motorist_liability_csl_limit 			AS uninsured_motorist_liability_csl_limit 
						,x.old_uninsured_motorist_liability_pd_limit 			AS uninsured_motorist_liability_pd_limit 
						,x.old_uninsured_motorist_deductible_amt 			AS uninsured_motorist_deductible_amt 
						,x.old_uninsured_motorist_premium_1_amt 			AS uninsured_motorist_premium_1_amt 
						,x.old_uninsured_motorist_premium_2_amt 			AS uninsured_motorist_premium_2_amt 
						,x.old_underinsured_motorist_symbol_1_cd 			AS underinsured_motorist_symbol_1_cd 
						,x.old_underinsured_motorist_symbol_2_cd 			AS underinsured_motorist_symbol_2_cd 
						,x.old_underinsured_motorist_symbol_3_cd 			AS underinsured_motorist_symbol_3_cd 
						,x.old_underinsured_motoist_per_person_limit 			AS underinsured_motoist_per_person_limit 
						,x.old_underinsured_motoist_eacj_accident_limit 			AS underinsured_motoist_eacj_accident_limit 
						,x.old_underinsured_motoist_pdt_limit 			AS underinsured_motoist_pdt_limit 
						,x.old_underinsured_motorist_deductible_amt 			AS underinsured_motorist_deductible_amt 
						,x.old_underinsured_motorist_premium_1_amt 			AS underinsured_motorist_premium_1_amt 
						,x.old_underinsured_motorist_premium_2_amt 			AS underinsured_motorist_premium_2_amt 
						,x.old_off_dt 			AS off_dt 
						,x.old_comprehensive_cov_ind 			AS comprehensive_cov_ind 
						,x.old_specified_perils_cov_ind 			AS specified_perils_cov_ind 
						,x.old_comprehensive_symbol_1_cd 			AS comprehensive_symbol_1_cd 
						,x.old_comprehensive_symbol_2_cd 			AS comprehensive_symbol_2_cd 
						,x.old_comprehensive_symbol_3_cd 			AS comprehensive_symbol_3_cd 
						,x.old_comprehensive_symbol_4_cd 			AS comprehensive_symbol_4_cd 
						,x.old_physical_damage_collision_symbol_1_cd 			AS physical_damage_collision_symbol_1_cd 
						,x.old_physical_damage_collision_symbol_2_cd 			AS physical_damage_collision_symbol_2_cd 
						,x.old_physical_damage_collision_symbol_3_cd 			AS physical_damage_collision_symbol_3_cd 
						,x.old_physical_damage_collision_symbol_4_cd 			AS physical_damage_collision_symbol_4_cd 
						,x.old_physical_damage_collision_limit 			AS physical_damage_collision_limit 
						,x.old_physical_damage_collision_deductible_amt 			AS physical_damage_collision_deductible_amt 
						,x.old_physical_damage_collision_premium_amt 			AS physical_damage_collision_premium_amt 
						,x.old_gargage_keepers_legal_liability_ind 			AS gargage_keepers_legal_liability_ind 
						,x.old_garagae_keepers_direct_basis_ind 			AS garagae_keepers_direct_basis_ind 
						,x.old_gargage_keepers_primary_ind 			AS gargage_keepers_primary_ind 
						,x.old_gargage_keepers_excess_ind 			AS gargage_keepers_excess_ind 
						,x.old_garagekeeps_other_than_collision_comprehensive_ind 			AS garagekeeps_other_than_collision_comprehensive_ind 
						,x.old_garagekeeps_other_than_collision_specified_perils_ind 			AS garagekeeps_other_than_collision_specified_perils_ind 
						,x.old_garagekeeps_other_than_collision_symbol_cd 			AS garagekeeps_other_than_collision_symbol_cd 
						,x.old_garagekeeps_collision_symbol_cd 			AS garagekeeps_collision_symbol_cd 
						,x.old_towing_labor_symbol_1_cd 			AS towing_labor_symbol_1_cd 
						,x.old_towing_labor_symbol_2_cd 			AS towing_labor_symbol_2_cd 
						,x.old_towing_labor_symbol_3_cd 			AS towing_labor_symbol_3_cd 
						,x.old_towing_labor_symbol_4_cd 			AS towing_labor_symbol_4_cd 
						,x.old_towing_labor_limit 			AS towing_labor_limit 
						,x.old_towing_labor_deductible_amt 			AS towing_labor_deductible_amt 
						,x.old_towing_labor_premium_amt 			AS towing_labor_premium_amt 
						,x.old_combined_physical_damage_symbol_1_cd 			AS combined_physical_damage_symbol_1_cd 
						,x.old_combined_physical_damage_symbol_2_cd 			AS combined_physical_damage_symbol_2_cd 
						,x.old_combined_physical_damage_symbol_3_cd 			AS combined_physical_damage_symbol_3_cd 
						,x.old_combined_phyiscal_damage_symbol_4_cd 			AS combined_phyiscal_damage_symbol_4_cd 
						,x.old_combined_phyisical_damage_limit 			AS combined_phyisical_damage_limit 
						,x.old_combined_phyisical_damage_deductible_amt 			AS combined_phyisical_damage_deductible_amt 
						,x.old_combined_phyisical_damage_premium_amt 			AS combined_phyisical_damage_premium_amt 
						,x.old_reporting_types 			AS reporting_types 
						,x.old_physical_damage_reporting_period_cd 			AS physical_damage_reporting_period_cd 
						,x.old_non_reporting_ind 			AS non_reporting_ind 
						,x.old_temporary_location_limit 			AS temporary_location_limit 
						,x.old_transit_limit 			AS transit_limit 
						,x.old_total_premium 			AS total_premium 
			) 	AS _ 
		) 			AS new_record 
FROM sagitta.audit_gd_coverages 	AS x 
	INNER JOIN 	sagitta.gd_coverages 	AS y 
		ON x.sagitem = y.sagitem; 
GO 

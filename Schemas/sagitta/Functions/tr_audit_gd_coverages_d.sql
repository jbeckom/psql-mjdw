CREATE OR REPLACE FUNCTION sagitta.tr_audit_gd_coverages_d() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$ 

BEGIN 
	INSERT INTO sagitta.audit_gd_coverages (
		 sagitem 
		,old_audit_staff_cd 
		,old_audit_entry_dt 
		,old_audit_time 
		,old_audit_cd 
		,old_audit_history_record_number 
		,old_audit_program 
		,old_audit_effective_dt 
		,old_audit_change_agency_id 
		,old_policy_seq_agency_id 
		,old_liability_symbol_1_cd 
		,old_liability_symbol_2_cd 
		,old_liability_symbol_3_cd 
		,old_liability_symbol_4_cd 
		,old_liability_symbol_5_cd 
		,old_auto_only_liability_bi_limit 
		,old_auto_only_liability_csl_limit 
		,old_auto_only_liability_pd_limit 
		,old_other_than_auto_only_liability_bi_limit 
		,old_other_than_auto_only_liability_limit 
		,old_other_than_auto_only_liability_pd_limit 
		,old_aggregate_other_than_auto_only_liability_limit 
		,old_liability_deductible_amt 
		,old_limited_liability_ind 
		,old_unlimited_liability_ind 
		,old_auto_only_premium_1_amt 
		,old_auto_only_premium_2_amt 
		,old_otherthan_auto_premium_1_amt 
		,old_otherthan_auto_premium_2_amt 
		,old_aggregate_other_than_auto_premium_1_amt 
		,old_aggregate_other_than_auto_premium_2_amt 
		,old_pip_no_fault_symbol_1_cd 
		,old_pip_no_fault_symbol_2_cd 
		,old_pip_no_fault_symbol_3_cd 
		,old_pip_no_fault_deductible_amt 
		,old_pip_no_fault_limit 
		,old_pip_no_fault_premium_amt 
		,old_apip_symbol_1_cd 
		,old_apip_symbol_2_cd 
		,old_apip_symbol_3_cd 
		,old_apip_limit 
		,old_apip_deductible_amt 
		,old_apip_premium_amt 
		,old_medical_payments_symbol_1_cd 
		,old_medical_payments_symbol_2_cd 
		,old_medical_payments_symbol_3_cd 
		,old_medical_payments_limit 
		,old_medical_payments_auto_ind 
		,old_medical_payments_premises_operations_ind 
		,old_medical_payments_deductible_amt 
		,old_medical_payments_premium_1_amt 
		,old_medical_payments_premium_2_amt 
		,old_uninsured_motorist_symbol_1_cd 
		,old_uninsured_motorist_symbol_2_cd 
		,old_uninsured_motorist_symbol_3_cd 
		,old_uninsured_motorist_liability_bi_limit 
		,old_uninsured_motorist_liability_csl_limit 
		,old_uninsured_motorist_liability_pd_limit 
		,old_uninsured_motorist_deductible_amt 
		,old_uninsured_motorist_premium_1_amt 
		,old_uninsured_motorist_premium_2_amt 
		,old_underinsured_motorist_symbol_1_cd 
		,old_underinsured_motorist_symbol_2_cd 
		,old_underinsured_motorist_symbol_3_cd 
		,old_underinsured_motoist_per_person_limit 
		,old_underinsured_motoist_eacj_accident_limit 
		,old_underinsured_motoist_pdt_limit 
		,old_underinsured_motorist_deductible_amt 
		,old_underinsured_motorist_premium_1_amt 
		,old_underinsured_motorist_premium_2_amt 
		,old_off_dt 
		,old_comprehensive_cov_ind 
		,old_specified_perils_cov_ind 
		,old_comprehensive_symbol_1_cd 
		,old_comprehensive_symbol_2_cd 
		,old_comprehensive_symbol_3_cd 
		,old_comprehensive_symbol_4_cd 
		,old_physical_damage_collision_symbol_1_cd 
		,old_physical_damage_collision_symbol_2_cd 
		,old_physical_damage_collision_symbol_3_cd 
		,old_physical_damage_collision_symbol_4_cd 
		,old_physical_damage_collision_limit 
		,old_physical_damage_collision_deductible_amt 
		,old_physical_damage_collision_premium_amt 
		,old_gargage_keepers_legal_liability_ind 
		,old_garagae_keepers_direct_basis_ind 
		,old_gargage_keepers_primary_ind 
		,old_gargage_keepers_excess_ind 
		,old_garagekeeps_other_than_collision_comprehensive_ind 
		,old_garagekeeps_other_than_collision_specified_perils_ind 
		,old_garagekeeps_other_than_collision_symbol_cd 
		,old_garagekeeps_collision_symbol_cd 
		,old_towing_labor_symbol_1_cd 
		,old_towing_labor_symbol_2_cd 
		,old_towing_labor_symbol_3_cd 
		,old_towing_labor_symbol_4_cd 
		,old_towing_labor_limit 
		,old_towing_labor_deductible_amt 
		,old_towing_labor_premium_amt 
		,old_combined_physical_damage_symbol_1_cd 
		,old_combined_physical_damage_symbol_2_cd 
		,old_combined_physical_damage_symbol_3_cd 
		,old_combined_phyiscal_damage_symbol_4_cd 
		,old_combined_phyisical_damage_limit 
		,old_combined_phyisical_damage_deductible_amt 
		,old_combined_phyisical_damage_premium_amt 
		,old_reporting_types 
		,old_physical_damage_reporting_period_cd 
		,old_non_reporting_ind 
		,old_temporary_location_limit 
		,old_transit_limit 
		,old_total_premium 
		,audit_action 
	)
	SELECT 	 OLD.sagitem 
			,OLD.audit_staff_cd 
			,OLD.audit_entry_dt 
			,OLD.audit_time 
			,OLD.audit_cd 
			,OLD.audit_history_record_number 
			,OLD.audit_program 
			,OLD.audit_effective_dt 
			,OLD.audit_change_agency_id 
			,OLD.policy_seq_agency_id 
			,OLD.liability_symbol_1_cd 
			,OLD.liability_symbol_2_cd 
			,OLD.liability_symbol_3_cd 
			,OLD.liability_symbol_4_cd 
			,OLD.liability_symbol_5_cd 
			,OLD.auto_only_liability_bi_limit 
			,OLD.auto_only_liability_csl_limit 
			,OLD.auto_only_liability_pd_limit 
			,OLD.other_than_auto_only_liability_bi_limit 
			,OLD.other_than_auto_only_liability_limit 
			,OLD.other_than_auto_only_liability_pd_limit 
			,OLD.aggregate_other_than_auto_only_liability_limit 
			,OLD.liability_deductible_amt 
			,OLD.limited_liability_ind 
			,OLD.unlimited_liability_ind 
			,OLD.auto_only_premium_1_amt 
			,OLD.auto_only_premium_2_amt 
			,OLD.otherthan_auto_premium_1_amt 
			,OLD.otherthan_auto_premium_2_amt 
			,OLD.aggregate_other_than_auto_premium_1_amt 
			,OLD.aggregate_other_than_auto_premium_2_amt 
			,OLD.pip_no_fault_symbol_1_cd 
			,OLD.pip_no_fault_symbol_2_cd 
			,OLD.pip_no_fault_symbol_3_cd 
			,OLD.pip_no_fault_deductible_amt 
			,OLD.pip_no_fault_limit 
			,OLD.pip_no_fault_premium_amt 
			,OLD.apip_symbol_1_cd 
			,OLD.apip_symbol_2_cd 
			,OLD.apip_symbol_3_cd 
			,OLD.apip_limit 
			,OLD.apip_deductible_amt 
			,OLD.apip_premium_amt 
			,OLD.medical_payments_symbol_1_cd 
			,OLD.medical_payments_symbol_2_cd 
			,OLD.medical_payments_symbol_3_cd 
			,OLD.medical_payments_limit 
			,OLD.medical_payments_auto_ind 
			,OLD.medical_payments_premises_operations_ind 
			,OLD.medical_payments_deductible_amt 
			,OLD.medical_payments_premium_1_amt 
			,OLD.medical_payments_premium_2_amt 
			,OLD.uninsured_motorist_symbol_1_cd 
			,OLD.uninsured_motorist_symbol_2_cd 
			,OLD.uninsured_motorist_symbol_3_cd 
			,OLD.uninsured_motorist_liability_bi_limit 
			,OLD.uninsured_motorist_liability_csl_limit 
			,OLD.uninsured_motorist_liability_pd_limit 
			,OLD.uninsured_motorist_deductible_amt 
			,OLD.uninsured_motorist_premium_1_amt 
			,OLD.uninsured_motorist_premium_2_amt 
			,OLD.underinsured_motorist_symbol_1_cd 
			,OLD.underinsured_motorist_symbol_2_cd 
			,OLD.underinsured_motorist_symbol_3_cd 
			,OLD.underinsured_motoist_per_person_limit 
			,OLD.underinsured_motoist_eacj_accident_limit 
			,OLD.underinsured_motoist_pdt_limit 
			,OLD.underinsured_motorist_deductible_amt 
			,OLD.underinsured_motorist_premium_1_amt 
			,OLD.underinsured_motorist_premium_2_amt 
			,OLD.off_dt 
			,OLD.comprehensive_cov_ind 
			,OLD.specified_perils_cov_ind 
			,OLD.comprehensive_symbol_1_cd 
			,OLD.comprehensive_symbol_2_cd 
			,OLD.comprehensive_symbol_3_cd 
			,OLD.comprehensive_symbol_4_cd 
			,OLD.physical_damage_collision_symbol_1_cd 
			,OLD.physical_damage_collision_symbol_2_cd 
			,OLD.physical_damage_collision_symbol_3_cd 
			,OLD.physical_damage_collision_symbol_4_cd 
			,OLD.physical_damage_collision_limit 
			,OLD.physical_damage_collision_deductible_amt 
			,OLD.physical_damage_collision_premium_amt 
			,OLD.gargage_keepers_legal_liability_ind 
			,OLD.garagae_keepers_direct_basis_ind 
			,OLD.gargage_keepers_primary_ind 
			,OLD.gargage_keepers_excess_ind 
			,OLD.garagekeeps_other_than_collision_comprehensive_ind 
			,OLD.garagekeeps_other_than_collision_specified_perils_ind 
			,OLD.garagekeeps_other_than_collision_symbol_cd 
			,OLD.garagekeeps_collision_symbol_cd 
			,OLD.towing_labor_symbol_1_cd 
			,OLD.towing_labor_symbol_2_cd 
			,OLD.towing_labor_symbol_3_cd 
			,OLD.towing_labor_symbol_4_cd 
			,OLD.towing_labor_limit 
			,OLD.towing_labor_deductible_amt 
			,OLD.towing_labor_premium_amt 
			,OLD.combined_physical_damage_symbol_1_cd 
			,OLD.combined_physical_damage_symbol_2_cd 
			,OLD.combined_physical_damage_symbol_3_cd 
			,OLD.combined_phyiscal_damage_symbol_4_cd 
			,OLD.combined_phyisical_damage_limit 
			,OLD.combined_phyisical_damage_deductible_amt 
			,OLD.combined_phyisical_damage_premium_amt 
			,OLD.reporting_types 
			,OLD.physical_damage_reporting_period_cd 
			,OLD.non_reporting_ind 
			,OLD.temporary_location_limit 
			,OLD.transit_limit 
			,OLD.total_premium 
			,'D';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_gd_coverages_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_gd_coverages_d() TO rl_sagitta_x;
GO 
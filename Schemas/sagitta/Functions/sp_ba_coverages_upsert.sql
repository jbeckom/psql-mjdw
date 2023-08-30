CREATE OR REPLACE FUNCTION sagitta.sp_ba_coverages_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE rc int;

BEGIN 
	INSERT INTO sagitta.ba_coverages(
		 sagitem 
		,audit_staff_cd 
		,audit_entry_dt 
		,audit_time 
		,audit_cd 
		,audit_history_record_number 
		,audit_program 
		,audit_effective_dt 
		,audit_change_agency_id 
		,obsolete_tag_1 
		,obsolete_tag_2 
		,count_hired_info 
		,count_doc_info 						
		,count_comml_audit_addl_cov_info 
		,total_premium 
		,policy_agency_id 
		,liability_symbol_1_cd 
		,liability_symbol_2_cd 
		,liability_symbol_3_cd 
		,liability_symbol_4_cd 
		,liability_symbol_5_cd 
		,liability_1_limit 
		,liability_2_limit 
		,liability_deductible_amt 
		,liability_premium_amt 
		,property_damage_limit 
		,property_damage_deductible_amt 
		,property_damage_premium_amt 
		,pip_no_fault_symbol_1_cd 
		,pip_no_fault_symbol_2_cd 
		,pip_no_fault_symbol_3_cd 
		,pip_limit 
		,pip_deductible_amt 
		,pip_premium_amt 
		,apip_symbol_1_cd 
		,apip_symbol_2_cd 
		,apip_limit 
		,apip_deductible_amt 
		,apip_premium_amt 
		,auto_medical_payments_symbol_1_cd 
		,auto_medical_payments_symbol_2_cd 
		,auto_medical_payments_symbol_3_cd 
		,auto_medical_payments_deductible_amt 
		,auto_medical_payments_premium_amt 
		,uninsured_motorist_symbol_1_cd 
		,uninsured_motorist_symbol_2_cd 
		,uninsured_motorist_symbol_3_cd 
		,underinsured_motorist_1_limit 
		,underinsured_motorist_2_limit 
		,underinsured_motorist_deductible_amt 
		,underinsured_pd_limit 
		,underinsured_deductible_pd_limit 
		,underinsured_premium_pd_amt 
		,towing_and_labor_symbol_1_cd 
		,towing_and_labor_symbol_2_cd 
		,towing_and_labor_symbol_3_cd 
		,towing_and_labor_limit 
		,towing_and_labor_deductible_amt 
		,towing_and_labor_premium_amt 
		,comprehensive_symbol_1_cd 
		,comprehensive_symbol_2_cd 
		,comprehensive_symbol_3_cd 
		,comprehensive_symbol_4_cd 
		,comprehensive_limit 
		,comprehensive_deductible_amt 
		,comprehensive_premium_amt 
		,specified_perils_symbol_1_cd 
		,specified_perils_symbol_2_cd 
		,specified_perils_symbol_3_cd 
		,specified_perils_symbol_4_cd 
		,specified_perils_limit 
		,specified_perils_deductible_amt 
		,specified_perils_premium_amt 
		,collision_symbol_1_cd 
		,collision_symbol_2_cd 
		,collision_symbol_3_cd 
		,collision_symbol_4_cd 
		,collision_limit 
		,collision_deductible_amt 
		,collision_premium_amt 
		,combined_phsycial_damage_symbol_1_cd 
		,combined_phsycial_damage_symbol_2_cd 
		,combined_phsycial_damage_symbol_3_cd 
		,combined_phsycial_damage_symbol_4_cd 
		,combined_physical_damage_limit 
		,combined_physical_damage_deductible_amt 
		,combined_physical_damage_premium_amt 
		,off_dt 
		,hired_physical_damage_cost_amt 
	)
	SELECT 	 sagitem 
			,audit_staff_cd 
			,audit_entry_dt 
			,audit_time 
			,audit_cd 
			,audit_history_record_number 
			,audit_program 
			,audit_effective_dt 
			,audit_change_agency_id 
			,obsolete_tag_1 
			,obsolete_tag_2 
			,count_hired_info 
			,count_doc_info 						
			,count_comml_audit_addl_cov_info 
			,total_premium 
			,policy_agency_id 
			,liability_symbol_1_cd 
			,liability_symbol_2_cd 
			,liability_symbol_3_cd 
			,liability_symbol_4_cd 
			,liability_symbol_5_cd 
			,liability_1_limit 
			,liability_2_limit 
			,liability_deductible_amt 
			,liability_premium_amt 
			,property_damage_limit 
			,property_damage_deductible_amt 
			,property_damage_premium_amt 
			,pip_no_fault_symbol_1_cd 
			,pip_no_fault_symbol_2_cd 
			,pip_no_fault_symbol_3_cd 
			,pip_limit 
			,pip_deductible_amt 
			,pip_premium_amt 
			,apip_symbol_1_cd 
			,apip_symbol_2_cd 
			,apip_limit 
			,apip_deductible_amt 
			,apip_premium_amt 
			,auto_medical_payments_symbol_1_cd 
			,auto_medical_payments_symbol_2_cd 
			,auto_medical_payments_symbol_3_cd 
			,auto_medical_payments_deductible_amt 
			,auto_medical_payments_premium_amt 
			,uninsured_motorist_symbol_1_cd 
			,uninsured_motorist_symbol_2_cd 
			,uninsured_motorist_symbol_3_cd 
			,underinsured_motorist_1_limit 
			,underinsured_motorist_2_limit 
			,underinsured_motorist_deductible_amt 
			,underinsured_pd_limit 
			,underinsured_deductible_pd_limit 
			,underinsured_premium_pd_amt 
			,towing_and_labor_symbol_1_cd 
			,towing_and_labor_symbol_2_cd 
			,towing_and_labor_symbol_3_cd 
			,towing_and_labor_limit 
			,towing_and_labor_deductible_amt 
			,towing_and_labor_premium_amt 
			,comprehensive_symbol_1_cd 
			,comprehensive_symbol_2_cd 
			,comprehensive_symbol_3_cd 
			,comprehensive_symbol_4_cd 
			,comprehensive_limit 
			,comprehensive_deductible_amt 
			,comprehensive_premium_amt 
			,specified_perils_symbol_1_cd 
			,specified_perils_symbol_2_cd 
			,specified_perils_symbol_3_cd 
			,specified_perils_symbol_4_cd 
			,specified_perils_limit 
			,specified_perils_deductible_amt 
			,specified_perils_premium_amt 
			,collision_symbol_1_cd 
			,collision_symbol_2_cd 
			,collision_symbol_3_cd 
			,collision_symbol_4_cd 
			,collision_limit 
			,collision_deductible_amt 
			,collision_premium_amt 
			,combined_phsycial_damage_symbol_1_cd 
			,combined_phsycial_damage_symbol_2_cd 
			,combined_phsycial_damage_symbol_3_cd 
			,combined_phsycial_damage_symbol_4_cd 
			,combined_physical_damage_limit 
			,combined_physical_damage_deductible_amt 
			,combined_physical_damage_premium_amt 
			,off_dt 
			,hired_physical_damage_cost_amt 
	FROM 	sagitta.stg_ba_coverages 
	ON CONFLICT (sagitem) DO UPDATE 
	SET 	 audit_staff_cd 							= excluded.audit_staff_cd 
			,audit_entry_dt 							= excluded.audit_entry_dt 
			,audit_time 								= excluded.audit_time 
			,audit_cd 									= excluded.audit_cd 
			,audit_history_record_number 				= excluded.audit_history_record_number 
			,audit_program 								= excluded.audit_program 
			,audit_effective_dt 						= excluded.audit_effective_dt 
			,audit_change_agency_id 					= excluded.audit_change_agency_id 
			,obsolete_tag_1 							= excluded.obsolete_tag_1 
			,obsolete_tag_2 							= excluded.obsolete_tag_2 
			,count_hired_info 							= excluded.count_hired_info 
			,count_doc_info 							= excluded.count_doc_info 
			,count_comml_audit_addl_cov_info 			= excluded.count_comml_audit_addl_cov_info 
			,total_premium 								= excluded.total_premium 
			,policy_agency_id 							= excluded.policy_agency_id 
			,liability_symbol_1_cd 						= excluded.liability_symbol_1_cd 
			,liability_symbol_2_cd 						= excluded.liability_symbol_2_cd 
			,liability_symbol_3_cd 						= excluded.liability_symbol_3_cd 
			,liability_symbol_4_cd 						= excluded.liability_symbol_4_cd 
			,liability_symbol_5_cd 						= excluded.liability_symbol_5_cd 
			,liability_1_limit 							= excluded.liability_1_limit 
			,liability_2_limit 							= excluded.liability_2_limit 
			,liability_deductible_amt 					= excluded.liability_deductible_amt 
			,liability_premium_amt 						= excluded.liability_premium_amt 
			,property_damage_limit 						= excluded.property_damage_limit 
			,property_damage_deductible_amt 			= excluded.property_damage_deductible_amt 
			,property_damage_premium_amt 				= excluded.property_damage_premium_amt 
			,pip_no_fault_symbol_1_cd 					= excluded.pip_no_fault_symbol_1_cd 
			,pip_no_fault_symbol_2_cd 					= excluded.pip_no_fault_symbol_2_cd 
			,pip_no_fault_symbol_3_cd 					= excluded.pip_no_fault_symbol_3_cd 
			,pip_limit 									= excluded.pip_limit 
			,pip_deductible_amt 						= excluded.pip_deductible_amt 
			,pip_premium_amt 							= excluded.pip_premium_amt 
			,apip_symbol_1_cd 							= excluded.apip_symbol_1_cd 
			,apip_symbol_2_cd 							= excluded.apip_symbol_2_cd 
			,apip_limit 								= excluded.apip_limit 
			,apip_deductible_amt 						= excluded.apip_deductible_amt 
			,apip_premium_amt 							= excluded.apip_premium_amt 
			,auto_medical_payments_symbol_1_cd 			= excluded.auto_medical_payments_symbol_1_cd 
			,auto_medical_payments_symbol_2_cd 			= excluded.auto_medical_payments_symbol_2_cd 
			,auto_medical_payments_symbol_3_cd 			= excluded.auto_medical_payments_symbol_3_cd 
			,auto_medical_payments_deductible_amt 		= excluded.auto_medical_payments_deductible_amt 
			,auto_medical_payments_premium_amt 			= excluded.auto_medical_payments_premium_amt 
			,uninsured_motorist_symbol_1_cd 			= excluded.uninsured_motorist_symbol_1_cd 
			,uninsured_motorist_symbol_2_cd 			= excluded.uninsured_motorist_symbol_2_cd 
			,uninsured_motorist_symbol_3_cd 			= excluded.uninsured_motorist_symbol_3_cd 
			,underinsured_motorist_1_limit 				= excluded.underinsured_motorist_1_limit 
			,underinsured_motorist_2_limit 				= excluded.underinsured_motorist_2_limit 
			,underinsured_motorist_deductible_amt 		= excluded.underinsured_motorist_deductible_amt 
			,underinsured_pd_limit 						= excluded.underinsured_pd_limit 
			,underinsured_deductible_pd_limit 			= excluded.underinsured_deductible_pd_limit 
			,underinsured_premium_pd_amt 				= excluded.underinsured_premium_pd_amt 
			,towing_and_labor_symbol_1_cd 				= excluded.towing_and_labor_symbol_1_cd 
			,towing_and_labor_symbol_2_cd 				= excluded.towing_and_labor_symbol_2_cd 
			,towing_and_labor_symbol_3_cd 				= excluded.towing_and_labor_symbol_3_cd 
			,towing_and_labor_limit 					= excluded.towing_and_labor_limit 
			,towing_and_labor_deductible_amt 			= excluded.towing_and_labor_deductible_amt 
			,towing_and_labor_premium_amt 				= excluded.towing_and_labor_premium_amt 
			,comprehensive_symbol_1_cd 					= excluded.comprehensive_symbol_1_cd 
			,comprehensive_symbol_2_cd 					= excluded.comprehensive_symbol_2_cd 
			,comprehensive_symbol_3_cd 					= excluded.comprehensive_symbol_3_cd 
			,comprehensive_symbol_4_cd 					= excluded.comprehensive_symbol_4_cd 
			,comprehensive_limit 						= excluded.comprehensive_limit 
			,comprehensive_deductible_amt 				= excluded.comprehensive_deductible_amt 
			,comprehensive_premium_amt 					= excluded.comprehensive_premium_amt 
			,specified_perils_symbol_1_cd 				= excluded.specified_perils_symbol_1_cd 
			,specified_perils_symbol_2_cd 				= excluded.specified_perils_symbol_2_cd 
			,specified_perils_symbol_3_cd 				= excluded.specified_perils_symbol_3_cd 
			,specified_perils_symbol_4_cd 				= excluded.specified_perils_symbol_4_cd 
			,specified_perils_limit 					= excluded.specified_perils_limit 
			,specified_perils_deductible_amt 			= excluded.specified_perils_deductible_amt 
			,specified_perils_premium_amt 				= excluded.specified_perils_premium_amt 
			,collision_symbol_1_cd 						= excluded.collision_symbol_1_cd 
			,collision_symbol_2_cd 						= excluded.collision_symbol_2_cd 
			,collision_symbol_3_cd 						= excluded.collision_symbol_3_cd 
			,collision_symbol_4_cd 						= excluded.collision_symbol_4_cd 
			,collision_limit 							= excluded.collision_limit 
			,collision_deductible_amt 					= excluded.collision_deductible_amt 
			,collision_premium_amt 						= excluded.collision_premium_amt 
			,combined_phsycial_damage_symbol_1_cd 		= excluded.combined_phsycial_damage_symbol_1_cd 
			,combined_phsycial_damage_symbol_2_cd 		= excluded.combined_phsycial_damage_symbol_2_cd 
			,combined_phsycial_damage_symbol_3_cd 		= excluded.combined_phsycial_damage_symbol_3_cd 
			,combined_phsycial_damage_symbol_4_cd 		= excluded.combined_phsycial_damage_symbol_4_cd 
			,combined_physical_damage_limit 			= excluded.combined_physical_damage_limit 
			,combined_physical_damage_deductible_amt 	= excluded.combined_physical_damage_deductible_amt 
			,combined_physical_damage_premium_amt 		= excluded.combined_physical_damage_premium_amt 
			,off_dt 									= excluded.off_dt 
			,hired_physical_damage_cost_amt 			= excluded.hired_physical_damage_cost_amt 
	WHERE 	(ba_coverages.audit_staff_cd,ba_coverages.audit_entry_dt,ba_coverages.audit_time,ba_coverages.audit_cd,ba_coverages.audit_history_record_number,ba_coverages.audit_program,ba_coverages.audit_effective_dt,ba_coverages.audit_change_agency_id,ba_coverages.obsolete_tag_1,ba_coverages.obsolete_tag_2,ba_coverages.count_hired_info,ba_coverages.count_doc_info 					,ba_coverages.count_comml_audit_addl_cov_info,ba_coverages.total_premium,ba_coverages.policy_agency_id,ba_coverages.liability_symbol_1_cd,ba_coverages.liability_symbol_2_cd,ba_coverages.liability_symbol_3_cd,ba_coverages.liability_symbol_4_cd,ba_coverages.liability_symbol_5_cd,ba_coverages.liability_1_limit,ba_coverages.liability_2_limit,ba_coverages.liability_deductible_amt,ba_coverages.liability_premium_amt,ba_coverages.property_damage_limit,ba_coverages.property_damage_deductible_amt,ba_coverages.property_damage_premium_amt,ba_coverages.pip_no_fault_symbol_1_cd,ba_coverages.pip_no_fault_symbol_2_cd,ba_coverages.pip_no_fault_symbol_3_cd,ba_coverages.pip_limit,ba_coverages.pip_deductible_amt,ba_coverages.pip_premium_amt,ba_coverages.apip_symbol_1_cd,ba_coverages.apip_symbol_2_cd,ba_coverages.apip_limit,ba_coverages.apip_deductible_amt,ba_coverages.apip_premium_amt,ba_coverages.auto_medical_payments_symbol_1_cd,ba_coverages.auto_medical_payments_symbol_2_cd,ba_coverages.auto_medical_payments_symbol_3_cd,ba_coverages.auto_medical_payments_deductible_amt,ba_coverages.auto_medical_payments_premium_amt,ba_coverages.uninsured_motorist_symbol_1_cd,ba_coverages.uninsured_motorist_symbol_2_cd,ba_coverages.uninsured_motorist_symbol_3_cd,ba_coverages.underinsured_motorist_1_limit,ba_coverages.underinsured_motorist_2_limit,ba_coverages.underinsured_motorist_deductible_amt,ba_coverages.underinsured_pd_limit,ba_coverages.underinsured_deductible_pd_limit,ba_coverages.underinsured_premium_pd_amt,ba_coverages.towing_and_labor_symbol_1_cd,ba_coverages.towing_and_labor_symbol_2_cd,ba_coverages.towing_and_labor_symbol_3_cd,ba_coverages.towing_and_labor_limit,ba_coverages.towing_and_labor_deductible_amt,ba_coverages.towing_and_labor_premium_amt,ba_coverages.comprehensive_symbol_1_cd,ba_coverages.comprehensive_symbol_2_cd,ba_coverages.comprehensive_symbol_3_cd,ba_coverages.comprehensive_symbol_4_cd,ba_coverages.comprehensive_limit,ba_coverages.comprehensive_deductible_amt,ba_coverages.comprehensive_premium_amt,ba_coverages.specified_perils_symbol_1_cd,ba_coverages.specified_perils_symbol_2_cd,ba_coverages.specified_perils_symbol_3_cd,ba_coverages.specified_perils_symbol_4_cd,ba_coverages.specified_perils_limit,ba_coverages.specified_perils_deductible_amt,ba_coverages.specified_perils_premium_amt,ba_coverages.collision_symbol_1_cd,ba_coverages.collision_symbol_2_cd,ba_coverages.collision_symbol_3_cd,ba_coverages.collision_symbol_4_cd,ba_coverages.collision_limit,ba_coverages.collision_deductible_amt,ba_coverages.collision_premium_amt,ba_coverages.combined_phsycial_damage_symbol_1_cd,ba_coverages.combined_phsycial_damage_symbol_2_cd,ba_coverages.combined_phsycial_damage_symbol_3_cd,ba_coverages.combined_phsycial_damage_symbol_4_cd,ba_coverages.combined_physical_damage_limit,ba_coverages.combined_physical_damage_deductible_amt,ba_coverages.combined_physical_damage_premium_amt,ba_coverages.off_dt,ba_coverages.hired_physical_damage_cost_amt) 
		IS DISTINCT FROM 	(excluded.audit_staff_cd,excluded.audit_entry_dt,excluded.audit_time,excluded.audit_cd,excluded.audit_history_record_number,excluded.audit_program,excluded.audit_effective_dt,excluded.audit_change_agency_id,excluded.obsolete_tag_1,excluded.obsolete_tag_2,excluded.count_hired_info,excluded.count_doc_info 					,excluded.count_comml_audit_addl_cov_info,excluded.total_premium,excluded.policy_agency_id,excluded.liability_symbol_1_cd,excluded.liability_symbol_2_cd,excluded.liability_symbol_3_cd,excluded.liability_symbol_4_cd,excluded.liability_symbol_5_cd,excluded.liability_1_limit,excluded.liability_2_limit,excluded.liability_deductible_amt,excluded.liability_premium_amt,excluded.property_damage_limit,excluded.property_damage_deductible_amt,excluded.property_damage_premium_amt,excluded.pip_no_fault_symbol_1_cd,excluded.pip_no_fault_symbol_2_cd,excluded.pip_no_fault_symbol_3_cd,excluded.pip_limit,excluded.pip_deductible_amt,excluded.pip_premium_amt,excluded.apip_symbol_1_cd,excluded.apip_symbol_2_cd,excluded.apip_limit,excluded.apip_deductible_amt,excluded.apip_premium_amt,excluded.auto_medical_payments_symbol_1_cd,excluded.auto_medical_payments_symbol_2_cd,excluded.auto_medical_payments_symbol_3_cd,excluded.auto_medical_payments_deductible_amt,excluded.auto_medical_payments_premium_amt,excluded.uninsured_motorist_symbol_1_cd,excluded.uninsured_motorist_symbol_2_cd,excluded.uninsured_motorist_symbol_3_cd,excluded.underinsured_motorist_1_limit,excluded.underinsured_motorist_2_limit,excluded.underinsured_motorist_deductible_amt,excluded.underinsured_pd_limit,excluded.underinsured_deductible_pd_limit,excluded.underinsured_premium_pd_amt,excluded.towing_and_labor_symbol_1_cd,excluded.towing_and_labor_symbol_2_cd,excluded.towing_and_labor_symbol_3_cd,excluded.towing_and_labor_limit,excluded.towing_and_labor_deductible_amt,excluded.towing_and_labor_premium_amt,excluded.comprehensive_symbol_1_cd,excluded.comprehensive_symbol_2_cd,excluded.comprehensive_symbol_3_cd,excluded.comprehensive_symbol_4_cd,excluded.comprehensive_limit,excluded.comprehensive_deductible_amt,excluded.comprehensive_premium_amt,excluded.specified_perils_symbol_1_cd,excluded.specified_perils_symbol_2_cd,excluded.specified_perils_symbol_3_cd,excluded.specified_perils_symbol_4_cd,excluded.specified_perils_limit,excluded.specified_perils_deductible_amt,excluded.specified_perils_premium_amt,excluded.collision_symbol_1_cd,excluded.collision_symbol_2_cd,excluded.collision_symbol_3_cd,excluded.collision_symbol_4_cd,excluded.collision_limit,excluded.collision_deductible_amt,excluded.collision_premium_amt,excluded.combined_phsycial_damage_symbol_1_cd,excluded.combined_phsycial_damage_symbol_2_cd,excluded.combined_phsycial_damage_symbol_3_cd,excluded.combined_phsycial_damage_symbol_4_cd,excluded.combined_physical_damage_limit,excluded.combined_physical_damage_deductible_amt,excluded.combined_physical_damage_premium_amt,excluded.off_dt,excluded.hired_physical_damage_cost_amt);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_ba_coverages_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_ba_coverages_upsert() TO rl_sagitta_x;
GO 

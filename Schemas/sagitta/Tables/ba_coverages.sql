CREATE TABLE sagitta.ba_coverages (
	 sagitem 									TEXT 		NOT NULL 
	,audit_staff_cd 							TEXT 		NULL 
	,audit_entry_dt 							int 		NULL 
	,audit_time 								int 		NULL 
	,audit_cd 									TEXT 		NULL 
	,audit_history_record_number 				TEXT 		NULL 
	,audit_program 								TEXT 		NULL 
	,audit_effective_dt 						TEXT 		NULL 
	,audit_change_agency_id 					TEXT 		NULL 
	,obsolete_tag_1 							TEXT 		NULL 
	,obsolete_tag_2 							TEXT 		NULL 
	,count_hired_info 							TEXT 		NULL 
	,count_doc_info 							TEXT 		NULL 
	,count_comml_audit_addl_cov_info 			TEXT 		NULL 
	,total_premium 								TEXT 		NULL 
	,policy_agency_id 							TEXT 		NULL 
	,liability_symbol_1_cd 						TEXT 		NULL 
	,liability_symbol_2_cd 						TEXT 		NULL 
	,liability_symbol_3_cd 						TEXT 		NULL 
	,liability_symbol_4_cd 						TEXT 		NULL 
	,liability_symbol_5_cd 						TEXT 		NULL 
	,liability_1_limit 							TEXT 		NULL 
	,liability_2_limit 							TEXT 		NULL 
	,liability_deductible_amt 					TEXT 		NULL 
	,liability_premium_amt 						TEXT 		NULL 
	,property_damage_limit 						TEXT 		NULL 
	,property_damage_deductible_amt 			TEXT 		NULL 
	,property_damage_premium_amt 				TEXT 		NULL 
	,pip_no_fault_symbol_1_cd 					TEXT 		NULL 
	,pip_no_fault_symbol_2_cd 					TEXT 		NULL 
	,pip_no_fault_symbol_3_cd 					TEXT 		NULL 
	,pip_limit 									TEXT 		NULL 
	,pip_deductible_amt 						TEXT 		NULL 
	,pip_premium_amt 							TEXT 		NULL 
	,apip_symbol_1_cd 							TEXT 		NULL 
	,apip_symbol_2_cd 							TEXT 		NULL 
	,apip_limit 								TEXT 		NULL 
	,apip_deductible_amt 						TEXT 		NULL 
	,apip_premium_amt 							TEXT 		NULL 
	,auto_medical_payments_symbol_1_cd 			TEXT 		NULL 
	,auto_medical_payments_symbol_2_cd 			TEXT 		NULL 
	,auto_medical_payments_symbol_3_cd 			TEXT 		NULL 
	,auto_medical_payments_deductible_amt 		TEXT 		NULL 
	,auto_medical_payments_premium_amt 			TEXT 		NULL 
	,uninsured_motorist_symbol_1_cd 			TEXT 		NULL 
	,uninsured_motorist_symbol_2_cd 			TEXT 		NULL 
	,uninsured_motorist_symbol_3_cd 			TEXT 		NULL 
	,underinsured_motorist_1_limit 				TEXT 		NULL 
	,underinsured_motorist_2_limit 				TEXT 		NULL 
	,underinsured_motorist_deductible_amt 		TEXT 		NULL 
	,underinsured_pd_limit 						TEXT 		NULL 
	,underinsured_deductible_pd_limit 			TEXT 		NULL 
	,underinsured_premium_pd_amt 				TEXT 		NULL 
	,towing_and_labor_symbol_1_cd 				TEXT 		NULL 
	,towing_and_labor_symbol_2_cd 				TEXT 		NULL 
	,towing_and_labor_symbol_3_cd 				TEXT 		NULL 
	,towing_and_labor_limit 					TEXT 		NULL 
	,towing_and_labor_deductible_amt 			TEXT 		NULL 
	,towing_and_labor_premium_amt 				TEXT 		NULL 
	,comprehensive_symbol_1_cd 					TEXT 		NULL 
	,comprehensive_symbol_2_cd 					TEXT 		NULL 
	,comprehensive_symbol_3_cd 					TEXT 		NULL 
	,comprehensive_symbol_4_cd 					TEXT 		NULL 
	,comprehensive_limit 						TEXT 		NULL 
	,comprehensive_deductible_amt 				TEXT 		NULL 
	,comprehensive_premium_amt 					TEXT 		NULL 
	,specified_perils_symbol_1_cd 				TEXT 		NULL 
	,specified_perils_symbol_2_cd 				TEXT 		NULL 
	,specified_perils_symbol_3_cd 				TEXT 		NULL 
	,specified_perils_symbol_4_cd 				TEXT 		NULL 
	,specified_perils_limit 					TEXT 		NULL 
	,specified_perils_deductible_amt 			TEXT 		NULL 
	,specified_perils_premium_amt 				TEXT 		NULL 
	,collision_symbol_1_cd 						TEXT 		NULL 
	,collision_symbol_2_cd 						TEXT 		NULL 
	,collision_symbol_3_cd 						TEXT 		NULL 
	,collision_symbol_4_cd 						TEXT 		NULL 
	,collision_limit 							TEXT 		NULL 
	,collision_deductible_amt 					TEXT 		NULL 
	,collision_premium_amt 						TEXT 		NULL 
	,combined_phsycial_damage_symbol_1_cd 		TEXT 		NULL 
	,combined_phsycial_damage_symbol_2_cd 		TEXT 		NULL 
	,combined_phsycial_damage_symbol_3_cd 		TEXT 		NULL 
	,combined_phsycial_damage_symbol_4_cd 		TEXT 		NULL 
	,combined_physical_damage_limit 			TEXT 		NULL 
	,combined_physical_damage_deductible_amt 	TEXT 		NULL 
	,combined_physical_damage_premium_amt 		TEXT 		NULL 
	,off_dt 									TEXT 		NULL 
	,hired_physical_damage_cost_amt 			TEXT 		NULL 
	,CONSTRAINT ba_coverages_pkey PRIMARY KEY (sagitem)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.ba_coverages OWNER TO mj_admin;
GO 

GRANT SELECT ON sagitta.ba_coverages TO rl_sagitta_r;
GO 

GRANT INSERT ON sagitta.ba_coverages TO rl_sagitta_a;
GO 

GRANT UPDATE ON sagitta.ba_coverages TO rl_sagitta_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON sagitta.ba_coverages FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_ba_coverages_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON sagitta.ba_coverages FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_ba_coverages_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON sagitta.ba_coverages FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION sagitta.tr_audit_ba_coverages_u();
GO 
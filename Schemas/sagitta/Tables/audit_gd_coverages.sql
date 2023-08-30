CREATE TABLE sagitta.audit_gd_coverages (
	 sagitem 															int 			NOT NULL 
	,old_audit_staff_cd                                                 TEXT            NULL 
	,new_audit_staff_cd                                                 TEXT            NULL
	,old_audit_entry_dt                                                 int             NULL 
	,new_audit_entry_dt                                                 int             NULL
	,old_audit_time                                                     int             NULL 
	,new_audit_time                                                     int             NULL
	,old_audit_cd                                                       TEXT            NULL 
	,new_audit_cd                                                       TEXT            NULL
	,old_audit_history_record_number                                    TEXT            NULL 
	,new_audit_history_record_number                                    TEXT            NULL
	,old_audit_program                                                  TEXT            NULL 
	,new_audit_program                                                  TEXT            NULL
	,old_audit_effective_dt                                             TEXT            NULL 
	,new_audit_effective_dt                                             TEXT            NULL
	,old_audit_change_agency_id                                         TEXT            NULL 
	,new_audit_change_agency_id                                         TEXT            NULL
	,old_policy_seq_agency_id                                           TEXT            NULL 
	,new_policy_seq_agency_id                                           TEXT            NULL
	,old_liability_symbol_1_cd                                          TEXT            NULL 
	,new_liability_symbol_1_cd                                          TEXT            NULL
	,old_liability_symbol_2_cd                                          TEXT            NULL 
	,new_liability_symbol_2_cd                                          TEXT            NULL
	,old_liability_symbol_3_cd                                          TEXT            NULL 
	,new_liability_symbol_3_cd                                          TEXT            NULL
	,old_liability_symbol_4_cd                                          TEXT            NULL 
	,new_liability_symbol_4_cd                                          TEXT            NULL
	,old_liability_symbol_5_cd                                          TEXT            NULL 
	,new_liability_symbol_5_cd                                          TEXT            NULL
	,old_auto_only_liability_bi_limit                                   TEXT            NULL 
	,new_auto_only_liability_bi_limit                                   TEXT            NULL
	,old_auto_only_liability_csl_limit                                  TEXT            NULL 
	,new_auto_only_liability_csl_limit                                  TEXT            NULL
	,old_auto_only_liability_pd_limit                                   TEXT            NULL 
	,new_auto_only_liability_pd_limit                                   TEXT            NULL
	,old_other_than_auto_only_liability_bi_limit                        TEXT            NULL 
	,new_other_than_auto_only_liability_bi_limit                        TEXT            NULL
	,old_other_than_auto_only_liability_limit                           TEXT            NULL 
	,new_other_than_auto_only_liability_limit                           TEXT            NULL
	,old_other_than_auto_only_liability_pd_limit                        TEXT            NULL 
	,new_other_than_auto_only_liability_pd_limit                        TEXT            NULL
	,old_aggregate_other_than_auto_only_liability_limit                 TEXT            NULL 
	,new_aggregate_other_than_auto_only_liability_limit                 TEXT            NULL
	,old_liability_deductible_amt                                       TEXT            NULL 
	,new_liability_deductible_amt                                       TEXT            NULL
	,old_limited_liability_ind                                          TEXT            NULL 
	,new_limited_liability_ind                                          TEXT            NULL
	,old_unlimited_liability_ind                                        TEXT            NULL 
	,new_unlimited_liability_ind                                        TEXT            NULL
	,old_auto_only_premium_1_amt                                        TEXT            NULL 
	,new_auto_only_premium_1_amt                                        TEXT            NULL
	,old_auto_only_premium_2_amt                                        TEXT            NULL 
	,new_auto_only_premium_2_amt                                        TEXT            NULL
	,old_otherthan_auto_premium_1_amt                                   TEXT            NULL 
	,new_otherthan_auto_premium_1_amt                                   TEXT            NULL
	,old_otherthan_auto_premium_2_amt                                   TEXT            NULL 
	,new_otherthan_auto_premium_2_amt                                   TEXT            NULL
	,old_aggregate_other_than_auto_premium_1_amt                        TEXT            NULL 
	,new_aggregate_other_than_auto_premium_1_amt                        TEXT            NULL
	,old_aggregate_other_than_auto_premium_2_amt                        TEXT            NULL 
	,new_aggregate_other_than_auto_premium_2_amt                        TEXT            NULL
	,old_pip_no_fault_symbol_1_cd                                       TEXT            NULL 
	,new_pip_no_fault_symbol_1_cd                                       TEXT            NULL
	,old_pip_no_fault_symbol_2_cd                                       TEXT            NULL 
	,new_pip_no_fault_symbol_2_cd                                       TEXT            NULL
	,old_pip_no_fault_symbol_3_cd                                       TEXT            NULL 
	,new_pip_no_fault_symbol_3_cd                                       TEXT            NULL
	,old_pip_no_fault_deductible_amt                                    TEXT            NULL 
	,new_pip_no_fault_deductible_amt                                    TEXT            NULL
	,old_pip_no_fault_limit                                             TEXT            NULL 
	,new_pip_no_fault_limit                                             TEXT            NULL
	,old_pip_no_fault_premium_amt                                       TEXT            NULL 
	,new_pip_no_fault_premium_amt                                       TEXT            NULL
	,old_apip_symbol_1_cd                                               TEXT            NULL 
	,new_apip_symbol_1_cd                                               TEXT            NULL
	,old_apip_symbol_2_cd                                               TEXT            NULL 
	,new_apip_symbol_2_cd                                               TEXT            NULL
	,old_apip_symbol_3_cd                                               TEXT            NULL 
	,new_apip_symbol_3_cd                                               TEXT            NULL
	,old_apip_limit                                                     TEXT            NULL 
	,new_apip_limit                                                     TEXT            NULL
	,old_apip_deductible_amt                                            TEXT            NULL 
	,new_apip_deductible_amt                                            TEXT            NULL
	,old_apip_premium_amt                                               TEXT            NULL 
	,new_apip_premium_amt                                               TEXT            NULL
	,old_medical_payments_symbol_1_cd                                   TEXT            NULL 
	,new_medical_payments_symbol_1_cd                                   TEXT            NULL
	,old_medical_payments_symbol_2_cd                                   TEXT            NULL 
	,new_medical_payments_symbol_2_cd                                   TEXT            NULL
	,old_medical_payments_symbol_3_cd                                   TEXT            NULL 
	,new_medical_payments_symbol_3_cd                                   TEXT            NULL
	,old_medical_payments_limit                                         TEXT            NULL 
	,new_medical_payments_limit                                         TEXT            NULL
	,old_medical_payments_auto_ind                                      TEXT            NULL 
	,new_medical_payments_auto_ind                                      TEXT            NULL
	,old_medical_payments_premises_operations_ind                       TEXT            NULL 
	,new_medical_payments_premises_operations_ind                       TEXT            NULL
	,old_medical_payments_deductible_amt                                TEXT            NULL 
	,new_medical_payments_deductible_amt                                TEXT            NULL
	,old_medical_payments_premium_1_amt                                 TEXT            NULL 
	,new_medical_payments_premium_1_amt                                 TEXT            NULL
	,old_medical_payments_premium_2_amt                                 TEXT            NULL 
	,new_medical_payments_premium_2_amt                                 TEXT            NULL
	,old_uninsured_motorist_symbol_1_cd                                 TEXT            NULL 
	,new_uninsured_motorist_symbol_1_cd                                 TEXT            NULL
	,old_uninsured_motorist_symbol_2_cd                                 TEXT            NULL 
	,new_uninsured_motorist_symbol_2_cd                                 TEXT            NULL
	,old_uninsured_motorist_symbol_3_cd                                 TEXT            NULL 
	,new_uninsured_motorist_symbol_3_cd                                 TEXT            NULL
	,old_uninsured_motorist_liability_bi_limit                          TEXT            NULL 
	,new_uninsured_motorist_liability_bi_limit                          TEXT            NULL
	,old_uninsured_motorist_liability_csl_limit                         TEXT            NULL 
	,new_uninsured_motorist_liability_csl_limit                         TEXT            NULL
	,old_uninsured_motorist_liability_pd_limit                          TEXT            NULL 
	,new_uninsured_motorist_liability_pd_limit                          TEXT            NULL
	,old_uninsured_motorist_deductible_amt                              TEXT            NULL 
	,new_uninsured_motorist_deductible_amt                              TEXT            NULL
	,old_uninsured_motorist_premium_1_amt                               TEXT            NULL 
	,new_uninsured_motorist_premium_1_amt                               TEXT            NULL
	,old_uninsured_motorist_premium_2_amt                               TEXT            NULL 
	,new_uninsured_motorist_premium_2_amt                               TEXT            NULL
	,old_underinsured_motorist_symbol_1_cd                              TEXT            NULL 
	,new_underinsured_motorist_symbol_1_cd                              TEXT            NULL
	,old_underinsured_motorist_symbol_2_cd                              TEXT            NULL 
	,new_underinsured_motorist_symbol_2_cd                              TEXT            NULL
	,old_underinsured_motorist_symbol_3_cd                              TEXT            NULL 
	,new_underinsured_motorist_symbol_3_cd                              TEXT            NULL
	,old_underinsured_motoist_per_person_limit                          TEXT            NULL 
	,new_underinsured_motoist_per_person_limit                          TEXT            NULL
	,old_underinsured_motoist_eacj_accident_limit                       TEXT            NULL 
	,new_underinsured_motoist_eacj_accident_limit                       TEXT            NULL
	,old_underinsured_motoist_pdt_limit                                 TEXT            NULL 
	,new_underinsured_motoist_pdt_limit                                 TEXT            NULL
	,old_underinsured_motorist_deductible_amt                           TEXT            NULL 
	,new_underinsured_motorist_deductible_amt                           TEXT            NULL
	,old_underinsured_motorist_premium_1_amt                            TEXT            NULL 
	,new_underinsured_motorist_premium_1_amt                            TEXT            NULL
	,old_underinsured_motorist_premium_2_amt                            TEXT            NULL 
	,new_underinsured_motorist_premium_2_amt                            TEXT            NULL
	,old_off_dt                                                         TEXT            NULL 
	,new_off_dt                                                         TEXT            NULL
	,old_comprehensive_cov_ind                                          TEXT            NULL 
	,new_comprehensive_cov_ind                                          TEXT            NULL
	,old_specified_perils_cov_ind                                       TEXT            NULL 
	,new_specified_perils_cov_ind                                       TEXT            NULL
	,old_comprehensive_symbol_1_cd                                      TEXT            NULL 
	,new_comprehensive_symbol_1_cd                                      TEXT            NULL
	,old_comprehensive_symbol_2_cd                                      TEXT            NULL 
	,new_comprehensive_symbol_2_cd                                      TEXT            NULL
	,old_comprehensive_symbol_3_cd                                      TEXT            NULL 
	,new_comprehensive_symbol_3_cd                                      TEXT            NULL
	,old_comprehensive_symbol_4_cd                                      TEXT            NULL 
	,new_comprehensive_symbol_4_cd                                      TEXT            NULL
	,old_physical_damage_collision_symbol_1_cd                          TEXT            NULL 
	,new_physical_damage_collision_symbol_1_cd                          TEXT            NULL
	,old_physical_damage_collision_symbol_2_cd                          TEXT            NULL 
	,new_physical_damage_collision_symbol_2_cd                          TEXT            NULL
	,old_physical_damage_collision_symbol_3_cd                          TEXT            NULL 
	,new_physical_damage_collision_symbol_3_cd                          TEXT            NULL
	,old_physical_damage_collision_symbol_4_cd                          TEXT            NULL 
	,new_physical_damage_collision_symbol_4_cd                          TEXT            NULL
	,old_physical_damage_collision_limit                                TEXT            NULL 
	,new_physical_damage_collision_limit                                TEXT            NULL
	,old_physical_damage_collision_deductible_amt                       TEXT            NULL 
	,new_physical_damage_collision_deductible_amt                       TEXT            NULL
	,old_physical_damage_collision_premium_amt                          TEXT            NULL 
	,new_physical_damage_collision_premium_amt                          TEXT            NULL
	,old_gargage_keepers_legal_liability_ind                            TEXT            NULL 
	,new_gargage_keepers_legal_liability_ind                            TEXT            NULL
	,old_garagae_keepers_direct_basis_ind                               TEXT            NULL 
	,new_garagae_keepers_direct_basis_ind                               TEXT            NULL
	,old_gargage_keepers_primary_ind                                    TEXT            NULL 
	,new_gargage_keepers_primary_ind                                    TEXT            NULL
	,old_gargage_keepers_excess_ind                                     TEXT            NULL 
	,new_gargage_keepers_excess_ind                                     TEXT            NULL
	,old_garagekeeps_other_than_collision_comprehensive_ind             TEXT            NULL 
	,new_garagekeeps_other_than_collision_comprehensive_ind             TEXT            NULL
	,old_garagekeeps_other_than_collision_specified_perils_ind          TEXT            NULL 
	,new_garagekeeps_other_than_collision_specified_perils_ind          TEXT            NULL
	,old_garagekeeps_other_than_collision_symbol_cd                     TEXT            NULL 
	,new_garagekeeps_other_than_collision_symbol_cd                     TEXT            NULL
	,old_garagekeeps_collision_symbol_cd                                TEXT            NULL 
	,new_garagekeeps_collision_symbol_cd                                TEXT            NULL
	,old_towing_labor_symbol_1_cd                                       TEXT            NULL 
	,new_towing_labor_symbol_1_cd                                       TEXT            NULL
	,old_towing_labor_symbol_2_cd                                       TEXT            NULL 
	,new_towing_labor_symbol_2_cd                                       TEXT            NULL
	,old_towing_labor_symbol_3_cd                                       TEXT            NULL 
	,new_towing_labor_symbol_3_cd                                       TEXT            NULL
	,old_towing_labor_symbol_4_cd                                       TEXT            NULL 
	,new_towing_labor_symbol_4_cd                                       TEXT            NULL
	,old_towing_labor_limit                                             TEXT            NULL 
	,new_towing_labor_limit                                             TEXT            NULL
	,old_towing_labor_deductible_amt                                    TEXT            NULL 
	,new_towing_labor_deductible_amt                                    TEXT            NULL
	,old_towing_labor_premium_amt                                       TEXT            NULL 
	,new_towing_labor_premium_amt                                       TEXT            NULL
	,old_combined_physical_damage_symbol_1_cd                           TEXT            NULL 
	,new_combined_physical_damage_symbol_1_cd                           TEXT            NULL
	,old_combined_physical_damage_symbol_2_cd                           TEXT            NULL 
	,new_combined_physical_damage_symbol_2_cd                           TEXT            NULL
	,old_combined_physical_damage_symbol_3_cd                           TEXT            NULL 
	,new_combined_physical_damage_symbol_3_cd                           TEXT            NULL
	,old_combined_phyiscal_damage_symbol_4_cd                           TEXT            NULL 
	,new_combined_phyiscal_damage_symbol_4_cd                           TEXT            NULL
	,old_combined_phyisical_damage_limit                                TEXT            NULL 
	,new_combined_phyisical_damage_limit                                TEXT            NULL
	,old_combined_phyisical_damage_deductible_amt                       TEXT            NULL 
	,new_combined_phyisical_damage_deductible_amt                       TEXT            NULL
	,old_combined_phyisical_damage_premium_amt                          TEXT            NULL 
	,new_combined_phyisical_damage_premium_amt                          TEXT            NULL
	,old_reporting_types                                                TEXT            NULL 
	,new_reporting_types                                                TEXT            NULL
	,old_physical_damage_reporting_period_cd                            TEXT            NULL 
	,new_physical_damage_reporting_period_cd                            TEXT            NULL
	,old_non_reporting_ind                                              TEXT            NULL 
	,new_non_reporting_ind                                              TEXT            NULL
	,old_temporary_location_limit                                       TEXT            NULL 
	,new_temporary_location_limit                                       TEXT            NULL
	,old_transit_limit                                                  TEXT            NULL 
	,new_transit_limit                                                  TEXT            NULL
	,old_total_premium                                                  TEXT            NULL 
	,new_total_premium                                                  TEXT            NULL
	,audit_action 														char(1) 		NOT NULL 
	,audit_user 														TEXT 			NOT NULL 			DEFAULT current_user 
	,audit_timestamp 													timestamp 		NOT NULL 			DEFAULT timezone('utc'::TEXT,clock_timestamp())
	,audit_id 															bigint 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.audit_gd_coverages OWNER TO mj_admin;
GO 

GRANT INSERT ON sagitta.audit_gd_coverages TO rl_sagitta_a;
GO 
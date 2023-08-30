CREATE TABLE sagitta.gd_coverages (
	 sagitem 														int 			NOT NULL 
	,audit_staff_cd                                                 TEXT            NULL
	,audit_entry_dt                                                 int             NULL
	,audit_time                                                     int             NULL
	,audit_cd                                                       TEXT            NULL
	,audit_history_record_number                                    TEXT            NULL
	,audit_program                                                  TEXT            NULL
	,audit_effective_dt                                             TEXT            NULL
	,audit_change_agency_id                                         TEXT            NULL
	,policy_seq_agency_id                                           TEXT            NULL
	,liability_symbol_1_cd                                          TEXT            NULL
	,liability_symbol_2_cd                                          TEXT            NULL
	,liability_symbol_3_cd                                          TEXT            NULL
	,liability_symbol_4_cd                                          TEXT            NULL
	,liability_symbol_5_cd                                          TEXT            NULL
	,auto_only_liability_bi_limit                                   TEXT            NULL
	,auto_only_liability_csl_limit                                  TEXT            NULL
	,auto_only_liability_pd_limit                                   TEXT            NULL
	,other_than_auto_only_liability_bi_limit                        TEXT            NULL
	,other_than_auto_only_liability_limit                           TEXT            NULL
	,other_than_auto_only_liability_pd_limit                        TEXT            NULL
	,aggregate_other_than_auto_only_liability_limit                 TEXT            NULL
	,liability_deductible_amt                                       TEXT            NULL
	,limited_liability_ind                                          TEXT            NULL
	,unlimited_liability_ind                                        TEXT            NULL
	,auto_only_premium_1_amt                                        TEXT            NULL
	,auto_only_premium_2_amt                                        TEXT            NULL
	,otherthan_auto_premium_1_amt                                   TEXT            NULL
	,otherthan_auto_premium_2_amt                                   TEXT            NULL
	,aggregate_other_than_auto_premium_1_amt                        TEXT            NULL
	,aggregate_other_than_auto_premium_2_amt                        TEXT            NULL
	,pip_no_fault_symbol_1_cd                                       TEXT            NULL
	,pip_no_fault_symbol_2_cd                                       TEXT            NULL
	,pip_no_fault_symbol_3_cd                                       TEXT            NULL
	,pip_no_fault_deductible_amt                                    TEXT            NULL
	,pip_no_fault_limit                                             TEXT            NULL
	,pip_no_fault_premium_amt                                       TEXT            NULL
	,apip_symbol_1_cd                                               TEXT            NULL
	,apip_symbol_2_cd                                               TEXT            NULL
	,apip_symbol_3_cd                                               TEXT            NULL
	,apip_limit                                                     TEXT            NULL
	,apip_deductible_amt                                            TEXT            NULL
	,apip_premium_amt                                               TEXT            NULL
	,medical_payments_symbol_1_cd                                   TEXT            NULL
	,medical_payments_symbol_2_cd                                   TEXT            NULL
	,medical_payments_symbol_3_cd                                   TEXT            NULL
	,medical_payments_limit                                         TEXT            NULL
	,medical_payments_auto_ind                                      TEXT            NULL
	,medical_payments_premises_operations_ind                       TEXT            NULL
	,medical_payments_deductible_amt                                TEXT            NULL
	,medical_payments_premium_1_amt                                 TEXT            NULL
	,medical_payments_premium_2_amt                                 TEXT            NULL
	,uninsured_motorist_symbol_1_cd                                 TEXT            NULL
	,uninsured_motorist_symbol_2_cd                                 TEXT            NULL
	,uninsured_motorist_symbol_3_cd                                 TEXT            NULL
	,uninsured_motorist_liability_bi_limit                          TEXT            NULL
	,uninsured_motorist_liability_csl_limit                         TEXT            NULL
	,uninsured_motorist_liability_pd_limit                          TEXT            NULL
	,uninsured_motorist_deductible_amt                              TEXT            NULL
	,uninsured_motorist_premium_1_amt                               TEXT            NULL
	,uninsured_motorist_premium_2_amt                               TEXT            NULL
	,underinsured_motorist_symbol_1_cd                              TEXT            NULL
	,underinsured_motorist_symbol_2_cd                              TEXT            NULL
	,underinsured_motorist_symbol_3_cd                              TEXT            NULL
	,underinsured_motoist_per_person_limit                          TEXT            NULL
	,underinsured_motoist_eacj_accident_limit                       TEXT            NULL
	,underinsured_motoist_pdt_limit                                 TEXT            NULL
	,underinsured_motorist_deductible_amt                           TEXT            NULL
	,underinsured_motorist_premium_1_amt                            TEXT            NULL
	,underinsured_motorist_premium_2_amt                            TEXT            NULL
	,off_dt                                                         TEXT            NULL
	,comprehensive_cov_ind                                          TEXT            NULL
	,specified_perils_cov_ind                                       TEXT            NULL
	,comprehensive_symbol_1_cd                                      TEXT            NULL
	,comprehensive_symbol_2_cd                                      TEXT            NULL
	,comprehensive_symbol_3_cd                                      TEXT            NULL
	,comprehensive_symbol_4_cd                                      TEXT            NULL
	,physical_damage_collision_symbol_1_cd                          TEXT            NULL
	,physical_damage_collision_symbol_2_cd                          TEXT            NULL
	,physical_damage_collision_symbol_3_cd                          TEXT            NULL
	,physical_damage_collision_symbol_4_cd                          TEXT            NULL
	,physical_damage_collision_limit                                TEXT            NULL
	,physical_damage_collision_deductible_amt                       TEXT            NULL
	,physical_damage_collision_premium_amt                          TEXT            NULL
	,gargage_keepers_legal_liability_ind                            TEXT            NULL
	,garagae_keepers_direct_basis_ind                               TEXT            NULL
	,gargage_keepers_primary_ind                                    TEXT            NULL
	,gargage_keepers_excess_ind                                     TEXT            NULL
	,garagekeeps_other_than_collision_comprehensive_ind             TEXT            NULL
	,garagekeeps_other_than_collision_specified_perils_ind          TEXT            NULL
	,garagekeeps_other_than_collision_symbol_cd                     TEXT            NULL
	,garagekeeps_collision_symbol_cd                                TEXT            NULL
	,towing_labor_symbol_1_cd                                       TEXT            NULL
	,towing_labor_symbol_2_cd                                       TEXT            NULL
	,towing_labor_symbol_3_cd                                       TEXT            NULL
	,towing_labor_symbol_4_cd                                       TEXT            NULL
	,towing_labor_limit                                             TEXT            NULL
	,towing_labor_deductible_amt                                    TEXT            NULL
	,towing_labor_premium_amt                                       TEXT            NULL
	,combined_physical_damage_symbol_1_cd                           TEXT            NULL
	,combined_physical_damage_symbol_2_cd                           TEXT            NULL
	,combined_physical_damage_symbol_3_cd                           TEXT            NULL
	,combined_phyiscal_damage_symbol_4_cd                           TEXT            NULL
	,combined_phyisical_damage_limit                                TEXT            NULL
	,combined_phyisical_damage_deductible_amt                       TEXT            NULL
	,combined_phyisical_damage_premium_amt                          TEXT            NULL
	,reporting_types                                                TEXT            NULL
	,physical_damage_reporting_period_cd                            TEXT            NULL
	,non_reporting_ind                                              TEXT            NULL
	,temporary_location_limit                                       TEXT            NULL
	,transit_limit                                                  TEXT            NULL
	,total_premium                                                  TEXT            NULL
	,CONSTRAINT gd_coverages_pkey 		PRIMARY KEY (sagitem)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.gd_coverages OWNER TO mj_admin;
GO 

GRANT SELECT ON sagitta.gd_coverages TO rl_sagitta_r;
GO 

GRANT INSERT ON sagitta.gd_coverages TO rl_sagitta_a;
GO 

GRANT UPDATE ON sagitta.gd_coverages TO rl_sagitta_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON sagitta.gd_coverages FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_gd_coverages_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON sagitta.gd_coverages FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_gd_coverages_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON sagitta.gd_coverages FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION sagitta.tr_audit_gd_coverages_u();
GO 

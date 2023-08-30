CREATE OR REPLACE FUNCTION sagitta.sp_gd_coverages_upsert () 
RETURNS int 
LANGUAGE plpgsql 
AS $$ 

DECLARE rc int;

BEGIN 
	INSERT INTO sagitta.gd_coverages (
		 sagitem 
		,audit_staff_cd 
		,audit_entry_dt 
		,audit_time 
		,audit_cd 
		,audit_history_record_number 
		,audit_program 
		,audit_effective_dt 
		,audit_change_agency_id 
		,policy_seq_agency_id 
		,liability_symbol_1_cd 
		,liability_symbol_2_cd 
		,liability_symbol_3_cd 
		,liability_symbol_4_cd 
		,liability_symbol_5_cd 
		,auto_only_liability_bi_limit 
		,auto_only_liability_csl_limit 
		,auto_only_liability_pd_limit 
		,other_than_auto_only_liability_bi_limit 
		,other_than_auto_only_liability_limit 
		,other_than_auto_only_liability_pd_limit 
		,aggregate_other_than_auto_only_liability_limit 
		,liability_deductible_amt 
		,limited_liability_ind 
		,unlimited_liability_ind 
		,auto_only_premium_1_amt 
		,auto_only_premium_2_amt 
		,otherthan_auto_premium_1_amt 
		,otherthan_auto_premium_2_amt 
		,aggregate_other_than_auto_premium_1_amt 
		,aggregate_other_than_auto_premium_2_amt 
		,pip_no_fault_symbol_1_cd 
		,pip_no_fault_symbol_2_cd 
		,pip_no_fault_symbol_3_cd 
		,pip_no_fault_deductible_amt 
		,pip_no_fault_limit 
		,pip_no_fault_premium_amt 
		,apip_symbol_1_cd 
		,apip_symbol_2_cd 
		,apip_symbol_3_cd 
		,apip_limit 
		,apip_deductible_amt 
		,apip_premium_amt 
		,medical_payments_symbol_1_cd 
		,medical_payments_symbol_2_cd 
		,medical_payments_symbol_3_cd 
		,medical_payments_limit 
		,medical_payments_auto_ind 
		,medical_payments_premises_operations_ind 
		,medical_payments_deductible_amt 
		,medical_payments_premium_1_amt 
		,medical_payments_premium_2_amt 
		,uninsured_motorist_symbol_1_cd 
		,uninsured_motorist_symbol_2_cd 
		,uninsured_motorist_symbol_3_cd 
		,uninsured_motorist_liability_bi_limit 
		,uninsured_motorist_liability_csl_limit 
		,uninsured_motorist_liability_pd_limit 
		,uninsured_motorist_deductible_amt 
		,uninsured_motorist_premium_1_amt 
		,uninsured_motorist_premium_2_amt 
		,underinsured_motorist_symbol_1_cd 
		,underinsured_motorist_symbol_2_cd 
		,underinsured_motorist_symbol_3_cd 
		,underinsured_motoist_per_person_limit 
		,underinsured_motoist_eacj_accident_limit 
		,underinsured_motoist_pdt_limit 
		,underinsured_motorist_deductible_amt 
		,underinsured_motorist_premium_1_amt 
		,underinsured_motorist_premium_2_amt 
		,off_dt 
		,comprehensive_cov_ind 
		,specified_perils_cov_ind 
		,comprehensive_symbol_1_cd 
		,comprehensive_symbol_2_cd 
		,comprehensive_symbol_3_cd 
		,comprehensive_symbol_4_cd 
		,physical_damage_collision_symbol_1_cd 
		,physical_damage_collision_symbol_2_cd 
		,physical_damage_collision_symbol_3_cd 
		,physical_damage_collision_symbol_4_cd 
		,physical_damage_collision_limit 
		,physical_damage_collision_deductible_amt 
		,physical_damage_collision_premium_amt 
		,gargage_keepers_legal_liability_ind 
		,garagae_keepers_direct_basis_ind 
		,gargage_keepers_primary_ind 
		,gargage_keepers_excess_ind 
		,garagekeeps_other_than_collision_comprehensive_ind 
		,garagekeeps_other_than_collision_specified_perils_ind 
		,garagekeeps_other_than_collision_symbol_cd 
		,garagekeeps_collision_symbol_cd 
		,towing_labor_symbol_1_cd 
		,towing_labor_symbol_2_cd 
		,towing_labor_symbol_3_cd 
		,towing_labor_symbol_4_cd 
		,towing_labor_limit 
		,towing_labor_deductible_amt 
		,towing_labor_premium_amt 
		,combined_physical_damage_symbol_1_cd 
		,combined_physical_damage_symbol_2_cd 
		,combined_physical_damage_symbol_3_cd 
		,combined_phyiscal_damage_symbol_4_cd 
		,combined_phyisical_damage_limit 
		,combined_phyisical_damage_deductible_amt 
		,combined_phyisical_damage_premium_amt 
		,reporting_types 
		,physical_damage_reporting_period_cd 
		,non_reporting_ind 
		,temporary_location_limit 
		,transit_limit 
		,total_premium 
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
			,policy_seq_agency_id 
			,liability_symbol_1_cd 
			,liability_symbol_2_cd 
			,liability_symbol_3_cd 
			,liability_symbol_4_cd 
			,liability_symbol_5_cd 
			,auto_only_liability_bi_limit 
			,auto_only_liability_csl_limit 
			,auto_only_liability_pd_limit 
			,other_than_auto_only_liability_bi_limit 
			,other_than_auto_only_liability_limit 
			,other_than_auto_only_liability_pd_limit 
			,aggregate_other_than_auto_only_liability_limit 
			,liability_deductible_amt 
			,limited_liability_ind 
			,unlimited_liability_ind 
			,auto_only_premium_1_amt 
			,auto_only_premium_2_amt 
			,otherthan_auto_premium_1_amt 
			,otherthan_auto_premium_2_amt 
			,aggregate_other_than_auto_premium_1_amt 
			,aggregate_other_than_auto_premium_2_amt 
			,pip_no_fault_symbol_1_cd 
			,pip_no_fault_symbol_2_cd 
			,pip_no_fault_symbol_3_cd 
			,pip_no_fault_deductible_amt 
			,pip_no_fault_limit 
			,pip_no_fault_premium_amt 
			,apip_symbol_1_cd 
			,apip_symbol_2_cd 
			,apip_symbol_3_cd 
			,apip_limit 
			,apip_deductible_amt 
			,apip_premium_amt 
			,medical_payments_symbol_1_cd 
			,medical_payments_symbol_2_cd 
			,medical_payments_symbol_3_cd 
			,medical_payments_limit 
			,medical_payments_auto_ind 
			,medical_payments_premises_operations_ind 
			,medical_payments_deductible_amt 
			,medical_payments_premium_1_amt 
			,medical_payments_premium_2_amt 
			,uninsured_motorist_symbol_1_cd 
			,uninsured_motorist_symbol_2_cd 
			,uninsured_motorist_symbol_3_cd 
			,uninsured_motorist_liability_bi_limit 
			,uninsured_motorist_liability_csl_limit 
			,uninsured_motorist_liability_pd_limit 
			,uninsured_motorist_deductible_amt 
			,uninsured_motorist_premium_1_amt 
			,uninsured_motorist_premium_2_amt 
			,underinsured_motorist_symbol_1_cd 
			,underinsured_motorist_symbol_2_cd 
			,underinsured_motorist_symbol_3_cd 
			,underinsured_motoist_per_person_limit 
			,underinsured_motoist_eacj_accident_limit 
			,underinsured_motoist_pdt_limit 
			,underinsured_motorist_deductible_amt 
			,underinsured_motorist_premium_1_amt 
			,underinsured_motorist_premium_2_amt 
			,off_dt 
			,comprehensive_cov_ind 
			,specified_perils_cov_ind 
			,comprehensive_symbol_1_cd 
			,comprehensive_symbol_2_cd 
			,comprehensive_symbol_3_cd 
			,comprehensive_symbol_4_cd 
			,physical_damage_collision_symbol_1_cd 
			,physical_damage_collision_symbol_2_cd 
			,physical_damage_collision_symbol_3_cd 
			,physical_damage_collision_symbol_4_cd 
			,physical_damage_collision_limit 
			,physical_damage_collision_deductible_amt 
			,physical_damage_collision_premium_amt 
			,gargage_keepers_legal_liability_ind 
			,garagae_keepers_direct_basis_ind 
			,gargage_keepers_primary_ind 
			,gargage_keepers_excess_ind 
			,garagekeeps_other_than_collision_comprehensive_ind 
			,garagekeeps_other_than_collision_specified_perils_ind 
			,garagekeeps_other_than_collision_symbol_cd 
			,garagekeeps_collision_symbol_cd 
			,towing_labor_symbol_1_cd 
			,towing_labor_symbol_2_cd 
			,towing_labor_symbol_3_cd 
			,towing_labor_symbol_4_cd 
			,towing_labor_limit 
			,towing_labor_deductible_amt 
			,towing_labor_premium_amt 
			,combined_physical_damage_symbol_1_cd 
			,combined_physical_damage_symbol_2_cd 
			,combined_physical_damage_symbol_3_cd 
			,combined_phyiscal_damage_symbol_4_cd 
			,combined_phyisical_damage_limit 
			,combined_phyisical_damage_deductible_amt 
			,combined_phyisical_damage_premium_amt 
			,reporting_types 
			,physical_damage_reporting_period_cd 
			,non_reporting_ind 
			,temporary_location_limit 
			,transit_limit 
			,total_premium 
	FROM 	sagitta.stg_gd_coverages 
	ON CONFLICT (sagitem) DO UPDATE 
	SET 	 audit_staff_cd                                     	= excluded.audit_staff_cd 
			,audit_entry_dt                                     	= excluded.audit_entry_dt 
			,audit_time                                         	= excluded.audit_time 
			,audit_cd                                           	= excluded.audit_cd 
			,audit_history_record_number                        	= excluded.audit_history_record_number 
			,audit_program                                      	= excluded.audit_program 
			,audit_effective_dt                                 	= excluded.audit_effective_dt 
			,audit_change_agency_id                             	= excluded.audit_change_agency_id 
			,policy_seq_agency_id                               	= excluded.policy_seq_agency_id 
			,liability_symbol_1_cd                              	= excluded.liability_symbol_1_cd 
			,liability_symbol_2_cd                              	= excluded.liability_symbol_2_cd 
			,liability_symbol_3_cd                              	= excluded.liability_symbol_3_cd 
			,liability_symbol_4_cd                              	= excluded.liability_symbol_4_cd 
			,liability_symbol_5_cd                              	= excluded.liability_symbol_5_cd 
			,auto_only_liability_bi_limit                       	= excluded.auto_only_liability_bi_limit 
			,auto_only_liability_csl_limit                      	= excluded.auto_only_liability_csl_limit 
			,auto_only_liability_pd_limit                       	= excluded.auto_only_liability_pd_limit 
			,other_than_auto_only_liability_bi_limit            	= excluded.other_than_auto_only_liability_bi_limit 
			,other_than_auto_only_liability_limit               	= excluded.other_than_auto_only_liability_limit 
			,other_than_auto_only_liability_pd_limit            	= excluded.other_than_auto_only_liability_pd_limit 
			,aggregate_other_than_auto_only_liability_limit     	= excluded.aggregate_other_than_auto_only_liability_limit 
			,liability_deductible_amt                           	= excluded.liability_deductible_amt 
			,limited_liability_ind                              	= excluded.limited_liability_ind 
			,unlimited_liability_ind                            	= excluded.unlimited_liability_ind 
			,auto_only_premium_1_amt                            	= excluded.auto_only_premium_1_amt 
			,auto_only_premium_2_amt                            	= excluded.auto_only_premium_2_amt 
			,otherthan_auto_premium_1_amt                       	= excluded.otherthan_auto_premium_1_amt 
			,otherthan_auto_premium_2_amt                       	= excluded.otherthan_auto_premium_2_amt 
			,aggregate_other_than_auto_premium_1_amt            	= excluded.aggregate_other_than_auto_premium_1_amt 
			,aggregate_other_than_auto_premium_2_amt            	= excluded.aggregate_other_than_auto_premium_2_amt 
			,pip_no_fault_symbol_1_cd                           	= excluded.pip_no_fault_symbol_1_cd 
			,pip_no_fault_symbol_2_cd                           	= excluded.pip_no_fault_symbol_2_cd 
			,pip_no_fault_symbol_3_cd                           	= excluded.pip_no_fault_symbol_3_cd 
			,pip_no_fault_deductible_amt                        	= excluded.pip_no_fault_deductible_amt 
			,pip_no_fault_limit                                 	= excluded.pip_no_fault_limit 
			,pip_no_fault_premium_amt                           	= excluded.pip_no_fault_premium_amt 
			,apip_symbol_1_cd                                   	= excluded.apip_symbol_1_cd 
			,apip_symbol_2_cd                                   	= excluded.apip_symbol_2_cd 
			,apip_symbol_3_cd                                   	= excluded.apip_symbol_3_cd 
			,apip_limit                                         	= excluded.apip_limit 
			,apip_deductible_amt                                	= excluded.apip_deductible_amt 
			,apip_premium_amt                                   	= excluded.apip_premium_amt 
			,medical_payments_symbol_1_cd                       	= excluded.medical_payments_symbol_1_cd 
			,medical_payments_symbol_2_cd                       	= excluded.medical_payments_symbol_2_cd 
			,medical_payments_symbol_3_cd                       	= excluded.medical_payments_symbol_3_cd 
			,medical_payments_limit                             	= excluded.medical_payments_limit 
			,medical_payments_auto_ind                          	= excluded.medical_payments_auto_ind 
			,medical_payments_premises_operations_ind   			= excluded.medical_payments_premises_operations_ind 
			,medical_payments_deductible_amt    					= excluded.medical_payments_deductible_amt 
			,medical_payments_premium_1_amt     					= excluded.medical_payments_premium_1_amt 
			,medical_payments_premium_2_amt     					= excluded.medical_payments_premium_2_amt 
			,uninsured_motorist_symbol_1_cd     					= excluded.uninsured_motorist_symbol_1_cd 
			,uninsured_motorist_symbol_2_cd     					= excluded.uninsured_motorist_symbol_2_cd 
			,uninsured_motorist_symbol_3_cd     					= excluded.uninsured_motorist_symbol_3_cd 
			,uninsured_motorist_liability_bi_limit  				= excluded.uninsured_motorist_liability_bi_limit 
			,uninsured_motorist_liability_csl_limit     			= excluded.uninsured_motorist_liability_csl_limit 
			,uninsured_motorist_liability_pd_limit  				= excluded.uninsured_motorist_liability_pd_limit 
			,uninsured_motorist_deductible_amt  					= excluded.uninsured_motorist_deductible_amt 
			,uninsured_motorist_premium_1_amt   					= excluded.uninsured_motorist_premium_1_amt 
			,uninsured_motorist_premium_2_amt   					= excluded.uninsured_motorist_premium_2_amt 
			,underinsured_motorist_symbol_1_cd  					= excluded.underinsured_motorist_symbol_1_cd 
			,underinsured_motorist_symbol_2_cd  					= excluded.underinsured_motorist_symbol_2_cd 
			,underinsured_motorist_symbol_3_cd  					= excluded.underinsured_motorist_symbol_3_cd 
			,underinsured_motoist_per_person_limit  				= excluded.underinsured_motoist_per_person_limit 
			,underinsured_motoist_eacj_accident_limit   			= excluded.underinsured_motoist_eacj_accident_limit 
			,underinsured_motoist_pdt_limit     					= excluded.underinsured_motoist_pdt_limit 
			,underinsured_motorist_deductible_amt   				= excluded.underinsured_motorist_deductible_amt 
			,underinsured_motorist_premium_1_amt    				= excluded.underinsured_motorist_premium_1_amt 
			,underinsured_motorist_premium_2_amt    				= excluded.underinsured_motorist_premium_2_amt 
			,off_dt     											= excluded.off_dt 
			,comprehensive_cov_ind  								= excluded.comprehensive_cov_ind 
			,specified_perils_cov_ind   							= excluded.specified_perils_cov_ind 
			,comprehensive_symbol_1_cd  							= excluded.comprehensive_symbol_1_cd 
			,comprehensive_symbol_2_cd  							= excluded.comprehensive_symbol_2_cd 
			,comprehensive_symbol_3_cd  							= excluded.comprehensive_symbol_3_cd 
			,comprehensive_symbol_4_cd  							= excluded.comprehensive_symbol_4_cd 
			,physical_damage_collision_symbol_1_cd  				= excluded.physical_damage_collision_symbol_1_cd 
			,physical_damage_collision_symbol_2_cd  				= excluded.physical_damage_collision_symbol_2_cd 
			,physical_damage_collision_symbol_3_cd  				= excluded.physical_damage_collision_symbol_3_cd 
			,physical_damage_collision_symbol_4_cd  				= excluded.physical_damage_collision_symbol_4_cd 
			,physical_damage_collision_limit    					= excluded.physical_damage_collision_limit 
			,physical_damage_collision_deductible_amt   			= excluded.physical_damage_collision_deductible_amt 
			,physical_damage_collision_premium_amt  				= excluded.physical_damage_collision_premium_amt 
			,gargage_keepers_legal_liability_ind    				= excluded.gargage_keepers_legal_liability_ind 
			,garagae_keepers_direct_basis_ind   					= excluded.garagae_keepers_direct_basis_ind 
			,gargage_keepers_primary_ind    						= excluded.gargage_keepers_primary_ind 
			,gargage_keepers_excess_ind     						= excluded.gargage_keepers_excess_ind 
			,garagekeeps_other_than_collision_comprehensive_ind     = excluded.garagekeeps_other_than_collision_comprehensive_ind 
			,garagekeeps_other_than_collision_specified_perils_ind  = excluded.garagekeeps_other_than_collision_specified_perils_ind 
			,garagekeeps_other_than_collision_symbol_cd     		= excluded.garagekeeps_other_than_collision_symbol_cd 
			,garagekeeps_collision_symbol_cd    					= excluded.garagekeeps_collision_symbol_cd 
			,towing_labor_symbol_1_cd   							= excluded.towing_labor_symbol_1_cd 
			,towing_labor_symbol_2_cd   							= excluded.towing_labor_symbol_2_cd 
			,towing_labor_symbol_3_cd   							= excluded.towing_labor_symbol_3_cd 
			,towing_labor_symbol_4_cd   							= excluded.towing_labor_symbol_4_cd 
			,towing_labor_limit     								= excluded.towing_labor_limit 
			,towing_labor_deductible_amt    						= excluded.towing_labor_deductible_amt 
			,towing_labor_premium_amt   							= excluded.towing_labor_premium_amt 
			,combined_physical_damage_symbol_1_cd   				= excluded.combined_physical_damage_symbol_1_cd 
			,combined_physical_damage_symbol_2_cd   				= excluded.combined_physical_damage_symbol_2_cd 
			,combined_physical_damage_symbol_3_cd   				= excluded.combined_physical_damage_symbol_3_cd 
			,combined_phyiscal_damage_symbol_4_cd   				= excluded.combined_phyiscal_damage_symbol_4_cd 
			,combined_phyisical_damage_limit    					= excluded.combined_phyisical_damage_limit 
			,combined_phyisical_damage_deductible_amt   			= excluded.combined_phyisical_damage_deductible_amt 
			,combined_phyisical_damage_premium_amt  				= excluded.combined_phyisical_damage_premium_amt 
			,reporting_types    									= excluded.reporting_types 
			,physical_damage_reporting_period_cd    				= excluded.physical_damage_reporting_period_cd 
			,non_reporting_ind  									= excluded.non_reporting_ind 
			,temporary_location_limit   							= excluded.temporary_location_limit 
			,transit_limit  										= excluded.transit_limit 
			,total_premium  										= excluded.total_premium 
	WHERE 	(gd_coverages.audit_staff_cd,gd_coverages.audit_entry_dt,gd_coverages.audit_time,gd_coverages.audit_cd,gd_coverages.audit_history_record_number,gd_coverages.audit_program,gd_coverages.audit_effective_dt,gd_coverages.audit_change_agency_id,gd_coverages.policy_seq_agency_id,gd_coverages.liability_symbol_1_cd,gd_coverages.liability_symbol_2_cd,gd_coverages.liability_symbol_3_cd,gd_coverages.liability_symbol_4_cd,gd_coverages.liability_symbol_5_cd,gd_coverages.auto_only_liability_bi_limit,gd_coverages.auto_only_liability_csl_limit,gd_coverages.auto_only_liability_pd_limit,gd_coverages.other_than_auto_only_liability_bi_limit,gd_coverages.other_than_auto_only_liability_limit,gd_coverages.other_than_auto_only_liability_pd_limit,gd_coverages.aggregate_other_than_auto_only_liability_limit,gd_coverages.liability_deductible_amt,gd_coverages.limited_liability_ind,gd_coverages.unlimited_liability_ind,gd_coverages.auto_only_premium_1_amt,gd_coverages.auto_only_premium_2_amt,gd_coverages.otherthan_auto_premium_1_amt,gd_coverages.otherthan_auto_premium_2_amt,gd_coverages.aggregate_other_than_auto_premium_1_amt,gd_coverages.aggregate_other_than_auto_premium_2_amt,gd_coverages.pip_no_fault_symbol_1_cd,gd_coverages.pip_no_fault_symbol_2_cd,gd_coverages.pip_no_fault_symbol_3_cd,gd_coverages.pip_no_fault_deductible_amt,gd_coverages.pip_no_fault_limit,gd_coverages.pip_no_fault_premium_amt,gd_coverages.apip_symbol_1_cd,gd_coverages.apip_symbol_2_cd,gd_coverages.apip_symbol_3_cd,gd_coverages.apip_limit,gd_coverages.apip_deductible_amt,gd_coverages.apip_premium_amt,gd_coverages.medical_payments_symbol_1_cd,gd_coverages.medical_payments_symbol_2_cd,gd_coverages.medical_payments_symbol_3_cd,gd_coverages.medical_payments_limit,gd_coverages.medical_payments_auto_ind,gd_coverages.medical_payments_premises_operations_ind,gd_coverages.medical_payments_deductible_amt,gd_coverages.medical_payments_premium_1_amt,gd_coverages.medical_payments_premium_2_amt,gd_coverages.uninsured_motorist_symbol_1_cd,gd_coverages.uninsured_motorist_symbol_2_cd,gd_coverages.uninsured_motorist_symbol_3_cd,gd_coverages.uninsured_motorist_liability_bi_limit,gd_coverages.uninsured_motorist_liability_csl_limit,gd_coverages.uninsured_motorist_liability_pd_limit,gd_coverages.uninsured_motorist_deductible_amt,gd_coverages.uninsured_motorist_premium_1_amt,gd_coverages.uninsured_motorist_premium_2_amt,gd_coverages.underinsured_motorist_symbol_1_cd,gd_coverages.underinsured_motorist_symbol_2_cd,gd_coverages.underinsured_motorist_symbol_3_cd,gd_coverages.underinsured_motoist_per_person_limit,gd_coverages.underinsured_motoist_eacj_accident_limit,gd_coverages.underinsured_motoist_pdt_limit,gd_coverages.underinsured_motorist_deductible_amt,gd_coverages.underinsured_motorist_premium_1_amt,gd_coverages.underinsured_motorist_premium_2_amt,gd_coverages.off_dt,gd_coverages.comprehensive_cov_ind,gd_coverages.specified_perils_cov_ind,gd_coverages.comprehensive_symbol_1_cd,gd_coverages.comprehensive_symbol_2_cd,gd_coverages.comprehensive_symbol_3_cd,gd_coverages.comprehensive_symbol_4_cd,gd_coverages.physical_damage_collision_symbol_1_cd,gd_coverages.physical_damage_collision_symbol_2_cd,gd_coverages.physical_damage_collision_symbol_3_cd,gd_coverages.physical_damage_collision_symbol_4_cd,gd_coverages.physical_damage_collision_limit,gd_coverages.physical_damage_collision_deductible_amt,gd_coverages.physical_damage_collision_premium_amt,gd_coverages.gargage_keepers_legal_liability_ind,gd_coverages.garagae_keepers_direct_basis_ind,gd_coverages.gargage_keepers_primary_ind,gd_coverages.gargage_keepers_excess_ind,gd_coverages.garagekeeps_other_than_collision_comprehensive_ind,gd_coverages.garagekeeps_other_than_collision_specified_perils_ind,gd_coverages.garagekeeps_other_than_collision_symbol_cd,gd_coverages.garagekeeps_collision_symbol_cd,gd_coverages.towing_labor_symbol_1_cd,gd_coverages.towing_labor_symbol_2_cd,gd_coverages.towing_labor_symbol_3_cd,gd_coverages.towing_labor_symbol_4_cd,gd_coverages.towing_labor_limit,gd_coverages.towing_labor_deductible_amt,gd_coverages.towing_labor_premium_amt,gd_coverages.combined_physical_damage_symbol_1_cd,gd_coverages.combined_physical_damage_symbol_2_cd,gd_coverages.combined_physical_damage_symbol_3_cd,gd_coverages.combined_phyiscal_damage_symbol_4_cd,gd_coverages.combined_phyisical_damage_limit,gd_coverages.combined_phyisical_damage_deductible_amt,gd_coverages.combined_phyisical_damage_premium_amt,gd_coverages.reporting_types,gd_coverages.physical_damage_reporting_period_cd,gd_coverages.non_reporting_ind,gd_coverages.temporary_location_limit,gd_coverages.transit_limit,gd_coverages.total_premium) 
		IS DISTINCT FROM 	(excluded.audit_staff_cd,excluded.audit_entry_dt,excluded.audit_time,excluded.audit_cd,excluded.audit_history_record_number,excluded.audit_program,excluded.audit_effective_dt,excluded.audit_change_agency_id,excluded.policy_seq_agency_id,excluded.liability_symbol_1_cd,excluded.liability_symbol_2_cd,excluded.liability_symbol_3_cd,excluded.liability_symbol_4_cd,excluded.liability_symbol_5_cd,excluded.auto_only_liability_bi_limit,excluded.auto_only_liability_csl_limit,excluded.auto_only_liability_pd_limit,excluded.other_than_auto_only_liability_bi_limit,excluded.other_than_auto_only_liability_limit,excluded.other_than_auto_only_liability_pd_limit,excluded.aggregate_other_than_auto_only_liability_limit,excluded.liability_deductible_amt,excluded.limited_liability_ind,excluded.unlimited_liability_ind,excluded.auto_only_premium_1_amt,excluded.auto_only_premium_2_amt,excluded.otherthan_auto_premium_1_amt,excluded.otherthan_auto_premium_2_amt,excluded.aggregate_other_than_auto_premium_1_amt,excluded.aggregate_other_than_auto_premium_2_amt,excluded.pip_no_fault_symbol_1_cd,excluded.pip_no_fault_symbol_2_cd,excluded.pip_no_fault_symbol_3_cd,excluded.pip_no_fault_deductible_amt,excluded.pip_no_fault_limit,excluded.pip_no_fault_premium_amt,excluded.apip_symbol_1_cd,excluded.apip_symbol_2_cd,excluded.apip_symbol_3_cd,excluded.apip_limit,excluded.apip_deductible_amt,excluded.apip_premium_amt,excluded.medical_payments_symbol_1_cd,excluded.medical_payments_symbol_2_cd,excluded.medical_payments_symbol_3_cd,excluded.medical_payments_limit,excluded.medical_payments_auto_ind,excluded.medical_payments_premises_operations_ind,excluded.medical_payments_deductible_amt,excluded.medical_payments_premium_1_amt,excluded.medical_payments_premium_2_amt,excluded.uninsured_motorist_symbol_1_cd,excluded.uninsured_motorist_symbol_2_cd,excluded.uninsured_motorist_symbol_3_cd,excluded.uninsured_motorist_liability_bi_limit,excluded.uninsured_motorist_liability_csl_limit,excluded.uninsured_motorist_liability_pd_limit,excluded.uninsured_motorist_deductible_amt,excluded.uninsured_motorist_premium_1_amt,excluded.uninsured_motorist_premium_2_amt,excluded.underinsured_motorist_symbol_1_cd,excluded.underinsured_motorist_symbol_2_cd,excluded.underinsured_motorist_symbol_3_cd,excluded.underinsured_motoist_per_person_limit,excluded.underinsured_motoist_eacj_accident_limit,excluded.underinsured_motoist_pdt_limit,excluded.underinsured_motorist_deductible_amt,excluded.underinsured_motorist_premium_1_amt,excluded.underinsured_motorist_premium_2_amt,excluded.off_dt,excluded.comprehensive_cov_ind,excluded.specified_perils_cov_ind,excluded.comprehensive_symbol_1_cd,excluded.comprehensive_symbol_2_cd,excluded.comprehensive_symbol_3_cd,excluded.comprehensive_symbol_4_cd,excluded.physical_damage_collision_symbol_1_cd,excluded.physical_damage_collision_symbol_2_cd,excluded.physical_damage_collision_symbol_3_cd,excluded.physical_damage_collision_symbol_4_cd,excluded.physical_damage_collision_limit,excluded.physical_damage_collision_deductible_amt,excluded.physical_damage_collision_premium_amt,excluded.gargage_keepers_legal_liability_ind,excluded.garagae_keepers_direct_basis_ind,excluded.gargage_keepers_primary_ind,excluded.gargage_keepers_excess_ind,excluded.garagekeeps_other_than_collision_comprehensive_ind,excluded.garagekeeps_other_than_collision_specified_perils_ind,excluded.garagekeeps_other_than_collision_symbol_cd,excluded.garagekeeps_collision_symbol_cd,excluded.towing_labor_symbol_1_cd,excluded.towing_labor_symbol_2_cd,excluded.towing_labor_symbol_3_cd,excluded.towing_labor_symbol_4_cd,excluded.towing_labor_limit,excluded.towing_labor_deductible_amt,excluded.towing_labor_premium_amt,excluded.combined_physical_damage_symbol_1_cd,excluded.combined_physical_damage_symbol_2_cd,excluded.combined_physical_damage_symbol_3_cd,excluded.combined_phyiscal_damage_symbol_4_cd,excluded.combined_phyisical_damage_limit,excluded.combined_phyisical_damage_deductible_amt,excluded.combined_phyisical_damage_premium_amt,excluded.reporting_types,excluded.physical_damage_reporting_period_cd,excluded.non_reporting_ind,excluded.temporary_location_limit,excluded.transit_limit,excluded.total_premium); 
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_gd_coverages_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_gd_coverages_upsert() TO rl_sagitta_x;
GO 

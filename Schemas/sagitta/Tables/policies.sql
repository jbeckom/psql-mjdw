CREATE TABLE sagitta.policies (
	 sagitem 									        int 	NOT NULL  
	,audit_staff_cd 							        TEXT 	NULL 
	,audit_entry_dt 							        int 	NULL 
	,audit_time 								        int 	NULL 
	,audit_cd 									        TEXT 	NULL 
	,audit_history_record_number 				        TEXT 	NULL 
	,audit_program 								        TEXT 	NULL 
	,audit_effective_dt 						        TEXT 	NULL 
	,audit_change_agency_id 					        TEXT 	NULL 
	,policy_number 								        TEXT 	NULL 
	,named_insured 								        TEXT 	NULL 
	,bill_to_cd 								        TEXT 	NULL 
	,client_cd 									        int 	NULL 
	,policy_remark_text 						        TEXT 	NULL 
	,insurer_name 								        TEXT 	NULL 
	,coverage_cd 								        int 	NULL 
	,canc_nonrenew_renew_ind 					        TEXT 	NULL 
	,policy_contract_term_cd 					        TEXT 	NULL 
	,policy_effective_dt 						        TEXT 	NULL 
	,policy_effective_local_standard_time_ind 	        TEXT 	NULL 
	,policy_expiration_dt 						        int 	NULL 
	,policy_expiration_local_standard_time_ind 	        TEXT 	NULL 
	,policy_original_inception_dt 				        TEXT 	NULL 
	,binder_effective_dt 						        TEXT 	NULL 
	,binder_start_time_ind 						        TEXT 	NULL 
	,binder_expiration_dt 						        TEXT 	NULL 
	,binder_expiration_time_ind 				        TEXT 	NULL 
	,bill_type_cd 								        TEXT 	NULL 
	,binder_purpose_cd 							        TEXT 	NULL 
	,cancellation_type_cd 						        TEXT 	NULL 
	,canc_nonrenew_renew_dt 					        TEXT 	NULL 
	,last_premium_amt 							        TEXT 	NULL 
	,last_commission_pct 						        TEXT 	NULL 
	,last_commission_amt 						        TEXT 	NULL 
	,new_renew_ind 								        TEXT 	NULL 
	,last_transaction_id 						        TEXT 	NULL 
	,last_transaction_dt 						        TEXT 	NULL 
	,producer_1_cd 								        TEXT 	NULL 
	,producer_2_cd 								        TEXT 	NULL 
	,producer_3_cd 								        TEXT 	NULL 
	,written_premium_amt 						        TEXT 	NULL 
	,written_agcy_commission_amt 				        TEXT 	NULL 
	,written_producer_commission_amt 			        TEXT 	NULL 
	,prevoius_policy_id 						        TEXT 	NULL 
	,next_policy_id 							        TEXT 	NULL 
	,annual_premium_amt 						        TEXT 	NULL 
	,annual_agency_premium_amt 					        TEXT 	NULL 
	,annual_producer_premium_amt 				        TEXT 	NULL 
	,division_cd 								        TEXT 	NULL 
	,state_prov_cd 								        TEXT 	NULL 
	,last_letter 								        TEXT 	NULL 
	,audit_term_cd 								        TEXT 	NULL 
	,servicer_cd 								        TEXT 	NULL 
	,department_cd 								        TEXT 	NULL 
	,canc_dt 									        TEXT 	NULL 
	,canc_reason_cd 							        TEXT 	NULL 
	,canc_evidence 								        TEXT 	NULL 
	,reinstate_dt 								        TEXT 	NULL 
	,reinstate_reason_cd 						        TEXT 	NULL 
	,countersignature_state_prov_cd 			        TEXT 	NULL 
	,sic_cd 									        int 	NULL 
	,date_business_started 						        TEXT 	NULL 
	,nature_business_cd 						        TEXT 	NULL 
	,general_info_remark_text 					        TEXT 	NULL 
	,num_current_addr_yrs 						        TEXT 	NULL 
	,previous_addr_1 							        TEXT 	NULL 
	,previous_addr_2 							        TEXT 	NULL 
	,prevoius_postal_code 						        TEXT 	NULL 
	,previous_postal_extension_code 			        TEXT 	NULL 
	,previous_city 								        TEXT 	NULL 
	,previous_state_prov_cd 					        TEXT 	NULL 
	,current_residence_dt 						        TEXT 	NULL 
	,previous_residence_dt 						        TEXT 	NULL 
	,birth_dt	 								        TEXT 	NULL 
	,tax_id 									        TEXT 	NULL 
	,num_residents_in_household 				        TEXT 	NULL 
	,named_individuals 							        TEXT 	NULL 
	,marital_stats_cd 							        TEXT 	NULL 
	,occupation_class_cd 						        TEXT 	NULL 
	,occupation_desc 							        TEXT 	NULL 
	,length_time_employed 						        TEXT 	NULL 
	,household_income_amt 						        TEXT 	NULL 
	,commercial_name 							        TEXT 	NULL 
	,length_time_with_previous_employee 		        TEXT 	NULL 
	,length_time_with_current_occupation 		        TEXT 	NULL 
	,num_vehs_in_household 						        TEXT 	NULL 
	,length_time_known_by_agent_broker 			        TEXT 	NULL 
	,auto_club_member_yes_no_cd 				        TEXT 	NULL 
	,umpd_rejection_yes_ne_cd 					        TEXT 	NULL 
	,underins_motorist_rejection_yes_no_cd 		        TEXT 	NULL 
	,any_losses_accidents_convictions_ind_yes_no_cd 	TEXT 	NULL 
	,residence_owned_rented_cd 							TEXT 	NULL 
	,co_insured_birth_dt 								TEXT 	NULL 
	,co_insured_tax_id 									TEXT 	NULL 
	,co_insured_marital_status_cd 						TEXT 	NULL 
	,co_insured_occupation_class_cd 					TEXT 	NULL 
	,co_insured_occupation_desc 						TEXT 	NULL 
	,co_insured_length_time_with_current_employer 		TEXT 	NULL 
	,co_insured_commercial_name 						TEXT 	NULL 
	,co_insured_length_time_with_previous_employer 		TEXT 	NULL 
	,co_insured_length_time_current_occupation 			TEXT 	NULL 
	,business_income_type_business_cd 					TEXT 	NULL 
	,policy_type_cd 									TEXT 	NULL 
	,integration_policy_number 							TEXT 	NULL 
	,do_not_send_to_insurlink 							TEXT 	NULL 
	,payee_cd 											TEXT 	NULL 
	,canc_last_dt 										TEXT 	NULL 
	,policy_desc 										TEXT 	NULL 
	,block_download 									TEXT 	NULL 
	,block_archive 										TEXT 	NULL 
	,policy_source 										TEXT 	NULL 
	,carrier_producer_sub_code 							TEXT 	NULL 
	,est_prem_amt 										TEXT 	NULL 
	,est_comm_pct 										TEXT 	NULL 
	,est_comm_amt 										TEXT 	NULL 
	,bor_effective_dt 									TEXT 	NULL 
	,bor_expiration_dt 									TEXT 	NULL 
	,payment_plan 										TEXT 	NULL 
	,insureds_title 									TEXT 	NULL 
	,co_insureds_title 									TEXT 	NULL 
	,insureds_first_name 								TEXT 	NULL 
	,co_insureds_first_name 							TEXT 	NULL 
	,insureds_middle_name 								TEXT 	NULL 
	,co_insureds_middle_name 							TEXT 	NULL 
	,insureds_last_name 								TEXT 	NULL 
	,co_insureds_last_name 								TEXT 	NULL 
	,insureds_suffix 									TEXT 	NULL 
	,co_insureds_suffix 								TEXT 	NULL 
	,modify_dt 											timestamp 	NOT NULL 	DEFAULT timezone('utc'::TEXT, pg_catalog.clock_timestamp()) 
	,CONSTRAINT policies_pkey PRIMARY KEY (sagitem) 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.policies OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE sagitta.policies TO rl_sagitta_r;
GO 

GRANT INSERT ON TABLE sagitta.policies TO rl_sagitta_a;
GO 

GRANT UPDATE ON TABLE sagitta.policies TO rl_sagitta_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON sagitta.policies FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_policies_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON sagitta.policies FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_policies_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON sagitta.policies FOR EACH ROW WHEN (NEW IS DISTINCT FROM OLD) EXECUTE FUNCTION sagitta.tr_audit_policies_u();
GO 

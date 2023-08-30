/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE sagitta.policies 
	 DROP CONSTRAINT IF EXISTS policies_pkey 
	,ADD CONSTRAINT policies_sagitem_uq 	UNIQUE (sagitem)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON sagitta.policies; 
GO
DROP TRIGGER IF EXISTS audit_i ON sagitta.policies; 
GO
DROP TRIGGER IF EXISTS audit_u ON sagitta.policies; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON sagitta.policies; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON sagitta.policies FOR EACH ROW EXECUTE FUNCTION audit.tr_sagitta_log_change(); 
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
		,'policies' 			AS table_name 
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
						,x.old_policy_number 			AS policy_number 
						,x.old_named_insured 			AS named_insured 
						,x.old_bill_to_cd 			AS bill_to_cd 
						,x.old_client_cd 			AS client_cd 
						,x.old_policy_remark_text 			AS policy_remark_text 
						,x.old_insurer_name 			AS insurer_name 
						,x.old_coverage_cd 			AS coverage_cd 
						,x.old_canc_nonrenew_renew_ind 			AS canc_nonrenew_renew_ind 
						,x.old_policy_contract_term_cd 			AS policy_contract_term_cd 
						,x.old_policy_effective_dt 			AS policy_effective_dt 
						,x.old_policy_effective_local_standard_time_ind 			AS policy_effective_local_standard_time_ind 
						,x.old_policy_expiration_dt 			AS policy_expiration_dt 
						,x.old_policy_expiration_local_standard_time_ind 			AS policy_expiration_local_standard_time_ind 
						,x.old_policy_original_inception_dt 			AS policy_original_inception_dt 
						,x.old_binder_effective_dt 			AS binder_effective_dt 
						,x.old_binder_start_time_ind 			AS binder_start_time_ind 
						,x.old_binder_expiration_dt 			AS binder_expiration_dt 
						,x.old_binder_expiration_time_ind 			AS binder_expiration_time_ind 
						,x.old_bill_type_cd 			AS bill_type_cd 
						,x.old_binder_purpose_cd 			AS binder_purpose_cd 
						,x.old_cancellation_type_cd 			AS cancellation_type_cd 
						,x.old_canc_nonrenew_renew_dt 			AS canc_nonrenew_renew_dt 
						,x.old_last_premium_amt 			AS last_premium_amt 
						,x.old_last_commission_pct 			AS last_commission_pct 
						,x.old_last_commission_amt 			AS last_commission_amt 
						,x.old_new_renew_ind 			AS new_renew_ind 
						,x.old_last_transaction_id 			AS last_transaction_id 
						,x.old_last_transaction_dt 			AS last_transaction_dt 
						,x.old_producer_1_cd 			AS producer_1_cd 
						,x.old_producer_2_cd 			AS producer_2_cd 
						,x.old_producer_3_cd 			AS producer_3_cd 
						,x.old_written_premium_amt 			AS written_premium_amt 
						,x.old_written_agcy_commission_amt 			AS written_agcy_commission_amt 
						,x.old_written_producer_commission_amt 			AS written_producer_commission_amt 
						,x.old_previous_policy_id 			AS previous_policy_id 
						,x.old_next_policy_id 			AS next_policy_id 
						,x.old_annual_premium_amt 			AS annual_premium_amt 
						,x.old_annual_agency_premium_amt 			AS annual_agency_premium_amt 
						,x.old_annual_producer_premium_amt 			AS annual_producer_premium_amt 
						,x.old_division_cd 			AS division_cd 
						,x.old_state_prov_cd 			AS state_prov_cd 
						,x.old_last_letter 			AS last_letter 
						,x.old_audit_term_cd 			AS audit_term_cd 
						,x.old_servicer_cd 			AS servicer_cd 
						,x.old_department_cd 			AS department_cd 
						,x.old_canc_dt 			AS canc_dt 
						,x.old_canc_reason_cd 			AS canc_reason_cd 
						,x.old_canc_evidence 			AS canc_evidence 
						,x.old_reinstate_dt 			AS reinstate_dt 
						,x.old_reinstate_reason_cd 			AS reinstate_reason_cd 
						,x.old_countersignature_state_prov_cd 			AS countersignature_state_prov_cd 
						,x.old_sic_cd 			AS sic_cd 
						,x.old_date_business_started 			AS date_business_started 
						,x.old_nature_business_cd 			AS nature_business_cd 
						,x.old_general_info_remark_text 			AS general_info_remark_text 
						,x.old_num_current_addr_yrs 			AS num_current_addr_yrs 
						,x.old_previous_addr_1 			AS previous_addr_1 
						,x.old_previous_addr_2 			AS previous_addr_2 
						,x.old_prevoius_postal_code 			AS prevoius_postal_code 
						,x.old_previous_postal_extension_code 			AS previous_postal_extension_code 
						,x.old_previous_city 			AS previous_city 
						,x.old_previous_state_prov_cd 			AS previous_state_prov_cd 
						,x.old_current_residence_dt 			AS current_residence_dt 
						,x.old_previous_residence_dt 			AS previous_residence_dt 
						,x.old_birth_dt 			AS birth_dt 
						,x.old_tax_id 			AS tax_id 
						,x.old_num_residents_in_household 			AS num_residents_in_household 
						,x.old_named_individuals 			AS named_individuals 
						,x.old_marital_stats_cd 			AS marital_stats_cd 
						,x.old_occupation_class_cd 			AS occupation_class_cd 
						,x.old_occupation_desc 			AS occupation_desc 
						,x.old_length_time_employed 			AS length_time_employed 
						,x.old_household_income_amt 			AS househincome_amt 
						,x.old_commercial_name 			AS commercial_name 
						,x.old_length_time_with_previous_employee 			AS length_time_with_previous_employee 
						,x.old_length_time_with_current_occupation 			AS length_time_with_current_occupation 
						,x.old_num_vehs_in_household 			AS num_vehs_in_household 
						,x.old_length_time_known_by_agent_broker 			AS length_time_known_by_agent_broker 
						,x.old_auto_club_member_yes_no_cd 			AS auto_club_member_yes_no_cd 
						,x.old_umpd_rejection_yes_ne_cd 			AS umpd_rejection_yes_ne_cd 
						,x.old_underins_motorist_rejection_yes_no_cd 			AS underins_motorist_rejection_yes_no_cd 
						,x.old_any_losses_accidents_convictions_ind_yes_no_cd 			AS any_losses_accidents_convictions_ind_yes_no_cd 
						,x.old_residence_owned_rented_cd 			AS residence_owned_rented_cd 
						,x.old_co_insured_birth_dt 			AS co_insured_birth_dt 
						,x.old_co_insured_tax_id 			AS co_insured_tax_id 
						,x.old_co_insured_marital_status_cd 			AS co_insured_marital_status_cd 
						,x.old_co_insured_occupation_class_cd 			AS co_insured_occupation_class_cd 
						,x.old_co_insured_occupation_desc 			AS co_insured_occupation_desc 
						,x.old_co_insured_length_time_with_current_employer 			AS co_insured_length_time_with_current_employer 
						,x.old_co_insured_commercial_name 			AS co_insured_commercial_name 
						,x.old_co_insured_length_time_with_previous_employer 			AS co_insured_length_time_with_previous_employer 
						,x.old_co_insured_length_time_current_occupation 			AS co_insured_length_time_current_occupation 
						,x.old_business_income_type_business_cd 			AS business_income_type_business_cd 
						,x.old_policy_type_cd 			AS policy_type_cd 
						,x.old_integration_policy_number 			AS integration_policy_number 
						,x.old_do_not_send_to_insurlink 			AS do_not_send_to_insurlink 
						,x.old_payee_cd 			AS payee_cd 
						,x.old_canc_last_dt 			AS canc_last_dt 
						,x.old_policy_desc 			AS policy_desc 
						,x.old_block_download 			AS block_download 
						,x.old_block_archive 			AS block_archive 
						,x.old_policy_source 			AS policy_source 
						,x.old_carrier_producer_sub_code 			AS carrier_producer_sub_code 
						,x.old_est_prem_amt 			AS est_prem_amt 
						,x.old_est_comm_pct 			AS est_comm_pct 
						,x.old_est_comm_amt 			AS est_comm_amt 
						,x.old_bor_effective_dt 			AS bor_effective_dt 
						,x.old_bor_expiration_dt 			AS bor_expiration_dt 
						,x.old_payment_plan 			AS payment_plan 
						,x.old_insureds_title 			AS insureds_title 
						,x.old_co_insureds_title 			AS co_insureds_title 
						,x.old_insureds_first_name 			AS insureds_first_name 
						,x.old_co_insureds_first_name 			AS co_insureds_first_name 
						,x.old_insureds_middle_name 			AS insureds_middle_name 
						,x.old_co_insureds_middle_name 			AS co_insureds_middle_name 
						,x.old_insureds_last_name 			AS insureds_last_name 
						,x.old_co_insureds_last_name 			AS co_insureds_last_name 
						,x.old_insureds_suffix 			AS insureds_suffix 
						,x.old_co_insureds_suffix 			AS co_insureds_suffix 
			) 	AS _ 
		) 			AS new_record 
FROM sagitta.audit_policies 	AS x 
	INNER JOIN 	sagitta.policies 	AS y 
		ON x.sagitem = y.sagitem; 
GO 

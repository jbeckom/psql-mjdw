DROP FUNCTION IF EXISTS sagitta.sp_policies_upsert(int, text);
GO 

CREATE OR REPLACE FUNCTION sagitta.sp_policies_upsert()
RETURNS int 
LANGUAGE plpgsql
AS $$

DECLARE rc int;

BEGIN 
	INSERT INTO sagitta.policies (
		 sagitem
		,audit_staff_cd
		,audit_entry_dt
		,audit_time
		,audit_cd
		,audit_history_record_number
		,audit_program
		,audit_effective_dt
		,audit_change_agency_id
		,policy_number
		,named_insured
		,bill_to_cd
		,client_cd
		,policy_remark_text
		,insurer_name
		,coverage_cd
		,canc_nonrenew_renew_ind
		,policy_contract_term_cd
		,policy_effective_dt
		,policy_effective_local_standard_time_ind
		,policy_expiration_dt
		,policy_expiration_local_standard_time_ind
		,policy_original_inception_dt
		,binder_effective_dt
		,binder_start_time_ind
		,binder_expiration_dt
		,binder_expiration_time_ind
		,bill_type_cd
		,binder_purpose_cd
		,cancellation_type_cd
		,canc_nonrenew_renew_dt
		,last_premium_amt
		,last_commission_pct
		,last_commission_amt
		,new_renew_ind
		,last_transaction_id
		,last_transaction_dt
		,producer_1_cd
		,producer_2_cd
		,producer_3_cd
		,written_premium_amt
		,written_agcy_commission_amt
		,written_producer_commission_amt
		,previous_policy_id
		,next_policy_id
		,annual_premium_amt
		,annual_agency_premium_amt
		,annual_producer_premium_amt
		,division_cd
		,state_prov_cd
		,last_letter
		,audit_term_cd
		,servicer_cd
		,department_cd
		,canc_dt
		,canc_reason_cd
		,canc_evidence
		,reinstate_dt
		,reinstate_reason_cd
		,countersignature_state_prov_cd
		,sic_cd
		,date_business_started
		,nature_business_cd
		,general_info_remark_text
		,num_current_addr_yrs
		,previous_addr_1
		,previous_addr_2
		,prevoius_postal_code
		,previous_postal_extension_code
		,previous_city
		,previous_state_prov_cd
		,current_residence_dt
		,previous_residence_dt
		,birth_dt
		,tax_id
		,num_residents_in_household
		,named_individuals
		,marital_stats_cd
		,occupation_class_cd
		,occupation_desc
		,length_time_employed
		,household_income_amt
		,commercial_name
		,length_time_with_previous_employee
		,length_time_with_current_occupation
		,num_vehs_in_household
		,length_time_known_by_agent_broker
		,auto_club_member_yes_no_cd
		,umpd_rejection_yes_ne_cd
		,underins_motorist_rejection_yes_no_cd
		,any_losses_accidents_convictions_ind_yes_no_cd
		,residence_owned_rented_cd
		,co_insured_birth_dt
		,co_insured_tax_id
		,co_insured_marital_status_cd
		,co_insured_occupation_class_cd
		,co_insured_occupation_desc
		,co_insured_length_time_with_current_employer
		,co_insured_commercial_name
		,co_insured_length_time_with_previous_employer
		,co_insured_length_time_current_occupation
		,business_income_type_business_cd
		,policy_type_cd
		,integration_policy_number
		,do_not_send_to_insurlink
		,payee_cd
		,canc_last_dt
		,policy_desc
		,block_download
		,block_archive
		,policy_source
		,carrier_producer_sub_code
		,est_prem_amt
		,est_comm_pct
		,est_comm_amt
		,bor_effective_dt
		,bor_expiration_dt
		,payment_plan
		,insureds_title
		,co_insureds_title
		,insureds_first_name
		,co_insureds_first_name
		,insureds_middle_name
		,co_insureds_middle_name
		,insureds_last_name
		,co_insureds_last_name
		,insureds_suffix
		,co_insureds_suffix
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
			,policy_number
			,named_insured
			,bill_to_cd
			,client_cd
			,policy_remark_text
			,insurer_name
			,coverage_cd
			,canc_nonrenew_renew_ind
			,policy_contract_term_cd
			,policy_effective_dt
			,policy_effective_local_standard_time_ind
			,policy_expiration_dt
			,policy_expiration_local_standard_time_ind
			,policy_original_inception_dt
			,binder_effective_dt
			,binder_start_time_ind
			,binder_expiration_dt
			,binder_expiration_time_ind
			,bill_type_cd
			,binder_purpose_cd
			,cancellation_type_cd
			,canc_nonrenew_renew_dt
			,last_premium_amt
			,last_commission_pct
			,last_commission_amt
			,new_renew_ind
			,last_transaction_id
			,last_transaction_dt
			,producer_1_cd
			,producer_2_cd
			,producer_3_cd
			,written_premium_amt
			,written_agcy_commission_amt
			,written_producer_commission_amt
			,previous_policy_id
			,next_policy_id
			,annual_premium_amt
			,annual_agency_premium_amt
			,annual_producer_premium_amt
			,division_cd
			,state_prov_cd
			,last_letter
			,audit_term_cd
			,servicer_cd
			,department_cd
			,canc_dt
			,canc_reason_cd
			,canc_evidence
			,reinstate_dt
			,reinstate_reason_cd
			,countersignature_state_prov_cd
			,sic_cd
			,date_business_started
			,nature_business_cd
			,general_info_remark_text
			,num_current_addr_yrs
			,previous_addr_1
			,previous_addr_2
			,prevoius_postal_code
			,previous_postal_extension_code
			,previous_city
			,previous_state_prov_cd
			,current_residence_dt
			,previous_residence_dt
			,birth_dt
			,tax_id
			,num_residents_in_household
			,named_individuals
			,marital_stats_cd
			,occupation_class_cd
			,occupation_desc
			,length_time_employed
			,household_income_amt
			,commercial_name
			,length_time_with_previous_employee
			,length_time_with_current_occupation
			,num_vehs_in_household
			,length_time_known_by_agent_broker
			,auto_club_member_yes_no_cd
			,umpd_rejection_yes_ne_cd
			,underins_motorist_rejection_yes_no_cd
			,any_losses_accidents_convictions_ind_yes_no_cd
			,residence_owned_rented_cd
			,co_insured_birth_dt
			,co_insured_tax_id
			,co_insured_marital_status_cd
			,co_insured_occupation_class_cd
			,co_insured_occupation_desc
			,co_insured_length_time_with_current_employer
			,co_insured_commercial_name
			,co_insured_length_time_with_previous_employer
			,co_insured_length_time_current_occupation
			,business_income_type_business_cd
			,policy_type_cd
			,integration_policy_number
			,do_not_send_to_insurlink
			,payee_cd
			,canc_last_dt
			,policy_desc
			,block_download
			,block_archive
			,policy_source
			,carrier_producer_sub_code
			,est_prem_amt
			,est_comm_pct
			,est_comm_amt
			,bor_effective_dt
			,bor_expiration_dt
			,payment_plan
			,insureds_title
			,co_insureds_title
			,insureds_first_name
			,co_insureds_first_name
			,insureds_middle_name
			,co_insureds_middle_name
			,insureds_last_name
			,co_insureds_last_name
			,insureds_suffix
			,co_insureds_suffix
	FROM 	sagitta.stg_policies 
	ON CONFLICT (sagitem) DO UPDATE 
	SET 	 audit_staff_cd 									= excluded.audit_staff_cd
			,audit_entry_dt 									= excluded.audit_entry_dt
			,audit_time 										= excluded.audit_time
			,audit_cd 											= excluded.audit_cd
			,audit_history_record_number 						= excluded.audit_history_record_number
			,audit_program 										= excluded.audit_program
			,audit_effective_dt 								= excluded.audit_effective_dt
			,audit_change_agency_id 							= excluded.audit_change_agency_id
			,policy_number 										= excluded.policy_number
			,named_insured 										= excluded.named_insured
			,bill_to_cd 										= excluded.bill_to_cd
			,client_cd 											= excluded.client_cd
			,policy_remark_text 								= excluded.policy_remark_text
			,insurer_name 										= excluded.insurer_name
			,coverage_cd 										= excluded.coverage_cd
			,canc_nonrenew_renew_ind 							= excluded.canc_nonrenew_renew_ind
			,policy_contract_term_cd 							= excluded.policy_contract_term_cd
			,policy_effective_dt 								= excluded.policy_effective_dt
			,policy_effective_local_standard_time_ind 			= excluded.policy_effective_local_standard_time_ind
			,policy_expiration_dt 								= excluded.policy_expiration_dt
			,policy_expiration_local_standard_time_ind 			= excluded.policy_expiration_local_standard_time_ind
			,policy_original_inception_dt 						= excluded.policy_original_inception_dt
			,binder_effective_dt 								= excluded.binder_effective_dt
			,binder_start_time_ind 								= excluded.binder_start_time_ind
			,binder_expiration_dt 								= excluded.binder_expiration_dt
			,binder_expiration_time_ind 						= excluded.binder_expiration_time_ind
			,bill_type_cd 										= excluded.bill_type_cd
			,binder_purpose_cd 									= excluded.binder_purpose_cd
			,cancellation_type_cd 								= excluded.cancellation_type_cd
			,canc_nonrenew_renew_dt 							= excluded.canc_nonrenew_renew_dt
			,last_premium_amt 									= excluded.last_premium_amt
			,last_commission_pct 								= excluded.last_commission_pct
			,last_commission_amt 								= excluded.last_commission_amt
			,new_renew_ind 										= excluded.new_renew_ind
			,last_transaction_id 								= excluded.last_transaction_id
			,last_transaction_dt 								= excluded.last_transaction_dt
			,producer_1_cd 										= excluded.producer_1_cd
			,producer_2_cd 										= excluded.producer_2_cd
			,producer_3_cd 										= excluded.producer_3_cd
			,written_premium_amt 								= excluded.written_premium_amt
			,written_agcy_commission_amt 						= excluded.written_agcy_commission_amt
			,written_producer_commission_amt 					= excluded.written_producer_commission_amt
			,previous_policy_id 								= excluded.previous_policy_id
			,next_policy_id 									= excluded.next_policy_id
			,annual_premium_amt 								= excluded.annual_premium_amt
			,annual_agency_premium_amt 							= excluded.annual_agency_premium_amt
			,annual_producer_premium_amt 						= excluded.annual_producer_premium_amt
			,division_cd 										= excluded.division_cd
			,state_prov_cd 										= excluded.state_prov_cd
			,last_letter 										= excluded.last_letter
			,audit_term_cd 										= excluded.audit_term_cd
			,servicer_cd 										= excluded.servicer_cd
			,department_cd 										= excluded.department_cd
			,canc_dt 											= excluded.canc_dt
			,canc_reason_cd 									= excluded.canc_reason_cd
			,canc_evidence 										= excluded.canc_evidence
			,reinstate_dt 										= excluded.reinstate_dt
			,reinstate_reason_cd 								= excluded.reinstate_reason_cd
			,countersignature_state_prov_cd 					= excluded.countersignature_state_prov_cd
			,sic_cd 											= excluded.sic_cd
			,date_business_started 								= excluded.date_business_started
			,nature_business_cd 								= excluded.nature_business_cd
			,general_info_remark_text 							= excluded.general_info_remark_text
			,num_current_addr_yrs 								= excluded.num_current_addr_yrs
			,previous_addr_1 									= excluded.previous_addr_1
			,previous_addr_2 									= excluded.previous_addr_2
			,prevoius_postal_code 								= excluded.prevoius_postal_code
			,previous_postal_extension_code 					= excluded.previous_postal_extension_code
			,previous_city 										= excluded.previous_city
			,previous_state_prov_cd 							= excluded.previous_state_prov_cd
			,current_residence_dt 								= excluded.current_residence_dt
			,previous_residence_dt 								= excluded.previous_residence_dt
			,birth_dt 											= excluded.birth_dt
			,tax_id 											= excluded.tax_id
			,num_residents_in_household 						= excluded.num_residents_in_household
			,named_individuals 									= excluded.named_individuals
			,marital_stats_cd 									= excluded.marital_stats_cd
			,occupation_class_cd 								= excluded.occupation_class_cd
			,occupation_desc 									= excluded.occupation_desc
			,length_time_employed 								= excluded.length_time_employed
			,household_income_amt 								= excluded.household_income_amt
			,commercial_name 									= excluded.commercial_name
			,length_time_with_previous_employee 				= excluded.length_time_with_previous_employee
			,length_time_with_current_occupation 				= excluded.length_time_with_current_occupation
			,num_vehs_in_household 								= excluded.num_vehs_in_household
			,length_time_known_by_agent_broker 					= excluded.length_time_known_by_agent_broker
			,auto_club_member_yes_no_cd 						= excluded.auto_club_member_yes_no_cd
			,umpd_rejection_yes_ne_cd 							= excluded.umpd_rejection_yes_ne_cd
			,underins_motorist_rejection_yes_no_cd 				= excluded.underins_motorist_rejection_yes_no_cd
			,any_losses_accidents_convictions_ind_yes_no_cd 	= excluded.any_losses_accidents_convictions_ind_yes_no_cd
			,residence_owned_rented_cd 							= excluded.residence_owned_rented_cd
			,co_insured_birth_dt 								= excluded.co_insured_birth_dt
			,co_insured_tax_id 									= excluded.co_insured_tax_id
			,co_insured_marital_status_cd 						= excluded.co_insured_marital_status_cd
			,co_insured_occupation_class_cd 					= excluded.co_insured_occupation_class_cd
			,co_insured_occupation_desc 						= excluded.co_insured_occupation_desc
			,co_insured_length_time_with_current_employer 		= excluded.co_insured_length_time_with_current_employer
			,co_insured_commercial_name 						= excluded.co_insured_commercial_name
			,co_insured_length_time_with_previous_employer 		= excluded.co_insured_length_time_with_previous_employer
			,co_insured_length_time_current_occupation 			= excluded.co_insured_length_time_current_occupation
			,business_income_type_business_cd 					= excluded.business_income_type_business_cd
			,policy_type_cd 									= excluded.policy_type_cd
			,integration_policy_number 							= excluded.integration_policy_number
			,do_not_send_to_insurlink 							= excluded.do_not_send_to_insurlink
			,payee_cd 											= excluded.payee_cd
			,canc_last_dt 										= excluded.canc_last_dt
			,policy_desc 										= excluded.policy_desc
			,block_download 									= excluded.block_download
			,block_archive 										= excluded.block_archive
			,policy_source 										= excluded.policy_source
			,carrier_producer_sub_code 							= excluded.carrier_producer_sub_code
			,est_prem_amt 										= excluded.est_prem_amt
			,est_comm_pct 										= excluded.est_comm_pct
			,est_comm_amt 										= excluded.est_comm_amt
			,bor_effective_dt 									= excluded.bor_effective_dt
			,bor_expiration_dt 									= excluded.bor_expiration_dt
			,payment_plan 										= excluded.payment_plan
			,insureds_title 									= excluded.insureds_title
			,co_insureds_title 									= excluded.co_insureds_title
			,insureds_first_name 								= excluded.insureds_first_name
			,co_insureds_first_name 							= excluded.co_insureds_first_name
			,insureds_middle_name 								= excluded.insureds_middle_name
			,co_insureds_middle_name 							= excluded.co_insureds_middle_name
			,insureds_last_name 								= excluded.insureds_last_name
			,co_insureds_last_name 								= excluded.co_insureds_last_name
			,insureds_suffix 									= excluded.insureds_suffix
			,co_insureds_suffix 								= excluded.co_insureds_suffix
	WHERE 	(policies.audit_staff_cd,policies.audit_entry_dt,policies.audit_time,policies.audit_cd,policies.audit_history_record_number,policies.audit_program,policies.audit_effective_dt,policies.audit_change_agency_id,policies.policy_number,policies.named_insured,policies.bill_to_cd,policies.client_cd,policies.policy_remark_text,policies.insurer_name,policies.coverage_cd,policies.canc_nonrenew_renew_ind,policies.policy_contract_term_cd,policies.policy_effective_dt,policies.policy_effective_local_standard_time_ind,policies.policy_expiration_dt,policies.policy_expiration_local_standard_time_ind,policies.policy_original_inception_dt,policies.binder_effective_dt,policies.binder_start_time_ind,policies.binder_expiration_dt,policies.binder_expiration_time_ind,policies.bill_type_cd,policies.binder_purpose_cd,policies.cancellation_type_cd,policies.canc_nonrenew_renew_dt,policies.last_premium_amt,policies.last_commission_pct,policies.last_commission_amt,policies.new_renew_ind,policies.last_transaction_id,policies.last_transaction_dt,policies.producer_1_cd,policies.producer_2_cd,policies.producer_3_cd,policies.written_premium_amt,policies.written_agcy_commission_amt,policies.written_producer_commission_amt,policies.previous_policy_id,policies.next_policy_id,policies.annual_premium_amt,policies.annual_agency_premium_amt,policies.annual_producer_premium_amt,policies.division_cd,policies.state_prov_cd,policies.last_letter,policies.audit_term_cd,policies.servicer_cd,policies.department_cd,policies.canc_dt,policies.canc_reason_cd,policies.canc_evidence,policies.reinstate_dt,policies.reinstate_reason_cd,policies.countersignature_state_prov_cd,policies.sic_cd,policies.date_business_started,policies.nature_business_cd,policies.general_info_remark_text,policies.num_current_addr_yrs,policies.previous_addr_1,policies.previous_addr_2,policies.prevoius_postal_code,policies.previous_postal_extension_code,policies.previous_city,policies.previous_state_prov_cd,policies.current_residence_dt,policies.previous_residence_dt,policies.birth_dt,policies.tax_id,policies.num_residents_in_household,policies.named_individuals,policies.marital_stats_cd,policies.occupation_class_cd,policies.occupation_desc,policies.length_time_employed,policies.household_income_amt,policies.commercial_name,policies.length_time_with_previous_employee,policies.length_time_with_current_occupation,policies.num_vehs_in_household,policies.length_time_known_by_agent_broker,policies.auto_club_member_yes_no_cd,policies.umpd_rejection_yes_ne_cd,policies.underins_motorist_rejection_yes_no_cd,policies.any_losses_accidents_convictions_ind_yes_no_cd,policies.residence_owned_rented_cd,policies.co_insured_birth_dt,policies.co_insured_tax_id,policies.co_insured_marital_status_cd,policies.co_insured_occupation_class_cd,policies.co_insured_occupation_desc,policies.co_insured_length_time_with_current_employer,policies.co_insured_commercial_name,policies.co_insured_length_time_with_previous_employer,policies.co_insured_length_time_current_occupation,policies.business_income_type_business_cd,policies.policy_type_cd,policies.integration_policy_number,policies.do_not_send_to_insurlink,policies.payee_cd,policies.canc_last_dt,policies.policy_desc,policies.block_download,policies.block_archive,policies.policy_source,policies.carrier_producer_sub_code,policies.est_prem_amt,policies.est_comm_pct,policies.est_comm_amt,policies.bor_effective_dt,policies.bor_expiration_dt,policies.payment_plan,policies.insureds_title,policies.co_insureds_title,policies.insureds_first_name,policies.co_insureds_first_name,policies.insureds_middle_name,policies.co_insureds_middle_name,policies.insureds_last_name,policies.co_insureds_last_name,policies.insureds_suffix,policies.co_insureds_suffix)
		IS DISTINCT FROM 	(excluded.audit_staff_cd,excluded.audit_entry_dt,excluded.audit_time,excluded.audit_cd,excluded.audit_history_record_number,excluded.audit_program,excluded.audit_effective_dt,excluded.audit_change_agency_id,excluded.policy_number,excluded.named_insured,excluded.bill_to_cd,excluded.client_cd,excluded.policy_remark_text,excluded.insurer_name,excluded.coverage_cd,excluded.canc_nonrenew_renew_ind,excluded.policy_contract_term_cd,excluded.policy_effective_dt,excluded.policy_effective_local_standard_time_ind,excluded.policy_expiration_dt,excluded.policy_expiration_local_standard_time_ind,excluded.policy_original_inception_dt,excluded.binder_effective_dt,excluded.binder_start_time_ind,excluded.binder_expiration_dt,excluded.binder_expiration_time_ind,excluded.bill_type_cd,excluded.binder_purpose_cd,excluded.cancellation_type_cd,excluded.canc_nonrenew_renew_dt,excluded.last_premium_amt,excluded.last_commission_pct,excluded.last_commission_amt,excluded.new_renew_ind,excluded.last_transaction_id,excluded.last_transaction_dt,excluded.producer_1_cd,excluded.producer_2_cd,excluded.producer_3_cd,excluded.written_premium_amt,excluded.written_agcy_commission_amt,excluded.written_producer_commission_amt,excluded.previous_policy_id,excluded.next_policy_id,excluded.annual_premium_amt,excluded.annual_agency_premium_amt,excluded.annual_producer_premium_amt,excluded.division_cd,excluded.state_prov_cd,excluded.last_letter,excluded.audit_term_cd,excluded.servicer_cd,excluded.department_cd,excluded.canc_dt,excluded.canc_reason_cd,excluded.canc_evidence,excluded.reinstate_dt,excluded.reinstate_reason_cd,excluded.countersignature_state_prov_cd,excluded.sic_cd,excluded.date_business_started,excluded.nature_business_cd,excluded.general_info_remark_text,excluded.num_current_addr_yrs,excluded.previous_addr_1,excluded.previous_addr_2,excluded.prevoius_postal_code,excluded.previous_postal_extension_code,excluded.previous_city,excluded.previous_state_prov_cd,excluded.current_residence_dt,excluded.previous_residence_dt,excluded.birth_dt,excluded.tax_id,excluded.num_residents_in_household,excluded.named_individuals,excluded.marital_stats_cd,excluded.occupation_class_cd,excluded.occupation_desc,excluded.length_time_employed,excluded.household_income_amt,excluded.commercial_name,excluded.length_time_with_previous_employee,excluded.length_time_with_current_occupation,excluded.num_vehs_in_household,excluded.length_time_known_by_agent_broker,excluded.auto_club_member_yes_no_cd,excluded.umpd_rejection_yes_ne_cd,excluded.underins_motorist_rejection_yes_no_cd,excluded.any_losses_accidents_convictions_ind_yes_no_cd,excluded.residence_owned_rented_cd,excluded.co_insured_birth_dt,excluded.co_insured_tax_id,excluded.co_insured_marital_status_cd,excluded.co_insured_occupation_class_cd,excluded.co_insured_occupation_desc,excluded.co_insured_length_time_with_current_employer,excluded.co_insured_commercial_name,excluded.co_insured_length_time_with_previous_employer,excluded.co_insured_length_time_current_occupation,excluded.business_income_type_business_cd,excluded.policy_type_cd,excluded.integration_policy_number,excluded.do_not_send_to_insurlink,excluded.payee_cd,excluded.canc_last_dt,excluded.policy_desc,excluded.block_download,excluded.block_archive,excluded.policy_source,excluded.carrier_producer_sub_code,excluded.est_prem_amt,excluded.est_comm_pct,excluded.est_comm_amt,excluded.bor_effective_dt,excluded.bor_expiration_dt,excluded.payment_plan,excluded.insureds_title,excluded.co_insureds_title,excluded.insureds_first_name,excluded.co_insureds_first_name,excluded.insureds_middle_name,excluded.co_insureds_middle_name,excluded.insureds_last_name,excluded.co_insureds_last_name,excluded.insureds_suffix,excluded.co_insureds_suffix); 
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_policies_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_policies_upsert() TO rl_sagitta_x;
GO 

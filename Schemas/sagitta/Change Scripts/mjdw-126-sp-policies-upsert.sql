DROP FUNCTION IF EXISTS sagitta.sp_policies_upsert(int, text);

CREATE OR REPLACE FUNCTION sagitta.sp_policies_upsert(_sagitem int, _xmldata TEXT)
RETURNS int 
LANGUAGE plpgsql
AS $$

DECLARE rc int;

BEGIN 
	rc := 0;

	WITH xmldata AS (SELECT _xmldata::XML AS exemel)
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
		,prevoius_policy_id
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
	SELECT 	 _sagitem 	AS sagitem
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/AuditInd/AuditDetail/AuditStaffCd/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 				                        AS audit_staff_cd 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/AuditInd/AuditDetail/AuditEntryDt/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&')::int 			                        AS audit_entry_dt 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/AuditInd/AuditDetail/AuditTime/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&')::int 				                        AS audit_time 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/AuditInd/AuditDetail/AuditCd/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 					                        AS audit_cd 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/AuditInd/AuditDetail/AuditHistoryRecordNumber/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 	                        AS audit_history_record_number 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/AuditInd/AuditDetail/AuditProgram/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 				                        AS audit_program 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/AuditInd/AuditDetail/AuditEffectiveDt/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 			                        AS audit_effective_dt 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/AuditInd/AuditDetail/AuditChangeAgencyId/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 		                        AS audit_change_agency_id 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/PolicyNumber/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 									                        AS policy_number 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/NamedInsured/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 									                        AS named_insured 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/BillToCd/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 										                        AS bill_to_cd 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/ClientCd/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&')::int 									                        AS client_cd 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/PolicyRemarkText/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 								                        AS policy_remark_text 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/InsurerName/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 										                        AS insurer_name 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/CoverageCd/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&')::int 									                        AS coverage_cd 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/CancNonrenewRenewInd/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 							                        AS canc_nonrenew_renew_ind 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/PolicyContractTermCd/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 							                        AS policy_contract_term_cd 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/PolicyEffectiveDt/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 								                        AS policy_effective_dt 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/PolicyEffectiveLocalStandardTimeInd/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 				                        AS policy_effective_local_standard_time_ind 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/PolicyExpirationDt/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&')::int 							                        AS policy_expiration_dt 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/PolicyExpirationLocalStandardTimeInd/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 			                        AS policy_expiration_local_standard_time_ind 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/PolicyOriginalInceptionDt/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 						                        AS policy_original_inception_dt 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/BinderEffectiveDt/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 								                        AS binder_effective_dt 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/BinderStartTimeInd/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 								                        AS binder_start_time_ind 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/BinderExpirationDt/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 								                        AS binder_expiration_dt 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/BinderExpirationTimeInd/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 							                        AS binder_expiration_time_ind 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/BillTypeCd/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 										                        AS bill_type_cd 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/BinderPurposeCd/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 									                        AS binder_purpose_cd 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/CancellationTypeCd/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 								                        AS cancellation_type_cd 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/CancNonrenewRenewDt/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 								                        AS canc_nonrenew_renew_dt 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/LastPremiumAmt/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 									                        AS last_premium_amt 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/LastCommissionPct/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 								                        AS last_commission_pct 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/LastCommissionAmt/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 								                        AS last_commission_amt 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/NewRenewInd/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 										                        AS new_renew_ind 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/LastTransactionInd/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 								                        AS last_transaction_ind
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/LastTransactionDt/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 								                        AS last_transaction_dt 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/Producer/Producer1Cd/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 							                        AS producer_1_cd 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/Producer/Producer2Cd/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 							                        AS producer_2_cd 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/Producer/Producer3Cd/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 							                        AS producer_3_cd 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/WrittenPremiumAmt/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 								                        AS written_premium_amt 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/WrittenAgcyCommissionAmt/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 						                        AS written_agcy_commission_amt 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/WrittenProducerCommissionAmt/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 					                        AS written_producer_commission_amt 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/PreviousPolicyId/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 								                        AS previous_policy_id 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/NextPolicyId/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 									                        AS next_policy_id 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/AnnualPremiumAmt/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 								                        AS annual_premium_amt 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/AnnualAgencyPremiumAmt/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 							                        AS annual_agency_premium_amt 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/AnnualProducerPremiumAmt/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 						                        AS annual_producer_premium_amt 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/DivisionCd/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 										                        AS division_cd 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/StateProvCd/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 										                        AS state_prov_cd 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/LastLetter/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 										                        AS last_letter 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/AuditTermCd/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 										                        AS audit_term_cd 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/ServicerCd/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 										                        AS servicer_cd 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/DepartmentCd/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 									                        AS department_cd 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/CancDt/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 											                        AS canc_dt 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/CancReasonCd/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 									                        AS canc_reason_cd 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/CancEvidence/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 									                        AS canc_evidence 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/ReinstateDt/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 										                        AS reinstate_dt 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/ReinstateReasonCd/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 								                        AS reinstate_reason_cd 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/CountersignatureStateProvCd/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 						                        AS countersignature_state_prov_cd 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/SICCd/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&')::int 										                        AS sic_cd 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/DateBusinessStarted/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 								                        AS date_business_started 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/NatureBusinessCd/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 								                        AS nature_business_cd 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/GeneralInfoRemarkText/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 							                        AS general_info_remark_text 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/PersonalSupplementalInfo/NumCurrentAddrYrs/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 		                        AS num_current_addr_yrs  
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/PersonalSupplementalInfo/PreviousAddr1/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 							        AS previous_addr_1 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/PersonalSupplementalInfo/PreviousAddr2/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 							        AS previous_addr_2 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/PersonalSupplementalInfo/PreviousPostalCd/PreviousPostalCode/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 	        AS num_current_addr_yrs 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/PersonalSupplementalInfo/PreviousPostalCd/PreviousPostalExtensionCode/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 	AS previous_postal_extension_code 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/PersonalSupplementalInfo/PreviousCity/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 									AS previous_city 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/PersonalSupplementalInfo/PreviousStateProvCd/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 							AS previous_state_prov_cd 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/PersonalSupplementalInfo/CurrentResidenceDt/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 								AS current_residence_dt 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/PersonalSupplementalInfo/PreviousResidenceDt/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 							AS previous_residence_dt 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/InsuredInfo/BirthDt/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 														AS birth_dt 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/InsuredInfo/TaxId/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 														AS tax_id 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/InsuredInfo/NumResidentsInHousehold/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 										AS num_residents_in_household 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/InsuredInfo/NamedIndividuals/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 											AS named_individuals 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/InsuredInfo/MaritalStatusCd/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 												AS marital_status_cd 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/InsuredInfo/OccupationClassCd/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 											AS occupation_class_cd 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/InsuredInfo/OccupationDesc/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 												AS occupation_desc 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/InsuredInfo/LengthTimeEmployed/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 											AS length_time_employed 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/InsuredInfo/HouseholdIncomeAmt/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 											AS household_income_amt 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/InsuredInfo/CommercialName/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 												AS commercial_name 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/InsuredInfo/LengthTimeWithPreviousEmployee/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 								AS length_time_with_previous_employee 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/InsuredInfo/LengthTimeWithCurrentOccupation/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 								AS length_time_with_current_occupation 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/General1QuestionCd/NumVehsInHousehold/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 									AS num_vehs_in_household 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/General1QuestionCd/LengthTimeKnownByAgentBroker/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 							AS length_time_known_by_agent_broker 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/General1QuestionCd/AutoClubMemberYesNoCd/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 								AS auto_club_member_yes_no_cd 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/General1QuestionCd/UMPDRejectionYesNeCd/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 									AS umpd_rejection_yes_ne_cd 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/General1QuestionCd/UnderinsMotoristRejectionYesNoCd/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 						AS underins_motorist_rejection_yes_no_cd 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/General1QuestionCd/AnyLossesAccidentsConvictionsIndYesNoCd/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 				AS any_losses_accidents_convictions_ind_yes_no_cd 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/General1QuestionCd/ResidenceOwnedRentedCd/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 								AS residence_owned_rented_cd 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/CoInsuredInfo/CoInsuredBirthDt/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 											AS co_insured_birth_dt 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/CoInsuredInfo/CoInsuredTaxId/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 											AS co_insured_tax_id 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/CoInsuredInfo/CoInsuredMaritalStatusCd/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 									AS co_insured_marital_status_cd 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/CoInsuredInfo/CoInsuredOccupationClassCd/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 								AS co_insured_occupation_class_cd 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/CoInsuredInfo/CoInsuredOccupationDesc/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 									AS co_insured_occupation_desc 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/CoInsuredInfo/CoInsuredLengthTimeWithCureentEmployer/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 					AS co_insured_length_time_with_current_employer 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/CoInsuredInfo/CoInsuredCommercialName/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 									AS co_insured_commercial_name 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/CoInsuredInfo/CoInsuredLengthTimeWithPreviousEmployer/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 					AS co_insured_length_time_with_previous_employer 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/CoInsuredInfo/CoInsuredLengthTimeCurrentOccupation/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 						AS co_insured_length_time_current_occupation 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/BusinessIncomeTypeBusinessCd/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 											AS business_income_type_business_cd 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/PolicyTypeCd/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 															AS policy_type_cd 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/IntegrationPolicyNumber/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 													AS integration_policy_number 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/DoNotSendToInsurLink/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 													AS do_not_send_to_insurlink 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/PayeeCd/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 																	AS payee_cd 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/CancLastDt/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 																AS canc_last_dt 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/PolicyDesc/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 																AS policy_desc 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/BlockDownload/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 															AS block_download 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/BlockArchive/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 															AS block_archive 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/PolicySource/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 															AS policy_source 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/CarrierProducerSubCode/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 													AS carrier_producer_sub_code 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/EstPremAmt/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 																AS est_prem_amt 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/EstCommPct/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 																AS est_comm_pct 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/EstCommAmt/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 																AS est_comm_amt 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/BOREffectiveDt/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 															AS bor_effective_dt 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/BORExpirationDt/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 															AS bor_expiration_dt 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/Paymentplan/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 																AS payment_plan 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/TitleInfo/InsuredsTitle/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 													AS insureds_title 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/TitleInfo/CoInsuredsTitle/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 												AS co_insureds_title 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/FirstNameInfo/InsuredsFirstName/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 											AS insureds_first_name 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/FirstNameInfo/CoInsuredsFirstName/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 										AS co_insureds_first_name
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/MiddleNameInfo/InsuredsMiddleName/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 										AS insureds_middle_name
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/MiddleNameInfo/CoInsuredsMiddleName/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 										AS co_insureds_middle_name
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/LastNameInfo/InsuredsLastName/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 											AS insureds_last_name
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/LastNameInfo/CoInsuredsLastName/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 											AS co_insureds_last_name
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/SuffixInfo/InsuredsSuffix/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 												AS insureds_suffix 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/SuffixInfo/CoInsuredsSuffix/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 												AS co_insureds_suffix
	FROM	xmldata 
	ON CONFLICT (sagitem) DO UPDATE 
	SET 	 audit_staff_cd                                     = excluded.audit_staff_cd
			,audit_entry_dt                                     = excluded.audit_entry_dt
			,audit_time                                         = excluded.audit_time
			,audit_cd                                           = excluded.audit_cd
			,audit_history_record_number                        = excluded.audit_history_record_number
			,audit_program                                      = excluded.audit_program
			,audit_effective_dt                                 = excluded.audit_effective_dt
			,audit_change_agency_id                             = excluded.audit_change_agency_id
			,policy_number                                      = excluded.policy_number
			,named_insured                                      = excluded.named_insured
			,bill_to_cd                                         = excluded.bill_to_cd
			,client_cd                                          = excluded.client_cd
			,policy_remark_text                                 = excluded.policy_remark_text
			,insurer_name                                       = excluded.insurer_name
			,coverage_cd                                        = excluded.coverage_cd
			,canc_nonrenew_renew_ind                            = excluded.canc_nonrenew_renew_ind
			,policy_contract_term_cd                            = excluded.policy_contract_term_cd
			,policy_effective_dt                                = excluded.policy_effective_dt
			,policy_effective_local_standard_time_ind           = excluded.policy_effective_local_standard_time_ind
			,policy_expiration_dt                               = excluded.policy_expiration_dt
			,policy_expiration_local_standard_time_ind          = excluded.policy_expiration_local_standard_time_ind
			,policy_original_inception_dt                       = excluded.policy_original_inception_dt
			,binder_effective_dt                                = excluded.binder_effective_dt
			,binder_start_time_ind                              = excluded.binder_start_time_ind
			,binder_expiration_dt                               = excluded.binder_expiration_dt
			,binder_expiration_time_ind                         = excluded.binder_expiration_time_ind
			,bill_type_cd                                       = excluded.bill_type_cd
			,binder_purpose_cd                                  = excluded.binder_purpose_cd
			,cancellation_type_cd                               = excluded.cancellation_type_cd
			,canc_nonrenew_renew_dt                             = excluded.canc_nonrenew_renew_dt
			,last_premium_amt                                   = excluded.last_premium_amt
			,last_commission_pct                                = excluded.last_commission_pct
			,last_commission_amt                                = excluded.last_commission_amt
			,new_renew_ind                                      = excluded.new_renew_ind
			,last_transaction_id                                = excluded.last_transaction_id
			,last_transaction_dt                                = excluded.last_transaction_dt
			,producer_1_cd                                      = excluded.producer_1_cd
			,producer_2_cd                                      = excluded.producer_2_cd
			,producer_3_cd                                      = excluded.producer_3_cd
			,written_premium_amt                                = excluded.written_premium_amt
			,written_agcy_commission_amt                        = excluded.written_agcy_commission_amt
			,written_producer_commission_amt                    = excluded.written_producer_commission_amt
			,prevoius_policy_id                                 = excluded.prevoius_policy_id
			,next_policy_id                                     = excluded.next_policy_id
			,annual_premium_amt                                 = excluded.annual_premium_amt
			,annual_agency_premium_amt                          = excluded.annual_agency_premium_amt
			,annual_producer_premium_amt                        = excluded.annual_producer_premium_amt
			,division_cd                                        = excluded.division_cd
			,state_prov_cd                                      = excluded.state_prov_cd
			,last_letter                                        = excluded.last_letter
			,audit_term_cd                                      = excluded.audit_term_cd
			,servicer_cd                                        = excluded.servicer_cd
			,department_cd                                      = excluded.department_cd
			,canc_dt                                            = excluded.canc_dt
			,canc_reason_cd                                     = excluded.canc_reason_cd
			,canc_evidence                                      = excluded.canc_evidence
			,reinstate_dt                                       = excluded.reinstate_dt
			,reinstate_reason_cd                                = excluded.reinstate_reason_cd
			,countersignature_state_prov_cd                     = excluded.countersignature_state_prov_cd
			,sic_cd                                             = excluded.sic_cd
			,date_business_started                              = excluded.date_business_started
			,nature_business_cd                                 = excluded.nature_business_cd
			,general_info_remark_text                           = excluded.general_info_remark_text
			,num_current_addr_yrs                               = excluded.num_current_addr_yrs
			,previous_addr_1                                    = excluded.previous_addr_1
			,previous_addr_2                                    = excluded.previous_addr_2
			,prevoius_postal_code                               = excluded.prevoius_postal_code
			,previous_postal_extension_code                     = excluded.previous_postal_extension_code
			,previous_city                                      = excluded.previous_city
			,previous_state_prov_cd                             = excluded.previous_state_prov_cd
			,current_residence_dt                               = excluded.current_residence_dt
			,previous_residence_dt                              = excluded.previous_residence_dt
			,birth_dt                                           = excluded.birth_dt
			,tax_id                                             = excluded.tax_id
			,num_residents_in_household                         = excluded.num_residents_in_household
			,named_individuals                                  = excluded.named_individuals
			,marital_stats_cd                                   = excluded.marital_stats_cd
			,occupation_class_cd                                = excluded.occupation_class_cd
			,occupation_desc                                    = excluded.occupation_desc
			,length_time_employed                               = excluded.length_time_employed
			,household_income_amt                               = excluded.household_income_amt
			,commercial_name                                    = excluded.commercial_name
			,length_time_with_previous_employee                 = excluded.length_time_with_previous_employee
			,length_time_with_current_occupation                = excluded.length_time_with_current_occupation
			,num_vehs_in_household                              = excluded.num_vehs_in_household
			,length_time_known_by_agent_broker                  = excluded.length_time_known_by_agent_broker
			,auto_club_member_yes_no_cd                         = excluded.auto_club_member_yes_no_cd
			,umpd_rejection_yes_ne_cd                           = excluded.umpd_rejection_yes_ne_cd
			,underins_motorist_rejection_yes_no_cd              = excluded.underins_motorist_rejection_yes_no_cd
			,any_losses_accidents_convictions_ind_yes_no_cd     = excluded.any_losses_accidents_convictions_ind_yes_no_cd
			,residence_owned_rented_cd                          = excluded.residence_owned_rented_cd
			,co_insured_birth_dt                                = excluded.co_insured_birth_dt
			,co_insured_tax_id                                  = excluded.co_insured_tax_id
			,co_insured_marital_status_cd                       = excluded.co_insured_marital_status_cd
			,co_insured_occupation_class_cd                     = excluded.co_insured_occupation_class_cd
			,co_insured_occupation_desc                         = excluded.co_insured_occupation_desc
			,co_insured_length_time_with_current_employer       = excluded.co_insured_length_time_with_current_employer
			,co_insured_commercial_name                         = excluded.co_insured_commercial_name
			,co_insured_length_time_with_previous_employer      = excluded.co_insured_length_time_with_previous_employer
			,co_insured_length_time_current_occupation          = excluded.co_insured_length_time_current_occupation
			,business_income_type_business_cd                   = excluded.business_income_type_business_cd
			,policy_type_cd                                     = excluded.policy_type_cd
			,integration_policy_number                          = excluded.integration_policy_number
			,do_not_send_to_insurlink                           = excluded.do_not_send_to_insurlink
			,payee_cd                                           = excluded.payee_cd
			,canc_last_dt                                       = excluded.canc_last_dt
			,policy_desc                                        = excluded.policy_desc
			,block_download                                     = excluded.block_download
			,block_archive                                      = excluded.block_archive
			,policy_source                                      = excluded.policy_source
			,carrier_producer_sub_code                          = excluded.carrier_producer_sub_code
			,est_prem_amt                                       = excluded.est_prem_amt
			,est_comm_pct                                       = excluded.est_comm_pct
			,est_comm_amt                                       = excluded.est_comm_amt
			,bor_effective_dt                                   = excluded.bor_effective_dt
			,bor_expiration_dt                                  = excluded.bor_expiration_dt
			,payment_plan                                       = excluded.payment_plan
			,insureds_title                                     = excluded.insureds_title
			,co_insureds_title                                  = excluded.co_insureds_title
			,insureds_first_name                                = excluded.insureds_first_name
			,co_insureds_first_name                             = excluded.co_insureds_first_name
			,insureds_middle_name                               = excluded.insureds_middle_name
			,co_insureds_middle_name                            = excluded.co_insureds_middle_name
			,insureds_last_name                                 = excluded.insureds_last_name
			,co_insureds_last_name                              = excluded.co_insureds_last_name
			,insureds_suffix                                    = excluded.insureds_suffix
			,co_insureds_suffix                                 = excluded.co_insureds_suffix
			,modify_dt 											= timezone('utc'::TEXT, clock_timestamp())
	WHERE 	(policies.audit_staff_cd,policies.audit_entry_dt,policies.audit_time,policies.audit_cd,policies.audit_history_record_number,policies.audit_program,policies.audit_effective_dt,policies.audit_change_agency_id,policies.policy_number,policies.named_insured,policies.bill_to_cd,policies.client_cd,policies.policy_remark_text,policies.insurer_name,policies.coverage_cd,policies.canc_nonrenew_renew_ind,policies.policy_contract_term_cd,policies.policy_effective_dt,policies.policy_effective_local_standard_time_ind,policies.policy_expiration_dt,policies.policy_expiration_local_standard_time_ind,policies.policy_original_inception_dt,policies.binder_effective_dt,policies.binder_start_time_ind,policies.binder_expiration_dt,policies.binder_expiration_time_ind,policies.bill_type_cd,policies.binder_purpose_cd,policies.cancellation_type_cd,policies.canc_nonrenew_renew_dt,policies.last_premium_amt,policies.last_commission_pct,policies.last_commission_amt,policies.new_renew_ind,policies.last_transaction_id,policies.last_transaction_dt,policies.producer_1_cd,policies.producer_2_cd,policies.producer_3_cd,policies.written_premium_amt,policies.written_agcy_commission_amt,policies.written_producer_commission_amt,policies.prevoius_policy_id,policies.next_policy_id,policies.annual_premium_amt,policies.annual_agency_premium_amt,policies.annual_producer_premium_amt,policies.division_cd,policies.state_prov_cd,policies.last_letter,policies.audit_term_cd,policies.servicer_cd,policies.department_cd,policies.canc_dt,policies.canc_reason_cd,policies.canc_evidence,policies.reinstate_dt,policies.reinstate_reason_cd,policies.countersignature_state_prov_cd,policies.sic_cd,policies.date_business_started,policies.nature_business_cd,policies.general_info_remark_text,policies.num_current_addr_yrs,policies.previous_addr_1,policies.previous_addr_2,policies.prevoius_postal_code,policies.previous_postal_extension_code,policies.previous_city,policies.previous_state_prov_cd,policies.current_residence_dt,policies.previous_residence_dt,policies.birth_dt,policies.tax_id,policies.num_residents_in_household,policies.named_individuals,policies.marital_stats_cd,policies.occupation_class_cd,policies.occupation_desc,policies.length_time_employed,policies.household_income_amt,policies.commercial_name,policies.length_time_with_previous_employee,policies.length_time_with_current_occupation,policies.num_vehs_in_household,policies.length_time_known_by_agent_broker,policies.auto_club_member_yes_no_cd,policies.umpd_rejection_yes_ne_cd,policies.underins_motorist_rejection_yes_no_cd,policies.any_losses_accidents_convictions_ind_yes_no_cd,policies.residence_owned_rented_cd,policies.co_insured_birth_dt,policies.co_insured_tax_id,policies.co_insured_marital_status_cd,policies.co_insured_occupation_class_cd,policies.co_insured_occupation_desc,policies.co_insured_length_time_with_current_employer,policies.co_insured_commercial_name,policies.co_insured_length_time_with_previous_employer,policies.co_insured_length_time_current_occupation,policies.business_income_type_business_cd,policies.policy_type_cd,policies.integration_policy_number,policies.do_not_send_to_insurlink,policies.payee_cd,policies.canc_last_dt,policies.policy_desc,policies.block_download,policies.block_archive,policies.policy_source,policies.carrier_producer_sub_code,policies.est_prem_amt,policies.est_comm_pct,policies.est_comm_amt,policies.bor_effective_dt,policies.bor_expiration_dt,policies.payment_plan,policies.insureds_title,policies.co_insureds_title,policies.insureds_first_name,policies.co_insureds_first_name,policies.insureds_middle_name,policies.co_insureds_middle_name,policies.insureds_last_name,policies.co_insureds_last_name,policies.insureds_suffix,policies.co_insureds_suffix)
		IS DISTINCT FROM 	(excluded.audit_staff_cd,excluded.audit_entry_dt,excluded.audit_time,excluded.audit_cd,excluded.audit_history_record_number,excluded.audit_program,excluded.audit_effective_dt,excluded.audit_change_agency_id,excluded.policy_number,excluded.named_insured,excluded.bill_to_cd,excluded.client_cd,excluded.policy_remark_text,excluded.insurer_name,excluded.coverage_cd,excluded.canc_nonrenew_renew_ind,excluded.policy_contract_term_cd,excluded.policy_effective_dt,excluded.policy_effective_local_standard_time_ind,excluded.policy_expiration_dt,excluded.policy_expiration_local_standard_time_ind,excluded.policy_original_inception_dt,excluded.binder_effective_dt,excluded.binder_start_time_ind,excluded.binder_expiration_dt,excluded.binder_expiration_time_ind,excluded.bill_type_cd,excluded.binder_purpose_cd,excluded.cancellation_type_cd,excluded.canc_nonrenew_renew_dt,excluded.last_premium_amt,excluded.last_commission_pct,excluded.last_commission_amt,excluded.new_renew_ind,excluded.last_transaction_id,excluded.last_transaction_dt,excluded.producer_1_cd,excluded.producer_2_cd,excluded.producer_3_cd,excluded.written_premium_amt,excluded.written_agcy_commission_amt,excluded.written_producer_commission_amt,excluded.prevoius_policy_id,excluded.next_policy_id,excluded.annual_premium_amt,excluded.annual_agency_premium_amt,excluded.annual_producer_premium_amt,excluded.division_cd,excluded.state_prov_cd,excluded.last_letter,excluded.audit_term_cd,excluded.servicer_cd,excluded.department_cd,excluded.canc_dt,excluded.canc_reason_cd,excluded.canc_evidence,excluded.reinstate_dt,excluded.reinstate_reason_cd,excluded.countersignature_state_prov_cd,excluded.sic_cd,excluded.date_business_started,excluded.nature_business_cd,excluded.general_info_remark_text,excluded.num_current_addr_yrs,excluded.previous_addr_1,excluded.previous_addr_2,excluded.prevoius_postal_code,excluded.previous_postal_extension_code,excluded.previous_city,excluded.previous_state_prov_cd,excluded.current_residence_dt,excluded.previous_residence_dt,excluded.birth_dt,excluded.tax_id,excluded.num_residents_in_household,excluded.named_individuals,excluded.marital_stats_cd,excluded.occupation_class_cd,excluded.occupation_desc,excluded.length_time_employed,excluded.household_income_amt,excluded.commercial_name,excluded.length_time_with_previous_employee,excluded.length_time_with_current_occupation,excluded.num_vehs_in_household,excluded.length_time_known_by_agent_broker,excluded.auto_club_member_yes_no_cd,excluded.umpd_rejection_yes_ne_cd,excluded.underins_motorist_rejection_yes_no_cd,excluded.any_losses_accidents_convictions_ind_yes_no_cd,excluded.residence_owned_rented_cd,excluded.co_insured_birth_dt,excluded.co_insured_tax_id,excluded.co_insured_marital_status_cd,excluded.co_insured_occupation_class_cd,excluded.co_insured_occupation_desc,excluded.co_insured_length_time_with_current_employer,excluded.co_insured_commercial_name,excluded.co_insured_length_time_with_previous_employer,excluded.co_insured_length_time_current_occupation,excluded.business_income_type_business_cd,excluded.policy_type_cd,excluded.integration_policy_number,excluded.do_not_send_to_insurlink,excluded.payee_cd,excluded.canc_last_dt,excluded.policy_desc,excluded.block_download,excluded.block_archive,excluded.policy_source,excluded.carrier_producer_sub_code,excluded.est_prem_amt,excluded.est_comm_pct,excluded.est_comm_amt,excluded.bor_effective_dt,excluded.bor_expiration_dt,excluded.payment_plan,excluded.insureds_title,excluded.co_insureds_title,excluded.insureds_first_name,excluded.co_insureds_first_name,excluded.insureds_middle_name,excluded.co_insureds_middle_name,excluded.insureds_last_name,excluded.co_insureds_last_name,excluded.insureds_suffix,excluded.co_insureds_suffix);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_policies_upsert(int, TEXT) OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_policies_upsert(int, text) TO rl_sagitta_x;
GO 

CREATE TABLE sagitta.audit_insurors (
	 sagitem 										int 		NOT NULL 
	,old_audit_staff_cd 							TEXT 		NULL 
	,new_audit_staff_cd 							TEXT 		NULL 
	,old_audit_entry_dt 							int 		NULL 
	,new_audit_entry_dt 							int 		NULL 
	,old_audit_time 								int 		NULL 
	,new_audit_time 								int 		NULL 
	,old_audit_cd 									TEXT 		NULL 
	,new_audit_cd 									TEXT 		NULL 
	,old_audit_history_record_number 				TEXT 		NULL 
	,new_audit_history_record_number 				TEXT 		NULL 
	,old_audit_program 								TEXT 		NULL 
	,new_audit_program 								TEXT 		NULL 
	,old_insurer_cd 								TEXT 		NULL 
	,new_insurer_cd 								TEXT 		NULL 
	,old_insurer_name 								TEXT 		NULL 
	,new_insurer_name 								TEXT 		NULL 
	,old_payee_cd 									TEXT 		NULL 
	,new_payee_cd 									TEXT 		NULL 
	,old_addr_1 									TEXT 		NULL 
	,new_addr_1 									TEXT 		NULL 
	,old_addr_2 									TEXT 		NULL 
	,new_addr_2 									TEXT 		NULL 
	,old_postal_code 								TEXT 		NULL 
	,new_postal_code 								TEXT 		NULL 
	,old_postal_extension_code 						TEXT 		NULL 
	,new_postal_extension_code 						TEXT 		NULL 
	,old_city 										TEXT 		NULL 
	,new_city 										TEXT 		NULL 
	,old_state_prov_cd 								TEXT 		NULL 
	,new_state_prov_cd 								TEXT 		NULL 
	,old_telephone_1 								TEXT 		NULL 
	,new_telephone_1 								TEXT 		NULL 
	,old_telephone_2 								TEXT 		NULL 
	,new_telephone_2 								TEXT 		NULL 
	,old_group 										TEXT 		NULL 
	,new_group 										TEXT 		NULL 
	,old_agency_code 								TEXT 		NULL 
	,new_agency_code 								TEXT 		NULL 
	,old_phone_extension_1_number 					TEXT 		NULL 
	,new_phone_extension_1_number 					TEXT 		NULL 
	,old_company_code 								TEXT 		NULL 
	,new_company_code 								TEXT 		NULL 
	,old_phone_extension_2_number 					TEXT 		NULL 
	,new_phone_extension_2_number 					TEXT 		NULL 
	,old_naic_cd 									TEXT 		NULL 
	,new_naic_cd 									TEXT 		NULL 
	,old_fax_number 								TEXT 		NULL 
	,new_fax_number 								TEXT 		NULL 
	,old_type 										TEXT 		NULL 
	,new_type 										TEXT 		NULL 
	,old_obsolete_41 								TEXT 		NULL 
	,new_obsolete_41 								TEXT 		NULL 
	,old_date_off 									TEXT 		NULL 
	,new_date_off 									TEXT 		NULL 
	,old_date_off_remark 							TEXT 		NULL 
	,new_date_off_remark 							TEXT 		NULL 
	,old_email_addr 								TEXT 		NULL 
	,new_email_addr 								TEXT 		NULL 
	,old_rounding_difference 						TEXT 		NULL 
	,new_rounding_difference 						TEXT 		NULL 
	,old_description 								TEXT 		NULL 
	,new_description 								TEXT 		NULL 
	,old_global 									TEXT 		NULL 
	,new_global 									TEXT 		NULL 
	,old_am_best_number 							TEXT 		NULL 
	,new_am_best_number 							TEXT 		NULL 
	,old_bests_financial_strength 					TEXT 		NULL 
	,new_bests_financial_strength 					TEXT 		NULL 
	,old_bests_financial_size 						TEXT 		NULL 
	,new_bests_financial_size 						TEXT 		NULL 
	,old_state_of_domicile 							TEXT 		NULL 
	,new_state_of_domicile 							TEXT 		NULL 
	,old_amb_company_name 							TEXT 		NULL 
	,new_amb_company_name 							TEXT 		NULL 
	,old_amb_parent_number 							TEXT 		NULL 
	,new_amb_parent_number 							TEXT 		NULL 
	,old_financial_strength_outlook 				TEXT 		NULL 
	,new_financial_strength_outlook 				TEXT 		NULL 
	,old_financial_strength_action 					TEXT 		NULL 
	,new_financial_strength_action 					TEXT 		NULL 
	,old_fein 										TEXT 		NULL 
	,new_fein 										TEXT 		NULL 
	,old_amb_last_update 							TEXT 		NULL 
	,new_amb_last_update 							TEXT 		NULL 
	,old_auto_id_claim_reporting_phone_number 		TEXT 		NULL 
	,new_auto_id_claim_reporting_phone_number 		TEXT 		NULL 
	,old_auto_id_claim_reporting_phone_extension 	TEXT 		NULL 
	,new_auto_id_claim_reporting_phone_extension 	TEXT 		NULL 
	,audit_action 									char(1) 	NOT NULL 
	,audit_user 									TEXT 		NOT NULL 	DEFAULT current_user 
	,audit_timestamp 								timestamp 	NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 										bigint 		NOT NULL 	GENERATED ALWAYS AS IDENTITY 	PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.audit_insurors OWNER TO mj_admin;
GO 

GRANT INSERT ON sagitta.audit_insurors TO rl_sagitta_a;
GO 
CREATE TABLE sagitta.audit_clients (
	 sagitem                                		int 		NOT NULL
	,old_audit_staff_cd 							text 			null 
	,new_audit_staff_cd 							text 			null 
	,old_audit_entry_dt 							int 			null 
	,new_audit_entry_dt 							int 			null 
	,old_audit_time 								int 			null 
	,new_audit_time 								int 			null 
	,old_audit_cd 									text 			null 
	,new_audit_cd 									text 			null 
	,old_audit_history_record_number 				text 			null 
	,new_audit_history_record_number 				text 			null 
	,old_audit_program 								text 			null 
	,new_audit_program 								text 			null 
	,old_audit_effective_dt 						text 			null 
	,new_audit_effective_dt 						text 			null 
	,old_audit_change_agency_id 					text 			null 
	,new_audit_change_agency_id 					text 			null 
	,old_client_cd 									text 			null 
	,new_client_cd 									text 			null 
	,old_client_name 								text 			null 
	,new_client_name 								text 			null 
	,old_bill_to_code 								text 			null 
	,new_bill_to_code 								text 			null 
	,old_addr_1 									text 			null 
	,new_addr_1 									text 			null 
	,old_addr_2 									text 			null 
	,new_addr_2 									text 			null 
	,old_postal_code 								text 			null 
	,new_postal_code 								text 			null 
	,old_postal_extension_code 						text 			null 
	,new_postal_extension_code 						text 			null 
	,old_city 										text 			null 
	,new_city 										text 			null 
	,old_state_prov_cd 								text 			null 
	,new_state_prov_cd 								text 			null 
	,old_phone_1_number 							text 			null 
	,new_phone_1_number 							text 			null 
	,old_phone_2_number 							text 			null 
	,new_phone_2_number 							text 			null 
	,old_reference_cd 								text 			null 
	,new_reference_cd 								text 			null 
	,old_status_cd 									text 			null 
	,new_status_cd 									text 			null 
	,old_producer_1_cd 								text 			null 
	,new_producer_1_cd 								text 			null 
	,old_producer_2_cd 								text 			null 
	,new_producer_2_cd 								text 			null 
	,old_producer_3_cd 								text 			null 
	,new_producer_3_cd 								text 			null 
	,old_servicer_1_cd 								text 			null 
	,new_servicer_1_cd 								text 			null 
	,old_servicer_2_cd 								text 			null 
	,new_servicer_2_cd 								text 			null 
	,old_servicer_3_cd 								text 			null 
	,new_servicer_3_cd 								text 			null 
	,old_credit_terms 								text 			null 
	,new_credit_terms 								text 			null 
	,old_source_cd 									text 			null 
	,new_source_cd 									text 			null 
	,old_source_dt 									text 			null 
	,new_source_dt 									text 			null 
	,old_cat_1_cd 									text 			null 
	,new_cat_1_cd 									text 			null 
	,old_cat_2_cd 									text 			null 
	,new_cat_2_cd 									text 			null 
	,old_cat_3_cd 									text 			null 
	,new_cat_3_cd 									text 			null 
	,old_cat_4_cd 									text 			null 
	,new_cat_4_cd 									text 			null 
	,old_cat_5_cd 									text 			null 
	,new_cat_5_cd 									text 			null 
	,old_net_commission_pct 						text 			null 
	,new_net_commission_pct 						text 			null 
	,old_contact_method 							text 			null 
	,new_contact_method 							text 			null 
	,old_sic_cd 									text 			null 
	,new_sic_cd 									text 			null 
	,old_collection_comments 						text 			null 
	,new_collection_comments 						text 			null 
	,old_remark_text 								text 			null 
	,new_remark_text 								text 			null 
	,old_phone_1_extension_number 					text 			null 
	,new_phone_1_extension_number 					text 			null 
	,old_phone_2_extension_number 					text 			null 
	,new_phone_2_extension_number 					text 			null 
	,old_fax_number 								text 			null 
	,new_fax_number 								text 			null 
	,old_pro_sus_cd 								text 			null 
	,new_pro_sus_cd 								text 			null 
	,old_date_business_started 						text 			null 
	,new_date_business_started 						text 			null 
	,old_business_nature 							text 			null 
	,new_business_nature 							text 			null 
	,old_inspection_contact 						text 			null 
	,new_inspection_contact 						text 			null 
	,old_inspection_phone_number 					text 			null 
	,new_inspection_phone_number 					text 			null 
	,old_inspection_phone_extension_number 			text 			null 
	,new_inspection_phone_extension_number 			text 			null 
	,old_accounting_contact 						text 			null 
	,new_accounting_contact 						text 			null 
	,old_accounting_phone_number 					text 			null 
	,new_accounting_phone_number 					text 			null 
	,old_accounting_phone_extension_number 			text 			null 
	,new_accounting_phone_extension_number 			text 			null 
	,old_legal_entity_cd 							text 			null 
	,new_legal_entity_cd 							text 			null 
	,old_email_addr 								text 			null 
	,new_email_addr 								text 			null 
	,old_web_site_link 								text 			null 
	,new_web_site_link 								text 			null 
	,old_division_number 							text 			null 
	,new_division_number 							text 			null 
	,old_parent_client 								text 			null 
	,new_parent_client 								text 			null 
	,old_parent_rel_cd 								text 			null 
	,new_parent_rel_cd 								text 			null 
	,old_relation_client 							text 			null 
	,new_relation_client 							text 			null 
	,old_relation_cd 								text 			null 
	,new_relation_cd 								text 			null 
	,old_fein 										text 			null 
	,new_fein 										text 			null 
	,old_insp_email 								text 			null 
	,new_insp_email 								text 			null 
	,old_acct_email 								text 			null 
	,new_acct_email 								text 			null 
	,old_no_members 								text 			null 
	,new_no_members 								text 			null 
	,old_integration_client_name 					text 			null 
	,new_integration_client_name 					text 			null 
	,audit_action 									char(1) 		NOT NULL
	,audit_user 									text 			NOT NULL 	DEFAULT CURRENT_USER
	,audit_timestamp 								timestamp 		NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 										bigint 			NOT NULL 	GENERATED ALWAYS AS IDENTITY 	PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.audit_clients OWNER TO mj_admin;
GO 

GRANT INSERT ON TABLE sagitta.audit_clients TO rl_sagitta_a;
GO 

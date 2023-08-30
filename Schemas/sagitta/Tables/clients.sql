DROP TABLE IF EXISTS sagitta.clients;
GO 

CREATE TABLE sagitta.clients (
	 sagitem 	                        		int 	    	not null 
	,audit_staff_cd 							text 			null 
	,audit_entry_dt 							int 			null 
	,audit_time 								int 			null 
	,audit_cd 									text 			null 
	,audit_history_record_number 				text 			null 
	,audit_program 								text 			null 
	,audit_effective_dt 						text 			null 
	,audit_change_agency_id 					text 			null 
	,client_cd 									text 			null 
	,client_name 								text 			null 
	,bill_to_code 								text 			null 
	,addr_1 									text 			null 
	,addr_2 									text 			null 
	,postal_code 								text 			null 
	,postal_extension_code 						text 			null 
	,city 										text 			null 
	,state_prov_cd 								text 			null 
	,phone_1_number 							text 			null 
	,phone_2_number 							text 			null 
	,reference_cd 								text 			null 
	,status_cd 									text 			null 
	,producer_1_cd 								text 			null 
	,producer_2_cd 								text 			null 
	,producer_3_cd 								text 			null 
	,servicer_1_cd 								text 			null 
	,servicer_2_cd 								text 			null 
	,servicer_3_cd 								text 			null 
	,credit_terms 								text 			null 
	,source_cd 									text 			null 
	,source_dt 									text 			null 
	,cat_1_cd 									text 			null 
	,cat_2_cd 									text 			null 
	,cat_3_cd 									text 			null 
	,cat_4_cd 									text 			null 
	,cat_5_cd 									text 			null 
	,net_commission_pct 						text 			null 
	,contact_method 							text 			null 
	,sic_cd 									text 			null 
	,collection_comments 						text 			null 
	,remark_text 								text 			null 
	,phone_1_extension_number 					text 			null 
	,phone_2_extension_number 					text 			null 
	,fax_number 								text 			null 
	,pro_sus_cd 								text 			null 
	,date_business_started 						text 			null 
	,business_nature 							text 			null 
	,inspection_contact 						text 			null 
	,inspection_phone_number 					text 			null 
	,inspection_phone_extension_number 			text 			null 
	,accounting_contact 						text 			null 
	,accounting_phone_number 					text 			null 
	,accounting_phone_extension_number 			text 			null 
	,legal_entity_cd 							text 			null 
	,email_addr 								text 			null 
	,web_site_link 								text 			null 
	,division_number 							text 			null 
	,parent_client 								text 			null 
	,parent_rel_cd 								text 			null 
	,relation_client 							text 			null 
	,relation_cd 								text 			null 
	,fein 										text 			null 
	,insp_email 								text 			null 
	,acct_email 								text 			null 
	,no_members 								text 			null 
	,integration_client_name 					text 			null 
	,CONSTRAINT clients_pkey PRIMARY KEY (sagitem) 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.clients OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE sagitta.clients TO rl_sagitta_r;
GO 

GRANT INSERT ON TABLE sagitta.clients TO rl_sagitta_a;
GO 

GRANT UPDATE ON TABLE sagitta.clients TO rl_sagitta_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON sagitta.clients FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_clients_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON sagitta.clients FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_clients_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON sagitta.clients FOR EACH ROW WHEN (NEW IS DISTINCT FROM OLD) EXECUTE FUNCTION sagitta.tr_audit_clients_u();
GO 

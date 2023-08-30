/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE sagitta.clients 
	 DROP CONSTRAINT IF EXISTS clients_pkey 
	,ADD CONSTRAINT clients_sagitem_uq 	UNIQUE (sagitem)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON sagitta.clients; 
GO
DROP TRIGGER IF EXISTS audit_i ON sagitta.clients; 
GO
DROP TRIGGER IF EXISTS audit_u ON sagitta.clients; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON sagitta.clients; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON sagitta.clients FOR EACH ROW EXECUTE FUNCTION audit.tr_sagitta_log_change(); 
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
		,'clients' 			AS table_name 
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
						,x.old_client_cd 			AS client_cd 
						,x.old_client_name 			AS client_name 
						,x.old_bill_to_code 			AS bill_to_code 
						,x.old_addr_1 			AS addr_1 
						,x.old_addr_2 			AS addr_2 
						,x.old_postal_code 			AS postal_code 
						,x.old_postal_extension_code 			AS postal_extension_code 
						,x.old_city 			AS city 
						,x.old_state_prov_cd 			AS state_prov_cd 
						,x.old_phone_1_number 			AS phone_1_number 
						,x.old_phone_2_number 			AS phone_2_number 
						,x.old_reference_cd 			AS reference_cd 
						,x.old_status_cd 			AS status_cd 
						,x.old_producer_1_cd 			AS producer_1_cd 
						,x.old_producer_2_cd 			AS producer_2_cd 
						,x.old_producer_3_cd 			AS producer_3_cd 
						,x.old_servicer_1_cd 			AS servicer_1_cd 
						,x.old_servicer_2_cd 			AS servicer_2_cd 
						,x.old_servicer_3_cd 			AS servicer_3_cd 
						,x.old_credit_terms 			AS credit_terms 
						,x.old_source_cd 			AS source_cd 
						,x.old_source_dt 			AS source_dt 
						,x.old_cat_1_cd 			AS cat_1_cd 
						,x.old_cat_2_cd 			AS cat_2_cd 
						,x.old_cat_3_cd 			AS cat_3_cd 
						,x.old_cat_4_cd 			AS cat_4_cd 
						,x.old_cat_5_cd 			AS cat_5_cd 
						,x.old_net_commission_pct 			AS net_commission_pct 
						,x.old_contact_method 			AS contact_method 
						,x.old_sic_cd 			AS sic_cd 
						,x.old_collection_comments 			AS collection_comments 
						,x.old_remark_text 			AS remark_text 
						,x.old_phone_1_extension_number 			AS phone_1_extension_number 
						,x.old_phone_2_extension_number 			AS phone_2_extension_number 
						,x.old_fax_number 			AS fax_number 
						,x.old_pro_sus_cd 			AS pro_sus_cd 
						,x.old_date_business_started 			AS date_business_started 
						,x.old_business_nature 			AS business_nature 
						,x.old_inspection_contact 			AS inspection_contact 
						,x.old_inspection_phone_number 			AS inspection_phone_number 
						,x.old_inspection_phone_extension_number 			AS inspection_phone_extension_number 
						,x.old_accounting_contact 			AS accounting_contact 
						,x.old_accounting_phone_number 			AS accounting_phone_number 
						,x.old_accounting_phone_extension_number 			AS accounting_phone_extension_number 
						,x.old_legal_entity_cd 			AS legal_entity_cd 
						,x.old_email_addr 			AS email_addr 
						,x.old_web_site_link 			AS web_site_link 
						,x.old_division_number 			AS division_number 
						,x.old_parent_client 			AS parent_client 
						,x.old_parent_rel_cd 			AS parent_rel_cd 
						,x.old_relation_client 			AS relation_client 
						,x.old_relation_cd 			AS relation_cd 
						,x.old_fein 			AS fein 
						,x.old_insp_email 			AS insp_email 
						,x.old_acct_email 			AS acct_email 
						,x.old_no_members 			AS no_members 
						,x.old_integration_client_name 			AS integration_client_name 
			) 	AS _ 
		) 			AS new_record 
FROM sagitta.audit_clients 	AS x 
	INNER JOIN 	sagitta.clients 	AS y 
		ON x.sagitem = y.sagitem; 
GO 

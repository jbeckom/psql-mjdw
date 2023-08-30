/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE sagitta.payees 
	 DROP CONSTRAINT IF EXISTS payees_pkey 
	,ADD CONSTRAINT payees_sagitem_uq 	UNIQUE (sagitem)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON sagitta.payees; 
GO
DROP TRIGGER IF EXISTS audit_i ON sagitta.payees; 
GO
DROP TRIGGER IF EXISTS audit_u ON sagitta.payees; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON sagitta.payees; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON sagitta.payees FOR EACH ROW EXECUTE FUNCTION audit.tr_sagitta_log_change(); 
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
		,'payees' 			AS table_name 
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
						,x.old_payee_name 			AS payee_name 
						,x.old_initial_dt 			AS initial_dt 
						,x.old_contact_name 			AS contact_name 
						,x.old_addr_1 			AS addr_1 
						,x.old_addr_2 			AS addr_2 
						,x.old_postal_code 			AS postal_code 
						,x.old_postal_extension_code 			AS postal_extension_code 
						,x.old_city 			AS city 
						,x.old_state_prov_cd 			AS state_prov_cd 
						,x.old_phone_1_number 			AS phone_1_number 
						,x.old_phone_2_number 			AS phone_2_number 
						,x.old_agency_cd 			AS agency_cd 
						,x.old_pay_method_cd 			AS pay_method_cd 
						,x.old_num_days 			AS num_days 
						,x.old_fax_number 			AS fax_number 
						,x.old_phone_1_extention_number 			AS phone_1_extention_number 
						,x.old_phone_2_extention_number 			AS phone_2_extention_number 
						,x.old_off_dt 			AS off_dt 
						,x.old_direct_bill_ind 			AS direct_bill_ind 
						,x.old_release_ind 			AS release_ind 
						,x.old_email_addr 			AS email_addr 
						,x.old_description 			AS description 
						,x.old_mga 			AS mga 
						,x.old_global 			AS global 
						,x.old_payee_responsible_for_filing 			AS payee_responsible_for_filing 
						,x.old_tax_fee_payee 			AS tax_fee_payee 
			) 	AS _ 
		) 			AS new_record 
FROM sagitta.audit_payees 	AS x 
	INNER JOIN 	sagitta.payees 	AS y 
		ON x.sagitem = y.sagitem; 
GO 

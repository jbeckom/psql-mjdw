/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE sagitta.vendors 
	 DROP CONSTRAINT IF EXISTS vendors_pkey 
	,ADD CONSTRAINT vendors_sagitem_uq 	UNIQUE (sagitem)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON sagitta.vendors; 
GO
DROP TRIGGER IF EXISTS audit_i ON sagitta.vendors; 
GO
DROP TRIGGER IF EXISTS audit_u ON sagitta.vendors; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON sagitta.vendors; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON sagitta.vendors FOR EACH ROW EXECUTE FUNCTION audit.tr_sagitta_log_change(); 
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
		,'vendors' 			AS table_name 
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
						,x.old_vendor_name_1 			AS vendor_name_1 
						,x.old_vendor_name_2 			AS vendor_name_2 
						,x.old_vendor_addr_1 			AS vendor_addr_1 
						,x.old_vendor_addr_2 			AS vendor_addr_2 
						,x.old_postal_code 			AS postal_code 
						,x.old_postal_extension_code 			AS postal_extension_code 
						,x.old_vendor_city 			AS vendor_city 
						,x.old_vendor_state 			AS vendor_state 
						,x.old_vendor_phone_number 			AS vendor_phone_number 
						,x.old_vendor_fax_number 			AS vendor_fax_number 
						,x.old_vendor_tax_id 			AS vendor_tax_id 
						,x.old_vendor_require_1099_ind 			AS vendor_require_1099_ind 
						,x.old_vendor_credit_term 			AS vendor_credit_term 
						,x.old_vendor_status 			AS vendor_status 
						,x.old_vendor_contact_name 			AS vendor_contact_name 
						,x.old_bank_cd 			AS bank_cd 
						,x.old_vendor_type_cd 			AS vendor_type_cd 
						,x.old_voucher_print_ind 			AS voucher_print_ind 
						,x.old_insurer_ap_void_ind 			AS insurer_ap_void_ind 
						,x.old_vendor_off_dt 			AS vendor_off_dt 
						,x.old_vendor_off_dt_remark_text 			AS vendor_off_dt_remark_text 
						,x.old_insurer_db_rec_ind 			AS insurer_db_rec_ind 
						,x.old_producer_db_pay_ind 			AS producer_db_pay_ind 
						,x.old_vendor_print_gl_number 			AS vendor_print_gl_number 
						,x.old_ins_db_method 			AS ins_db_method 
						,x.old_vendor_igl_ind 			AS vendor_igl_ind 
						,x.old_producer_ab_pay_ind 			AS producer_ab_pay_ind 
						,x.old_broker 			AS broker 
			) 	AS _ 
		) 			AS new_record 
FROM sagitta.audit_vendors 	AS x 
	INNER JOIN 	sagitta.vendors 	AS y 
		ON x.sagitem = y.sagitem; 
GO 

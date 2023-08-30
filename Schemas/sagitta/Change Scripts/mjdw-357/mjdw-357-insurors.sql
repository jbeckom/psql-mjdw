/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE sagitta.insurors 
	 DROP CONSTRAINT IF EXISTS insurors_pkey 
	,ADD CONSTRAINT insurors_sagitem_uq 	UNIQUE (sagitem)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON sagitta.insurors; 
GO
DROP TRIGGER IF EXISTS audit_i ON sagitta.insurors; 
GO
DROP TRIGGER IF EXISTS audit_u ON sagitta.insurors; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON sagitta.insurors; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON sagitta.insurors FOR EACH ROW EXECUTE FUNCTION audit.tr_sagitta_log_change(); 
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
		,'insurors' 			AS table_name 
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
						,x.old_insurer_cd 			AS insurer_cd 
						,x.old_insurer_name 			AS insurer_name 
						,x.old_payee_cd 			AS payee_cd 
						,x.old_addr_1 			AS addr_1 
						,x.old_addr_2 			AS addr_2 
						,x.old_postal_code 			AS postal_code 
						,x.old_postal_extension_code 			AS postal_extension_code 
						,x.old_city 			AS city 
						,x.old_state_prov_cd 			AS state_prov_cd 
						,x.old_telephone_1 			AS telephone_1 
						,x.old_telephone_2 			AS telephone_2 
						,x.old_group 			AS group 
						,x.old_agency_code 			AS agency_code 
						,x.old_phone_extension_1_number 			AS phone_extension_1_number 
						,x.old_company_code 			AS company_code 
						,x.old_phone_extension_2_number 			AS phone_extension_2_number 
						,x.old_naic_cd 			AS naic_cd 
						,x.old_fax_number 			AS fax_number 
						,x.old_type 			AS type 
						,x.old_obsolete_41 			AS obsolete_41 
						,x.old_date_off 			AS date_off 
						,x.old_date_off_remark 			AS date_off_remark 
						,x.old_email_addr 			AS email_addr 
						,x.old_rounding_difference 			AS rounding_difference 
						,x.old_description 			AS description 
						,x.old_global 			AS global 
						,x.old_am_best_number 			AS am_best_number 
						,x.old_bests_financial_strength 			AS bests_financial_strength 
						,x.old_bests_financial_size 			AS bests_financial_size 
						,x.old_state_of_domicile 			AS state_of_domicile 
						,x.old_amb_company_name 			AS amb_company_name 
						,x.old_amb_parent_number 			AS amb_parent_number 
						,x.old_financial_strength_outlook 			AS financial_strength_outlook 
						,x.old_financial_strength_action 			AS financial_strength_action 
						,x.old_fein 			AS fein 
						,x.old_amb_last_update 			AS amb_last_update 
						,x.old_auto_id_claim_reporting_phone_number 			AS auto_id_claim_reporting_phone_number 
						,x.old_auto_id_claim_reporting_phone_extension 			AS auto_id_claim_reporting_phone_extension 
			) 	AS _ 
		) 			AS new_record 
FROM sagitta.audit_insurors 	AS x 
	INNER JOIN 	sagitta.insurors 	AS y 
		ON x.sagitem = y.sagitem; 
GO 

/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE sagitta.staff 
	 DROP CONSTRAINT IF EXISTS staff_pkey 
	,ADD CONSTRAINT staff_sagitem_uq 	UNIQUE (sagitem)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON sagitta.staff; 
GO
DROP TRIGGER IF EXISTS audit_i ON sagitta.staff; 
GO
DROP TRIGGER IF EXISTS audit_u ON sagitta.staff; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON sagitta.staff; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON sagitta.staff FOR EACH ROW EXECUTE FUNCTION audit.tr_sagitta_log_change(); 
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
		,'staff' 			AS table_name 
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
						,x.old_staff_name 			AS staff_name 
						,x.old_addr_1 			AS addr_1 
						,x.old_addr_2 			AS addr_2 
						,x.old_postal_code 			AS postal_code 
						,x.old_postal_extension_code 			AS postal_extension_code 
						,x.old_city 			AS city 
						,x.old_state_prov_cd 			AS state_prov_cd 
						,x.old_work_phone_number 			AS work_phone_number 
						,x.old_home_phone_number 			AS home_phone_number 
						,x.old_dept 			AS dept 
						,x.old_hired_dt 			AS hired_dt 
						,x.old_next_review_dt 			AS next_review_dt 
						,x.old_termination_dt 			AS termination_dt 
						,x.old_annual_salary_amt 			AS annual_salary_amt 
						,x.old_division_id 			AS division_id 
						,x.old_tax_id 			AS tax_id 
						,x.old_emergency_phone_number 			AS emergency_phone_number 
						,x.old_title 			AS title 
						,x.old_birth_dt 			AS birth_dt 
						,x.old_skip_flag 			AS skip_flag 
						,x.old_display_only 			AS display_only 
						,x.old_date_off 			AS date_off 
						,x.old_date_off_remark 			AS date_off_remark 
						,x.old_fax_number 			AS fax_number 
						,x.old_super_user_id 			AS super_user_id 
						,x.old_agency_cd 			AS agency_cd 
						,x.old_email_addr 			AS email_addr 
						,x.old_role 			AS role 
						,x.old_national_producer_number 			AS national_producer_number 
						,x.old_service_account 			AS service_account 
						,x.old_integration_staff_name 			AS integration_staff_name 
						,x.old_integration_staff_title 			AS integration_staff_title 
						,x.old_mobile_phone 			AS mobile_phone 
			) 	AS _ 
		) 			AS new_record 
FROM sagitta.audit_staff 	AS x 
	INNER JOIN 	sagitta.staff 	AS y 
		ON x.sagitem = y.sagitem; 
GO 

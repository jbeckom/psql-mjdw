/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE benefitpoint.group_account_info 
	 DROP CONSTRAINT IF EXISTS group_account_info_pkey 
	,ADD CONSTRAINT group_account_info_account_id_uq 	UNIQUE (account_id)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON benefitpoint.group_account_info; 
GO
DROP TRIGGER IF EXISTS audit_i ON benefitpoint.group_account_info; 
GO
DROP TRIGGER IF EXISTS audit_u ON benefitpoint.group_account_info; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON benefitpoint.group_account_info; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON benefitpoint.group_account_info FOR EACH ROW EXECUTE FUNCTION audit.tr_benefitpoint_log_change(); 
GO
 
/*** MOVE AUDIT DATA FROM LEGACY TABLE(S) TO NEW AUDIT SCHEMA ***/
INSERT INTO audit.benefitpoint_log (audit_time, audit_user, audit_client, operation, table_name, table_key, new_record) 
SELECT 	 x.audit_timestamp 			AS audit_time 
		,x.audit_user 			AS audit_user 
		,'0.0.0.0'::inet 			AS audit_client 
		,CASE 
			WHEN x.audit_action = 'D' THEN 'DELETE' 
			WHEN x.audit_action = 'I' THEN 'INSERT' 
			WHEN x.audit_action = 'U' THEN 'UPDATE' 
		END 			AS operation 
		,'group_account_info' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.account_id
						,x.old_account_name 			AS account_name 
						,x.old_dba 			AS dba 
						,x.old_number_of_ftes 			AS number_of_ftes 
						,x.old_number_of_ftes_as_of 			AS number_of_ftes_as_of 
						,x.old_number_of_full_time_equivalents 			AS number_of_full_time_equivalents 
						,x.old_number_of_full_time_equivalents_as_of_date 			AS number_of_full_time_equivalents_as_of_date 
						,x.old_coverage_subject_to_employer_mandate 			AS coverage_subject_to_employer_mandate 
						,x.old_market_size 			AS market_size 
						,x.old_business_type 			AS business_type 
						,x.old_sic_code 			AS sic_code 
						,x.old_naics_code 			AS naics_code 
						,x.old_requires_5500 			AS requires_5500 
						,x.old_locations_by_zip 			AS locations_by_zip 
						,x.old_affiliates 			AS affiliates 
						,x.old_budgeted_total_annual_premium 			AS budgeted_total_annual_premium 
						,x.old_budgeted_total_annual_revenue 			AS budgeted_total_annual_revenue 
						,x.old_multiple_payroll_cycles 			AS multiple_payroll_cycles 
						,x.old_multiple_payroll_cycles_differ_by 			AS multiple_payroll_cycles_differ_by 
						,x.old_single_payroll_cycle 			AS single_payroll_cycle 
			) 	AS _ 
		) 			AS new_record 
FROM benefitpoint.audit_group_account_info 	AS x 
	INNER JOIN 	benefitpoint.group_account_info 	AS y 
		ON x.account_id = y.account_id; 
GO 

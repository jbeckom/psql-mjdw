/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE sagitta.cp_coverages_lsci_time_element_info 
	 DROP CONSTRAINT IF EXISTS cp_coverages_lsci_time_element_info_pkey 
	,ADD CONSTRAINT cp_coverages_lsci_time_element_info_sagitem_uq 	UNIQUE (sagitem)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON sagitta.cp_coverages_lsci_time_element_info; 
GO
DROP TRIGGER IF EXISTS audit_i ON sagitta.cp_coverages_lsci_time_element_info; 
GO
DROP TRIGGER IF EXISTS audit_u ON sagitta.cp_coverages_lsci_time_element_info; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON sagitta.cp_coverages_lsci_time_element_info; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON sagitta.cp_coverages_lsci_time_element_info FOR EACH ROW EXECUTE FUNCTION audit.tr_sagitta_log_change(); 
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
		,'cp_coverages_lsci_time_element_info' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.sagitem
						,x.lis
						,x.old_time_element_subject_insurance_cd 			AS time_element_subject_insurance_cd 
						,x.old_time_element_subject_insurance_desc 			AS time_element_subject_insurance_desc 
						,x.old_time_element_monthy_limit 			AS time_element_monthy_limit 
						,x.old_time_element_num_days 			AS time_element_num_days 
						,x.old_time_element_floor_area_num_units 			AS time_element_floor_area_num_units 
						,x.old_time_element_manufacturing_area_num_units 			AS time_element_manufacturing_area_num_units 
						,x.old_time_element_mercantile_area_num_units 			AS time_element_mercantile_area_num_units 
						,x.old_time_element_option_cd 			AS time_element_option_cd 
						,x.old_time_element_limit_on_loss_cd 			AS time_element_limit_on_loss_cd 
						,x.old_time_element_payroll_cd 			AS time_element_payroll_cd 
						,x.old_time_element_payroll_amt 			AS time_element_payroll_amt 
						,x.old_time_element_num_extension_business_income_days 			AS time_element_num_extension_business_income_days 
						,x.old_time_element_maximum_indemnity_period 			AS time_element_maximum_indemnity_period 
			) 	AS _ 
		) 			AS new_record 
FROM sagitta.audit_cp_coverages_lsci_time_element_info 	AS x 
	INNER JOIN 	sagitta.cp_coverages_lsci_time_element_info 	AS y 
		ON x.sagitem = y.sagitem
			 AND x.lis = y.lis; 
GO 

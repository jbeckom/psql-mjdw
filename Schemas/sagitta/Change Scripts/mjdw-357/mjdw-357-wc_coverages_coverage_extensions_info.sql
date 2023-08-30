/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE sagitta.wc_coverages_coverage_extensions_info 
	 DROP CONSTRAINT IF EXISTS wc_coverages_coverage_extensions_info_pkey 
	,ADD CONSTRAINT wc_coverages_coverage_extensions_info_sagitem_uq 	UNIQUE (sagitem)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON sagitta.wc_coverages_coverage_extensions_info; 
GO
DROP TRIGGER IF EXISTS audit_i ON sagitta.wc_coverages_coverage_extensions_info; 
GO
DROP TRIGGER IF EXISTS audit_u ON sagitta.wc_coverages_coverage_extensions_info; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON sagitta.wc_coverages_coverage_extensions_info; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON sagitta.wc_coverages_coverage_extensions_info FOR EACH ROW EXECUTE FUNCTION audit.tr_sagitta_log_change(); 
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
		,'wc_coverages_coverage_extensions_info' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.sagitem
						,x.lis
						,x.old_coverage_cd 			AS coverage_cd 
						,x.old_state_prov_cd 			AS state_prov_cd 
						,x.old_form_number 			AS form_number 
						,x.old_edition_dt 			AS edition_dt 
						,x.old_first_ea_accident_bi_limit 			AS first_ea_accident_bi_limit 
						,x.old_second_bi_by_disease_limit 			AS second_bi_by_disease_limit 
						,x.old_third_per_employee_by_bi_limit 			AS third_per_employee_by_bi_limit 
						,x.old_coverage_extention_annual_premium_amt 			AS coverage_extention_annual_premium_amt 
						,x.old_coverage_desc 			AS coverage_desc 
						,x.old_location_number 			AS location_number 
						,x.old_type_cd 			AS type_cd 
						,x.old_deductible_1_amt 			AS deductible_1_amt 
						,x.old_deductible_2_amt 			AS deductible_2_amt 
						,x.old_deductible_1_type_cd 			AS deductible_1_type_cd 
						,x.old_deductible_2_type_cd 			AS deductible_2_type_cd 
						,x.old_rate 			AS rate 
			) 	AS _ 
		) 			AS new_record 
FROM sagitta.audit_wc_coverages_coverage_extensions_info 	AS x 
	INNER JOIN 	sagitta.wc_coverages_coverage_extensions_info 	AS y 
		ON x.sagitem = y.sagitem
			 AND x.lis = y.lis; 
GO 

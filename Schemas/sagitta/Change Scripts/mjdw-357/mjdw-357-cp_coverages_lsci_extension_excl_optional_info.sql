/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE sagitta.cp_coverages_lsci_extension_excl_optional_info 
	 DROP CONSTRAINT IF EXISTS cp_coverages_lsci_extension_excl_optional_info_pkey 
	,ADD CONSTRAINT cp_coverages_lsci_extension_excl_optional_info_sagitem_uq 	UNIQUE (sagitem)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON sagitta.cp_coverages_lsci_extension_excl_optional_info; 
GO
DROP TRIGGER IF EXISTS audit_i ON sagitta.cp_coverages_lsci_extension_excl_optional_info; 
GO
DROP TRIGGER IF EXISTS audit_u ON sagitta.cp_coverages_lsci_extension_excl_optional_info; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON sagitta.cp_coverages_lsci_extension_excl_optional_info; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON sagitta.cp_coverages_lsci_extension_excl_optional_info FOR EACH ROW EXECUTE FUNCTION audit.tr_sagitta_log_change(); 
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
		,'cp_coverages_lsci_extension_excl_optional_info' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.sagitem
						,x.lis
						,x.old_optional_coverages_cd 			AS optional_coverages_cd 
						,x.old_optional_limit 			AS optional_limit 
						,x.old_optional_deductible_ind 			AS optional_deductible_ind 
						,x.old_optional_deductible 			AS optional_deductible 
						,x.old_optional_deductible_type_cd 			AS optional_deductible_type_cd 
						,x.old_optional_deductible_basis_cd 			AS optional_deductible_basis_cd 
						,x.old_reporting_period_cd 			AS reporting_period_cd 
						,x.old_optional_coverages_desc 			AS optional_coverages_desc 
						,x.old_optional_peak_season_start_dt 			AS optional_peak_season_start_dt 
						,x.old_optional_peak_season_end_dt 			AS optional_peak_season_end_dt 
						,x.old_option_form_number 			AS option_form_number 
						,x.old_option_edition_dt 			AS option_edition_dt 
						,x.old_optional_amt 			AS optional_amt 
			) 	AS _ 
		) 			AS new_record 
FROM sagitta.audit_cp_coverages_lsci_extension_excl_optional_info 	AS x 
	INNER JOIN 	sagitta.cp_coverages_lsci_extension_excl_optional_info 	AS y 
		ON x.sagitem = y.sagitem
			 AND x.lis = y.lis; 
GO 

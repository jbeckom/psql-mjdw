/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE sagitta.cp_coverages 
	 DROP CONSTRAINT IF EXISTS cp_coverages_pkey 
	,ADD CONSTRAINT cp_coverages_sagitem_uq 	UNIQUE (sagitem)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON sagitta.cp_coverages; 
GO
DROP TRIGGER IF EXISTS audit_i ON sagitta.cp_coverages; 
GO
DROP TRIGGER IF EXISTS audit_u ON sagitta.cp_coverages; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON sagitta.cp_coverages; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON sagitta.cp_coverages FOR EACH ROW EXECUTE FUNCTION audit.tr_sagitta_log_change(); 
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
		,'cp_coverages' 			AS table_name 
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
						,x.old_policy_agency_id 			AS policy_agency_id 
						,x.old_location_number 			AS location_number 
						,x.old_location_desc 			AS location_desc 
						,x.old_off_dt 			AS off_dt 
						,x.old_location_lower_level_coverage_slice 			AS location_lower_level_coverage_slice 
						,x.old_lis_count_location_specific_coverage_info 			AS lis_count_location_specific_coverage_info 
						,x.old_lis_count_extension_excl_optional_info 			AS lis_count_extension_excl_optional_info 
						,x.old_lis_count_time_element_info 			AS lis_count_time_element_info 
			) 	AS _ 
		) 			AS new_record 
FROM sagitta.audit_cp_coverages 	AS x 
	INNER JOIN 	sagitta.cp_coverages 	AS y 
		ON x.sagitem = y.sagitem; 
GO 

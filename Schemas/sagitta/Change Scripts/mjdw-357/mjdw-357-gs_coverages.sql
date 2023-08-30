/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE sagitta.gs_coverages 
	 DROP CONSTRAINT IF EXISTS gs_coverages_pkey 
	,ADD CONSTRAINT gs_coverages_sagitem_uq 	UNIQUE (sagitem)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON sagitta.gs_coverages; 
GO
DROP TRIGGER IF EXISTS audit_i ON sagitta.gs_coverages; 
GO
DROP TRIGGER IF EXISTS audit_u ON sagitta.gs_coverages; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON sagitta.gs_coverages; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON sagitta.gs_coverages FOR EACH ROW EXECUTE FUNCTION audit.tr_sagitta_log_change(); 
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
		,'gs_coverages' 			AS table_name 
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
						,x.old_glass_deductible 			AS glass_deductible 
						,x.old_glass_retention_pct 			AS glass_retention_pct 
						,x.old_large_glass_option_ind 			AS large_glass_option_ind 
						,x.old_sign_full_form_coverage_ind 			AS sign_full_form_coverage_ind 
						,x.old_sign_deductible_clause_ind 			AS sign_deductible_clause_ind 
						,x.old_off_dt 			AS off_dt 
						,x.old_lis_count_glass_info 			AS lis_count_glass_info 
						,x.old_lis_count_sign_item_info 			AS lis_count_sign_item_info 
			) 	AS _ 
		) 			AS new_record 
FROM sagitta.audit_gs_coverages 	AS x 
	INNER JOIN 	sagitta.gs_coverages 	AS y 
		ON x.sagitem = y.sagitem; 
GO 

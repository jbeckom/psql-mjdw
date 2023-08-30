/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE sagitta.coverages 
	 DROP CONSTRAINT IF EXISTS coverages_pkey 
	,ADD CONSTRAINT coverages_sagitem_uq 	UNIQUE (sagitem)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON sagitta.coverages; 
GO
DROP TRIGGER IF EXISTS audit_i ON sagitta.coverages; 
GO
DROP TRIGGER IF EXISTS audit_u ON sagitta.coverages; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON sagitta.coverages; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON sagitta.coverages FOR EACH ROW EXECUTE FUNCTION audit.tr_sagitta_log_change(); 
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
		,'coverages' 			AS table_name 
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
						,x.old_coverage_cd 			AS coverage_cd 
						,x.old_coverage_description 			AS coverage_description 
						,x.old_major_lob_cd 			AS major_lob_cd 
						,x.old_acord_lob_cd 			AS acord_lob_cd 
						,x.old_acord_sub_lob 			AS acord_sub_lob 
						,x.old_coverage_type 			AS coverage_type 
						,x.old_personal_commercial 			AS personal_commercial 
						,x.old_off_dt 			AS off_dt 
						,x.old_off_dt_remarks 			AS off_dt_remarks 
			) 	AS _ 
		) 			AS new_record 
FROM sagitta.audit_coverages 	AS x 
	INNER JOIN 	sagitta.coverages 	AS y 
		ON x.sagitem = y.sagitem; 
GO 

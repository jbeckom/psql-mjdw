/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE sagitta.ol_coverages 
	 DROP CONSTRAINT IF EXISTS ol_coverages_pkey 
	,ADD CONSTRAINT ol_coverages_sagitem_uq 	UNIQUE (sagitem)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON sagitta.ol_coverages; 
GO
DROP TRIGGER IF EXISTS audit_i ON sagitta.ol_coverages; 
GO
DROP TRIGGER IF EXISTS audit_u ON sagitta.ol_coverages; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON sagitta.ol_coverages; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON sagitta.ol_coverages FOR EACH ROW EXECUTE FUNCTION audit.tr_sagitta_log_change(); 
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
		,'ol_coverages' 			AS table_name 
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
						,x.old_lob_cd 			AS lob_cd 
						,x.old_lob_desc 			AS lob_desc 
						,x.old_rating_basis 			AS rating_basis 
						,x.old_valuation_code_1 			AS valuation_code_1 
						,x.old_valuation_code_2 			AS valuation_code_2 
						,x.old_cause_of_loss 			AS cause_of_loss 
						,x.old_cov_effective_date 			AS cov_effective_date 
						,x.old_cov_expiration_date 			AS cov_expiration_date 
						,x.old_number_of_1_desc 			AS number_of_1_desc 
						,x.old_number_of_2 			AS number_of_2 
						,x.old_number_of_2_desc 			AS number_of_2_desc 
						,x.old_off_dt 			AS off_dt 
			) 	AS _ 
		) 			AS new_record 
FROM sagitta.audit_ol_coverages 	AS x 
	INNER JOIN 	sagitta.ol_coverages 	AS y 
		ON x.sagitem = y.sagitem; 
GO 

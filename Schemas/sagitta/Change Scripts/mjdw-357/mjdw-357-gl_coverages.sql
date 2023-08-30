/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE sagitta.gl_coverages 
	 DROP CONSTRAINT IF EXISTS gl_coverages_pkey 
	,ADD CONSTRAINT gl_coverages_sagitem_uq 	UNIQUE (sagitem)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON sagitta.gl_coverages; 
GO
DROP TRIGGER IF EXISTS audit_i ON sagitta.gl_coverages; 
GO
DROP TRIGGER IF EXISTS audit_u ON sagitta.gl_coverages; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON sagitta.gl_coverages; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON sagitta.gl_coverages FOR EACH ROW EXECUTE FUNCTION audit.tr_sagitta_log_change(); 
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
		,'gl_coverages' 			AS table_name 
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
						,x.old_general_liab_ind 			AS general_liab_ind 
						,x.old_claims_made_ind 			AS claims_made_ind 
						,x.old_claims_occurrence_ind 			AS claims_occurrence_ind 
						,x.old_other_coverage_premium 			AS other_coverage_premium 
						,x.old_per_claim_ind 			AS per_claim_ind 
						,x.old_per_occurrence_ind 			AS per_occurrence_ind 
						,x.old_ded_basis_cd 			AS ded_basis_cd 
						,x.old_deductible 			AS deductible 
						,x.old_gen_aggregate 			AS gen_aggregate 
						,x.old_product_completed_ops_info 			AS product_completed_ops_info 
						,x.old_pers_advertising_injury 			AS pers_advertising_injury 
						,x.old_each_occurrence 			AS each_occurrence 
						,x.old_fire_legal 			AS fire_legal 
						,x.old_medical_expense 			AS medical_expense 
						,x.old_premises_operation 			AS premises_operation 
						,x.old_products_premium_amt 			AS products_premium_amt 
						,x.old_total_premium_amt 			AS total_premium_amt 
						,x.old_off_dt 			AS off_dt 
						,x.old_total_other_cov_premium_amt 			AS total_other_cov_premium_amt 
			) 	AS _ 
		) 			AS new_record 
FROM sagitta.audit_gl_coverages 	AS x 
	INNER JOIN 	sagitta.gl_coverages 	AS y 
		ON x.sagitem = y.sagitem; 
GO 

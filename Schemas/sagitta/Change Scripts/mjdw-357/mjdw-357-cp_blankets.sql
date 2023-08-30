/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE sagitta.cp_blankets 
	 DROP CONSTRAINT IF EXISTS cp_blankets_pkey 
	,ADD CONSTRAINT cp_blankets_sagitem_uq 	UNIQUE (sagitem)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON sagitta.cp_blankets; 
GO
DROP TRIGGER IF EXISTS audit_i ON sagitta.cp_blankets; 
GO
DROP TRIGGER IF EXISTS audit_u ON sagitta.cp_blankets; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON sagitta.cp_blankets; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON sagitta.cp_blankets FOR EACH ROW EXECUTE FUNCTION audit.tr_sagitta_log_change(); 
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
		,'cp_blankets' 			AS table_name 
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
						,x.old_blanket_number 			AS blanket_number 
						,x.old_policy_agency_id 			AS policy_agency_id 
						,x.old_cause 			AS cause 
						,x.old_coinsurance_pct 			AS coinsurance_pct 
						,x.old_inflation_guard_pct 			AS inflation_guard_pct 
						,x.old_rate 			AS rate 
						,x.old_total_blk_limit 			AS total_blk_limit 
						,x.old_total_blk_premium 			AS total_blk_premium 
						,x.old_blanket_type_cd 			AS blanket_type_cd 
						,x.old_blanket_type_desc 			AS blanket_type_desc 
						,x.old_valuation_cd 			AS valuation_cd 
						,x.old_agree_amt_ind 			AS agree_amt_ind 
						,x.old_ded_symbol 			AS ded_symbol 
						,x.old_ded_amt 			AS ded_amt 
						,x.old_deductible_type_cd 			AS deductible_type_cd 
						,x.old_deductible_basis_cd 			AS deductible_basis_cd 
						,x.old_off_dt 			AS off_dt 
						,x.old_start_dt 			AS start_dt 
						,x.old_second_amt_value_type 			AS second_amt_value_type 
						,x.old_second_amt_value 			AS second_amt_value 
						,x.old_end_dt 			AS end_dt 
			) 	AS _ 
		) 			AS new_record 
FROM sagitta.audit_cp_blankets 	AS x 
	INNER JOIN 	sagitta.cp_blankets 	AS y 
		ON x.sagitem = y.sagitem; 
GO 

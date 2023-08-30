/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE sagitta.payees_cov_ins_percent_info 
	 DROP CONSTRAINT IF EXISTS payees_cov_ins_percent_info_pkey 
	,ADD CONSTRAINT payees_cov_ins_percent_info_sagitem_uq 	UNIQUE (sagitem)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON sagitta.payees_cov_ins_percent_info; 
GO
DROP TRIGGER IF EXISTS audit_i ON sagitta.payees_cov_ins_percent_info; 
GO
DROP TRIGGER IF EXISTS audit_u ON sagitta.payees_cov_ins_percent_info; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON sagitta.payees_cov_ins_percent_info; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON sagitta.payees_cov_ins_percent_info FOR EACH ROW EXECUTE FUNCTION audit.tr_sagitta_log_change(); 
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
		,'payees_cov_ins_percent_info' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.sagitem
						,x.lis
						,x.old_coverage_cd 			AS coverage_cd 
						,x.old_agency_new_pct 			AS agency_new_pct 
						,x.old_db_new_pct 			AS db_new_pct 
						,x.old_agency_ren_pct 			AS agency_ren_pct 
						,x.old_db_ren_pct 			AS db_ren_pct 
						,x.old_begin_dt 			AS begin_dt 
						,x.old_end_dt 			AS end_dt 
						,x.old_standard_comm_ind 			AS standard_comm_ind 
						,x.old_insurer_cd 			AS insurer_cd 
						,x.old_grading_from_amt 			AS grading_from_amt 
						,x.old_grading_to_amt 			AS grading_to_amt 
						,x.old_commission_type_ind 			AS commission_type_ind 
						,x.old_comm_div 			AS comm_div 
						,x.old_comm_dept 			AS comm_dept 
			) 	AS _ 
		) 			AS new_record 
FROM sagitta.audit_payees_cov_ins_percent_info 	AS x 
	INNER JOIN 	sagitta.payees_cov_ins_percent_info 	AS y 
		ON x.sagitem = y.sagitem
			 AND x.lis = y.lis; 
GO 

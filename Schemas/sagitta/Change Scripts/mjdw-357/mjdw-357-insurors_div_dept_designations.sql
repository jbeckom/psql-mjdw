/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE sagitta.insurors_div_dept_designations 
	 DROP CONSTRAINT IF EXISTS insurors_div_dept_designations_pkey 
	,ADD CONSTRAINT insurors_div_dept_designations_sagitem_uq 	UNIQUE (sagitem)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON sagitta.insurors_div_dept_designations; 
GO
DROP TRIGGER IF EXISTS audit_i ON sagitta.insurors_div_dept_designations; 
GO
DROP TRIGGER IF EXISTS audit_u ON sagitta.insurors_div_dept_designations; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON sagitta.insurors_div_dept_designations; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON sagitta.insurors_div_dept_designations FOR EACH ROW EXECUTE FUNCTION audit.tr_sagitta_log_change(); 
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
		,'insurors_div_dept_designations' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.sagitem
						,x.lis
						,x.valid_div
						,x.valid_dept
						,x.old_limit_new 			AS limit_new 
						,x.old_limit_new_date 			AS limit_new_date 
						,x.old_limit_renew 			AS limit_renew 
						,x.old_limit_renew_date 			AS limit_renew_date 
			) 	AS _ 
		) 			AS new_record 
FROM sagitta.audit_insurors_div_dept_designations 	AS x 
	INNER JOIN 	sagitta.insurors_div_dept_designations 	AS y 
		ON x.sagitem = y.sagitem
			 AND x.lis = y.lis
			 AND x.valid_div = y.valid_div
			 AND x.valid_dept = y.valid_dept; 
GO 

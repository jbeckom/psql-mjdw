/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE sagitta.insurors_state_specific_company_codes 
	 DROP CONSTRAINT IF EXISTS insurors_state_specific_company_codes_pkey 
	,ADD CONSTRAINT insurors_state_specific_company_codes_sagitem_uq 	UNIQUE (sagitem)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON sagitta.insurors_state_specific_company_codes; 
GO
DROP TRIGGER IF EXISTS audit_i ON sagitta.insurors_state_specific_company_codes; 
GO
DROP TRIGGER IF EXISTS audit_u ON sagitta.insurors_state_specific_company_codes; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON sagitta.insurors_state_specific_company_codes; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON sagitta.insurors_state_specific_company_codes FOR EACH ROW EXECUTE FUNCTION audit.tr_sagitta_log_change(); 
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
		,'insurors_state_specific_company_codes' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.sagitem
						,x.lis
						,x.code_state
						,x.state_company_code
			) 	AS _ 
		) 			AS new_record 
FROM sagitta.audit_insurors_state_specific_company_codes 	AS x 
	INNER JOIN 	sagitta.insurors_state_specific_company_codes 	AS y 
		ON x.sagitem = y.sagitem
			 AND x.lis = y.lis
			 AND x.code_state = y.code_state
			 AND x.state_company_code = y.state_company_code; 
GO 

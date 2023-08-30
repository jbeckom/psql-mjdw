/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE benefitpoint.employee_type 
	 DROP CONSTRAINT IF EXISTS employee_type_pkey 
	,ADD CONSTRAINT employee_type_account_id_uq 	UNIQUE (account_id)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON benefitpoint.employee_type; 
GO
DROP TRIGGER IF EXISTS audit_i ON benefitpoint.employee_type; 
GO
DROP TRIGGER IF EXISTS audit_u ON benefitpoint.employee_type; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON benefitpoint.employee_type; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON benefitpoint.employee_type FOR EACH ROW EXECUTE FUNCTION audit.tr_benefitpoint_log_change(); 
GO
 
/*** MOVE AUDIT DATA FROM LEGACY TABLE(S) TO NEW AUDIT SCHEMA ***/
INSERT INTO audit.benefitpoint_log (audit_time, audit_user, audit_client, operation, table_name, table_key, new_record) 
SELECT 	 x.audit_timestamp 			AS audit_time 
		,x.audit_user 			AS audit_user 
		,'0.0.0.0'::inet 			AS audit_client 
		,CASE 
			WHEN x.audit_action = 'D' THEN 'DELETE' 
			WHEN x.audit_action = 'I' THEN 'INSERT' 
			WHEN x.audit_action = 'U' THEN 'UPDATE' 
		END 			AS operation 
		,'employee_type' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.account_id
						,x.employee_type_id
						,x.old_status 			AS status 
						,x.old_type 			AS type 
						,x.old_value 			AS value 
						,x.old_unit_of_measure 			AS unit_of_measure 
						,x.old_frequency 			AS frequency 
			) 	AS _ 
		) 			AS new_record 
FROM benefitpoint.audit_employee_type 	AS x 
	INNER JOIN 	benefitpoint.employee_type 	AS y 
		ON x.account_id = y.account_id
			 AND x.employee_type_id = y.employee_type_id; 
GO 

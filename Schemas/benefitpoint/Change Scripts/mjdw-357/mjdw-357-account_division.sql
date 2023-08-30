/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE benefitpoint.account_division 
	 DROP CONSTRAINT IF EXISTS account_division_pkey 
	,ADD CONSTRAINT account_division_account_id_uq 	UNIQUE (account_id)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON benefitpoint.account_division; 
GO
DROP TRIGGER IF EXISTS audit_i ON benefitpoint.account_division; 
GO
DROP TRIGGER IF EXISTS audit_u ON benefitpoint.account_division; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON benefitpoint.account_division; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON benefitpoint.account_division FOR EACH ROW EXECUTE FUNCTION audit.tr_benefitpoint_log_change(); 
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
		,'account_division' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.account_id
						,x.division_id
						,x.old_code 			AS code 
						,x.old_name 			AS name 
						,x.old_payroll_cycle 			AS payroll_cycle 
			) 	AS _ 
		) 			AS new_record 
FROM benefitpoint.audit_account_division 	AS x 
	INNER JOIN 	benefitpoint.account_division 	AS y 
		ON x.account_id = y.account_id
			 AND x.division_id = y.division_id; 
GO 

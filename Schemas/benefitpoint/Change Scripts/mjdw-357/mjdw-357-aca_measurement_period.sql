/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE benefitpoint.aca_measurement_period 
	 DROP CONSTRAINT IF EXISTS aca_measurement_period_pkey 
	,ADD CONSTRAINT aca_measurement_period_account_id_uq 	UNIQUE (account_id)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON benefitpoint.aca_measurement_period; 
GO
DROP TRIGGER IF EXISTS audit_i ON benefitpoint.aca_measurement_period; 
GO
DROP TRIGGER IF EXISTS audit_u ON benefitpoint.aca_measurement_period; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON benefitpoint.aca_measurement_period; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON benefitpoint.aca_measurement_period FOR EACH ROW EXECUTE FUNCTION audit.tr_benefitpoint_log_change(); 
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
		,'aca_measurement_period' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.account_id
						,x.measurement_period
						,x.old_start_date 			AS start_date 
						,x.old_end_date 			AS end_date 
			) 	AS _ 
		) 			AS new_record 
FROM benefitpoint.audit_aca_measurement_period 	AS x 
	INNER JOIN 	benefitpoint.aca_measurement_period 	AS y 
		ON x.account_id = y.account_id
			 AND x.measurement_period = y.measurement_period; 
GO 

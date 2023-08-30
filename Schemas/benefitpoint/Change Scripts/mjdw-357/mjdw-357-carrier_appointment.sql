/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE benefitpoint.carrier_appointment 
	 DROP CONSTRAINT IF EXISTS carrier_appointment_pkey 
	,ADD CONSTRAINT carrier_appointment_carrier_source_uq 	UNIQUE (carrier_source)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON benefitpoint.carrier_appointment; 
GO
DROP TRIGGER IF EXISTS audit_i ON benefitpoint.carrier_appointment; 
GO
DROP TRIGGER IF EXISTS audit_u ON benefitpoint.carrier_appointment; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON benefitpoint.carrier_appointment; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON benefitpoint.carrier_appointment FOR EACH ROW EXECUTE FUNCTION audit.tr_benefitpoint_log_change(); 
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
		,'carrier_appointment' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.carrier_source
						,x.source_key
						,x.carrier_appointment_id
						,x.old_carrier_id 			AS carrier_id 
						,x.old_appointment_on 			AS appointment_on 
						,x.old_appointment_number 			AS appointment_number 
						,x.old_states 			AS states 
						,x.old_active 			AS active 
			) 	AS _ 
		) 			AS new_record 
FROM benefitpoint.audit_carrier_appointment 	AS x 
	INNER JOIN 	benefitpoint.carrier_appointment 	AS y 
		ON x.carrier_source = y.carrier_source
			 AND x.source_key = y.source_key
			 AND x.carrier_appointment_id = y.carrier_appointment_id; 
GO 

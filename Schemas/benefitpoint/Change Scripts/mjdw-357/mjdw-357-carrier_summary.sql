/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE benefitpoint.carrier_summary 
	 DROP CONSTRAINT IF EXISTS carrier_summary_pkey 
	,ADD CONSTRAINT carrier_summary_carrier_id_uq 	UNIQUE (carrier_id)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON benefitpoint.carrier_summary; 
GO
DROP TRIGGER IF EXISTS audit_i ON benefitpoint.carrier_summary; 
GO
DROP TRIGGER IF EXISTS audit_u ON benefitpoint.carrier_summary; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON benefitpoint.carrier_summary; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON benefitpoint.carrier_summary FOR EACH ROW EXECUTE FUNCTION audit.tr_benefitpoint_log_change(); 
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
		,'carrier_summary' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.carrier_id
						,x.old_carrier_name 			AS carrier_name 
						,x.old_carrier_alias 			AS carrier_alias 
			) 	AS _ 
		) 			AS new_record 
FROM benefitpoint.audit_carrier_summary 	AS x 
	INNER JOIN 	benefitpoint.carrier_summary 	AS y 
		ON x.carrier_id = y.carrier_id; 
GO 

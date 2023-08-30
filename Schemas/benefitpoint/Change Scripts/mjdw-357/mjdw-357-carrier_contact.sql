/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE benefitpoint.carrier_contact 
	 DROP CONSTRAINT IF EXISTS carrier_contact_pkey 
	,ADD CONSTRAINT carrier_contact_carrier_id_uq 	UNIQUE (carrier_id)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON benefitpoint.carrier_contact; 
GO
DROP TRIGGER IF EXISTS audit_i ON benefitpoint.carrier_contact; 
GO
DROP TRIGGER IF EXISTS audit_u ON benefitpoint.carrier_contact; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON benefitpoint.carrier_contact; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON benefitpoint.carrier_contact FOR EACH ROW EXECUTE FUNCTION audit.tr_benefitpoint_log_change(); 
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
		,'carrier_contact' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.carrier_id
						,x.old_all_contact 			AS all_contact 
						,x.old_title 			AS title 
						,x.old_assistant_first_name 			AS assistant_first_name 
						,x.old_assistant_last_name 			AS assistant_last_name 
						,x.old_assistant_email 			AS assistant_email 
						,x.old_market_size 			AS market_size 
						,x.old_notes 			AS notes 
						,x.old_last_modified_on 			AS last_modified_on 
			) 	AS _ 
		) 			AS new_record 
FROM benefitpoint.audit_carrier_contact 	AS x 
	INNER JOIN 	benefitpoint.carrier_contact 	AS y 
		ON x.carrier_id = y.carrier_id; 
GO 

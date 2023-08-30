/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE benefitpoint.address 
	 DROP CONSTRAINT IF EXISTS address_pkey 
	,ADD CONSTRAINT address_address_source_uq 	UNIQUE (address_source)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON benefitpoint.address; 
GO
DROP TRIGGER IF EXISTS audit_i ON benefitpoint.address; 
GO
DROP TRIGGER IF EXISTS audit_u ON benefitpoint.address; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON benefitpoint.address; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON benefitpoint.address FOR EACH ROW EXECUTE FUNCTION audit.tr_benefitpoint_log_change(); 
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
		,'address' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.address_source
						,x.source_type
						,x.source_key
						,x.old_street_1 			AS street_1 
						,x.old_street_2 			AS street_2 
						,x.old_city 			AS city 
						,x.old_state 			AS state 
						,x.old_zip 			AS zip 
						,x.old_country 			AS country 
			) 	AS _ 
		) 			AS new_record 
FROM benefitpoint.audit_address 	AS x 
	INNER JOIN 	benefitpoint.address 	AS y 
		ON x.address_source = y.address_source
			 AND x.source_type = y.source_type
			 AND x.source_key = y.source_key; 
GO 

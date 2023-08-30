/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE benefitpoint.rate_tier 
	 DROP CONSTRAINT IF EXISTS rate_tier_pkey 
	,ADD CONSTRAINT rate_tier_rate_field_id_uq 	UNIQUE (rate_field_id)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON benefitpoint.rate_tier; 
GO
DROP TRIGGER IF EXISTS audit_i ON benefitpoint.rate_tier; 
GO
DROP TRIGGER IF EXISTS audit_u ON benefitpoint.rate_tier; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON benefitpoint.rate_tier; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON benefitpoint.rate_tier FOR EACH ROW EXECUTE FUNCTION audit.tr_benefitpoint_log_change(); 
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
		,'rate_tier' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.rate_field_id
						,x.rate_tier_id
						,x.old_description 			AS description 
						,x.old_allow_include_ee 			AS allow_include_ee 
			) 	AS _ 
		) 			AS new_record 
FROM benefitpoint.audit_rate_tier 	AS x 
	INNER JOIN 	benefitpoint.rate_tier 	AS y 
		ON x.rate_field_id = y.rate_field_id
			 AND x.rate_tier_id = y.rate_tier_id; 
GO 

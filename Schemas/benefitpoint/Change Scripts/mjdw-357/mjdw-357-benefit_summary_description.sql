/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE benefitpoint.benefit_summary_description 
	 DROP CONSTRAINT IF EXISTS benefit_summary_description_pkey 
	,ADD CONSTRAINT benefit_summary_description_rate_id_uq 	UNIQUE (rate_id)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON benefitpoint.benefit_summary_description; 
GO
DROP TRIGGER IF EXISTS audit_i ON benefitpoint.benefit_summary_description; 
GO
DROP TRIGGER IF EXISTS audit_u ON benefitpoint.benefit_summary_description; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON benefitpoint.benefit_summary_description; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON benefitpoint.benefit_summary_description FOR EACH ROW EXECUTE FUNCTION audit.tr_benefitpoint_log_change(); 
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
		,'benefit_summary_description' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.rate_id
						,x.benefit_summary_id
						,x.old_product_id 			AS product_id 
						,x.old_description 			AS description 
			) 	AS _ 
		) 			AS new_record 
FROM benefitpoint.audit_benefit_summary_description 	AS x 
	INNER JOIN 	benefitpoint.benefit_summary_description 	AS y 
		ON x.rate_id = y.rate_id
			 AND x.benefit_summary_id = y.benefit_summary_id; 
GO 

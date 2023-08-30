/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE benefitpoint.product_type 
	 DROP CONSTRAINT IF EXISTS product_type_pkey 
	,ADD CONSTRAINT product_type_product_type_id_uq 	UNIQUE (product_type_id)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON benefitpoint.product_type; 
GO
DROP TRIGGER IF EXISTS audit_i ON benefitpoint.product_type; 
GO
DROP TRIGGER IF EXISTS audit_u ON benefitpoint.product_type; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON benefitpoint.product_type; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON benefitpoint.product_type FOR EACH ROW EXECUTE FUNCTION audit.tr_benefitpoint_log_change(); 
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
		,'product_type' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.product_type_id
						,x.old_short_description 			AS short_description 
						,x.old_long_description 			AS long_description 
						,x.old_line_of_coverage 			AS line_of_coverage 
						,x.old_rate_types 			AS rate_types 
			) 	AS _ 
		) 			AS new_record 
FROM benefitpoint.audit_product_type 	AS x 
	INNER JOIN 	benefitpoint.product_type 	AS y 
		ON x.product_type_id = y.product_type_id; 
GO 

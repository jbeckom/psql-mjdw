/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE benefitpoint.additional_product_attribute 
	 DROP CONSTRAINT IF EXISTS additional_product_attribute_pkey 
	,ADD CONSTRAINT additional_product_attribute_product_id_uq 	UNIQUE (product_id)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON benefitpoint.additional_product_attribute; 
GO
DROP TRIGGER IF EXISTS audit_i ON benefitpoint.additional_product_attribute; 
GO
DROP TRIGGER IF EXISTS audit_u ON benefitpoint.additional_product_attribute; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON benefitpoint.additional_product_attribute; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON benefitpoint.additional_product_attribute FOR EACH ROW EXECUTE FUNCTION audit.tr_benefitpoint_log_change(); 
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
		,'additional_product_attribute' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.product_id
						,x.account_id
						,x.attribute_id
						,x.old_name 			AS name 
						,x.old_field_value_type 			AS field_value_type 
						,x.old_value_num 			AS value_num 
						,x.old_value_text 			AS value_text 
						,x.old_value_date 			AS value_date 
						,x.old_option_value_id 			AS option_value_id 
			) 	AS _ 
		) 			AS new_record 
FROM benefitpoint.audit_additional_product_attribute 	AS x 
	INNER JOIN 	benefitpoint.additional_product_attribute 	AS y 
		ON x.product_id = y.product_id
			 AND x.account_id = y.account_id
			 AND x.attribute_id = y.attribute_id; 
GO 

/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE benefitpoint.custom_field 
	 DROP CONSTRAINT IF EXISTS custom_field_pkey 
	,ADD CONSTRAINT custom_field_custom_field_id_uq 	UNIQUE (custom_field_id)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON benefitpoint.custom_field; 
GO
DROP TRIGGER IF EXISTS audit_i ON benefitpoint.custom_field; 
GO
DROP TRIGGER IF EXISTS audit_u ON benefitpoint.custom_field; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON benefitpoint.custom_field; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON benefitpoint.custom_field FOR EACH ROW EXECUTE FUNCTION audit.tr_benefitpoint_log_change(); 
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
		,'custom_field' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.custom_field_id
						,x.old_custom_section 			AS custom_section 
						,x.old_field_type 			AS field_type 
						,x.old_field_value_type 			AS field_value_type 
						,x.old_length 			AS length 
						,x.old_label 			AS label 
						,x.old_required 			AS required 
						,x.old_active 			AS active 
						,x.old_sort_order 			AS sort_order 
						,x.old_phi 			AS phi 
						,x.old_sagitta 			AS sagitta 
						,x.old_sagitta_category 			AS sagitta_category 
						,x.old_dependent_field_parent_id 			AS dependent_field_parent_id 
			) 	AS _ 
		) 			AS new_record 
FROM benefitpoint.audit_custom_field 	AS x 
	INNER JOIN 	benefitpoint.custom_field 	AS y 
		ON x.custom_field_id = y.custom_field_id; 
GO 

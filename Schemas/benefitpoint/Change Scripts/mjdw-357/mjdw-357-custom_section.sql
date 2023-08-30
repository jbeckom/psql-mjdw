/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE benefitpoint.custom_section 
	 DROP CONSTRAINT IF EXISTS custom_section_pkey 
	,ADD CONSTRAINT custom_section_customization_area_uq 	UNIQUE (customization_area)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON benefitpoint.custom_section; 
GO
DROP TRIGGER IF EXISTS audit_i ON benefitpoint.custom_section; 
GO
DROP TRIGGER IF EXISTS audit_u ON benefitpoint.custom_section; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON benefitpoint.custom_section; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON benefitpoint.custom_section FOR EACH ROW EXECUTE FUNCTION audit.tr_benefitpoint_log_change(); 
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
		,'custom_section' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.customization_area
						,x.label
						,x.old_sort_order 			AS sort_order 
						,x.old_active 			AS active 
						,x.old_account_customization_categories 			AS account_customization_categories 
			) 	AS _ 
		) 			AS new_record 
FROM benefitpoint.audit_custom_section 	AS x 
	INNER JOIN 	benefitpoint.custom_section 	AS y 
		ON x.customization_area = y.customization_area
			 AND x.label = y.label; 
GO 

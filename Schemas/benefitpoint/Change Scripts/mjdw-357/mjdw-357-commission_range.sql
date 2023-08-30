/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE benefitpoint.commission_range 
	 DROP CONSTRAINT IF EXISTS commission_range_pkey 
	,ADD CONSTRAINT commission_range_source_type_uq 	UNIQUE (source_type)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON benefitpoint.commission_range; 
GO
DROP TRIGGER IF EXISTS audit_i ON benefitpoint.commission_range; 
GO
DROP TRIGGER IF EXISTS audit_u ON benefitpoint.commission_range; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON benefitpoint.commission_range; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON benefitpoint.commission_range FOR EACH ROW EXECUTE FUNCTION audit.tr_benefitpoint_log_change(); 
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
		,'commission_range' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.source_type
						,x.commission_id
						,x.sort_order
						,x.old_value 			AS value 
						,x.old_value_unit_of_measure 			AS value_unit_of_measure 
						,x.old_from_range 			AS from_range 
						,x.old_to_range 			AS to_range 
			) 	AS _ 
		) 			AS new_record 
FROM benefitpoint.audit_commission_range 	AS x 
	INNER JOIN 	benefitpoint.commission_range 	AS y 
		ON x.source_type = y.source_type
			 AND x.commission_id = y.commission_id
			 AND x.sort_order = y.sort_order; 
GO 

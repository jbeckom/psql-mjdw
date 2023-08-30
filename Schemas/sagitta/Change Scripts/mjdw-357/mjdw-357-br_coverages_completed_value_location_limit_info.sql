/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE sagitta.br_coverages_completed_value_location_limit_info 
	 DROP CONSTRAINT IF EXISTS br_coverages_completed_value_location_limit_info_pkey 
	,ADD CONSTRAINT br_coverages_completed_value_location_limit_info_sagitem_uq 	UNIQUE (sagitem)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON sagitta.br_coverages_completed_value_location_limit_info; 
GO
DROP TRIGGER IF EXISTS audit_i ON sagitta.br_coverages_completed_value_location_limit_info; 
GO
DROP TRIGGER IF EXISTS audit_u ON sagitta.br_coverages_completed_value_location_limit_info; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON sagitta.br_coverages_completed_value_location_limit_info; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON sagitta.br_coverages_completed_value_location_limit_info FOR EACH ROW EXECUTE FUNCTION audit.tr_sagitta_log_change(); 
GO
 
/*** MOVE AUDIT DATA FROM LEGACY TABLE(S) TO NEW AUDIT SCHEMA ***/
INSERT INTO audit.sagitta_log (audit_time, audit_user, audit_client, operation, table_name, table_key, new_record) 
SELECT 	 x.audit_timestamp 			AS audit_time 
		,x.audit_user 			AS audit_user 
		,'0.0.0.0'::inet 			AS audit_client 
		,CASE 
			WHEN x.audit_action = 'D' THEN 'DELETE' 
			WHEN x.audit_action = 'I' THEN 'INSERT' 
			WHEN x.audit_action = 'U' THEN 'UPDATE' 
		END 			AS operation 
		,'br_coverages_completed_value_location_limit_info' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.sagitem
						,x.lis
						,x.old_completed_value_location_number 			AS completed_value_location_number 
						,x.old_completed_value_sub_location_number 			AS completed_value_sub_location_number 
						,x.old_completed_value_site_limit 			AS completed_value_site_limit 
			) 	AS _ 
		) 			AS new_record 
FROM sagitta.audit_br_coverages_completed_value_location_limit_info 	AS x 
	INNER JOIN 	sagitta.br_coverages_completed_value_location_limit_info 	AS y 
		ON x.sagitem = y.sagitem
			 AND x.lis = y.lis; 
GO 

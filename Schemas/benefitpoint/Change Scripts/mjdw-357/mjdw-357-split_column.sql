/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE benefitpoint.split_column 
	 DROP CONSTRAINT IF EXISTS split_column_pkey 
	,ADD CONSTRAINT split_column_split_id_uq 	UNIQUE (split_id)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON benefitpoint.split_column; 
GO
DROP TRIGGER IF EXISTS audit_i ON benefitpoint.split_column; 
GO
DROP TRIGGER IF EXISTS audit_u ON benefitpoint.split_column; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON benefitpoint.split_column; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON benefitpoint.split_column FOR EACH ROW EXECUTE FUNCTION audit.tr_benefitpoint_log_change(); 
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
		,'split_column' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.split_id
						,x.split_column_id
						,x.old_split_basis_type 			AS split_basis_type 
						,x.old_split_column_type 			AS split_column_type 
			) 	AS _ 
		) 			AS new_record 
FROM benefitpoint.audit_split_column 	AS x 
	INNER JOIN 	benefitpoint.split_column 	AS y 
		ON x.split_id = y.split_id
			 AND x.split_column_id = y.split_column_id; 
GO 

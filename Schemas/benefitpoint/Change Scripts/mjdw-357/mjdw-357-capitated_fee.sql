/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE benefitpoint.capitated_fee 
	 DROP CONSTRAINT IF EXISTS capitated_fee_pkey 
	,ADD CONSTRAINT capitated_fee_commission_id_uq 	UNIQUE (commission_id)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON benefitpoint.capitated_fee; 
GO
DROP TRIGGER IF EXISTS audit_i ON benefitpoint.capitated_fee; 
GO
DROP TRIGGER IF EXISTS audit_u ON benefitpoint.capitated_fee; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON benefitpoint.capitated_fee; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON benefitpoint.capitated_fee FOR EACH ROW EXECUTE FUNCTION audit.tr_benefitpoint_log_change(); 
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
		,'capitated_fee' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.commission_id
						,x.old_fee 			AS fee 
						,x.old_estimated_number_of_employees 			AS estimated_number_of_employees 
						,x.old_fee_lives_type 			AS fee_lives_type 
						,x.old_fee_interval_type 			AS fee_interval_type 
			) 	AS _ 
		) 			AS new_record 
FROM benefitpoint.audit_capitated_fee 	AS x 
	INNER JOIN 	benefitpoint.capitated_fee 	AS y 
		ON x.commission_id = y.commission_id; 
GO 

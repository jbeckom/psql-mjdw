/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE benefitpoint.split_payee 
	 DROP CONSTRAINT IF EXISTS split_payee_pkey 
	,ADD CONSTRAINT split_payee_split_id_uq 	UNIQUE (split_id)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON benefitpoint.split_payee; 
GO
DROP TRIGGER IF EXISTS audit_i ON benefitpoint.split_payee; 
GO
DROP TRIGGER IF EXISTS audit_u ON benefitpoint.split_payee; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON benefitpoint.split_payee; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON benefitpoint.split_payee FOR EACH ROW EXECUTE FUNCTION audit.tr_benefitpoint_log_change(); 
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
		,'split_payee' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.split_id
						,x.payee_id
						,x.old_commission 			AS commission 
						,x.old_override 			AS override 
						,x.old_bonus 			AS bonus 
						,x.old_bob 			AS bob 
						,x.old_sort_order 			AS sort_order 
						,x.old_ignore_split_team 			AS ignore_split_team 
						,x.old_round_to 			AS round_to 
						,x.old_payee_role_type 			AS payee_role_type 
			) 	AS _ 
		) 			AS new_record 
FROM benefitpoint.audit_split_payee 	AS x 
	INNER JOIN 	benefitpoint.split_payee 	AS y 
		ON x.split_id = y.split_id
			 AND x.payee_id = y.payee_id; 
GO 

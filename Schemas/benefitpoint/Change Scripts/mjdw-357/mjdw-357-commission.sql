/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE benefitpoint.commission 
	 DROP CONSTRAINT IF EXISTS commission_pkey 
	,ADD CONSTRAINT commission_rate_id_uq 	UNIQUE (rate_id)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON benefitpoint.commission; 
GO
DROP TRIGGER IF EXISTS audit_i ON benefitpoint.commission; 
GO
DROP TRIGGER IF EXISTS audit_u ON benefitpoint.commission; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON benefitpoint.commission; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON benefitpoint.commission FOR EACH ROW EXECUTE FUNCTION audit.tr_benefitpoint_log_change(); 
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
		,'commission' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.rate_id
						,x.commission_id
						,x.old_commission_type 			AS commission_type 
						,x.old_commission_paid_by 			AS commission_paid_by 
						,x.old_description 			AS description 
						,x.old_estimated_monthly_revenue 			AS estimated_monthly_revenue 
						,x.old_additional_info 			AS additional_info 
						,x.old_flat_percentage_of_premium 			AS flat_percentage_of_premium 
						,x.old_premium_override_amount 			AS premium_override_amount 
						,x.old_estimated_number_of_members 			AS estimated_number_of_members 
			) 	AS _ 
		) 			AS new_record 
FROM benefitpoint.audit_commission 	AS x 
	INNER JOIN 	benefitpoint.commission 	AS y 
		ON x.rate_id = y.rate_id
			 AND x.commission_id = y.commission_id; 
GO 

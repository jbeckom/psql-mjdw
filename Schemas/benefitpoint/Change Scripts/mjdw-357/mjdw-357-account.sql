/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE benefitpoint.account 
	 DROP CONSTRAINT IF EXISTS account_pkey 
	,ADD CONSTRAINT account_account_id_uq 	UNIQUE (account_id)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON benefitpoint.account; 
GO
DROP TRIGGER IF EXISTS audit_i ON benefitpoint.account; 
GO
DROP TRIGGER IF EXISTS audit_u ON benefitpoint.account; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON benefitpoint.account; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON benefitpoint.account FOR EACH ROW EXECUTE FUNCTION audit.tr_benefitpoint_log_change(); 
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
		,'account' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.account_id
						,x.old_active 			AS active 
						,x.old_inactive_as_of 			AS inactive_as_of 
						,x.old_inactive_reason 			AS inactive_reason 
						,x.old_account_classification 			AS account_classification 
						,x.old_account_type 			AS account_type 
						,x.old_office_id 			AS office_id 
						,x.old_department_id 			AS department_id 
						,x.old_administrator_user_id 			AS administrator_user_id 
						,x.old_primary_contact_user_id 			AS primary_contact_user_id 
						,x.old_primary_sales_lead_user_id 			AS primary_sales_lead_user_id 
						,x.old_primary_service_lead_user_id 			AS primary_service_lead_user_id 
						,x.old_notes 			AS notes 
						,x.old_last_reviewed_by_user_id 			AS last_reviewed_by_user_id 
						,x.old_last_reviewed_on 			AS last_reviewed_on 
						,x.old_created_on 			AS created_on 
						,x.old_last_modified_on 			AS last_modified_on 
						,x.old_agency_account_id 			AS agency_account_id 
						,x.old_excluded_purge 			AS excluded_purge 
			) 	AS _ 
		) 			AS new_record 
FROM benefitpoint.audit_account 	AS x 
	INNER JOIN 	benefitpoint.account 	AS y 
		ON x.account_id = y.account_id; 
GO 

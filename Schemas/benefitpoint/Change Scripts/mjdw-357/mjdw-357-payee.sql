/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE benefitpoint.payee 
	 DROP CONSTRAINT IF EXISTS payee_pkey 
	,ADD CONSTRAINT payee_payee_id_uq 	UNIQUE (payee_id)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON benefitpoint.payee; 
GO
DROP TRIGGER IF EXISTS audit_i ON benefitpoint.payee; 
GO
DROP TRIGGER IF EXISTS audit_u ON benefitpoint.payee; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON benefitpoint.payee; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON benefitpoint.payee FOR EACH ROW EXECUTE FUNCTION audit.tr_benefitpoint_log_change(); 
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
		,'payee' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.payee_id
						,x.old_payee_type 			AS payee_type 
						,x.old_payee_code 			AS payee_code 
						,x.old_house_account 			AS house_account 
						,x.old_tax_payer_id_number 			AS tax_payer_id_number 
						,x.old_revenue_goal 			AS revenue_goal 
						,x.old_commission_goal 			AS commission_goal 
						,x.old_renewal_revenue_goal 			AS renewal_revenue_goal 
						,x.old_renewal_commission_goal 			AS renewal_commission_goal 
						,x.old_replacement_revenue_goal 			AS replacement_revenue_goal 
						,x.old_replacement_commission_goal 			AS replacement_commission_goal 
						,x.old_notes 			AS notes 
						,x.old_include_in_book_of_business 			AS include_in_book_of_business 
						,x.old_over_payement_payee 			AS over_payement_payee 
						,x.old_internal_payee 			AS internal_payee 
						,x.old_last_modified_on 			AS last_modified_on 
						,x.old_created_on 			AS created_on 
			) 	AS _ 
		) 			AS new_record 
FROM benefitpoint.audit_payee 	AS x 
	INNER JOIN 	benefitpoint.payee 	AS y 
		ON x.payee_id = y.payee_id; 
GO 

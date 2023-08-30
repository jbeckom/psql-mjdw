/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE benefitpoint.product 
	 DROP CONSTRAINT IF EXISTS product_pkey 
	,ADD CONSTRAINT product_product_id_uq 	UNIQUE (product_id)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON benefitpoint.product; 
GO
DROP TRIGGER IF EXISTS audit_i ON benefitpoint.product; 
GO
DROP TRIGGER IF EXISTS audit_u ON benefitpoint.product; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON benefitpoint.product; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON benefitpoint.product FOR EACH ROW EXECUTE FUNCTION audit.tr_benefitpoint_log_change(); 
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
		,'product' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.product_id
						,x.account_id
						,x.old_product_type_id 			AS product_type_id 
						,x.old_is_additional_product 			AS is_additional_product 
						,x.old_product_status 			AS product_status 
						,x.old_name 			AS name 
						,x.old_carrier_id 			AS carrier_id 
						,x.old_broker_of_record_account_id 			AS broker_of_record_account_id 
						,x.old_broker_of_record_as_of 			AS broker_of_record_as_of 
						,x.old_policy_number 			AS policy_number 
						,x.old_policy_origination_reason 			AS policy_origination_reason 
						,x.old_policy_origination_reason_qualifier_id 			AS policy_origination_reason_qualifier_id 
						,x.old_parent_product_id 			AS parent_product_id 
						,x.old_effective_as_of 			AS effective_as_of 
						,x.old_renewal_on 			AS renewal_on 
						,x.old_continuous_policy 			AS continuous_policy 
						,x.old_original_effective_as_of 			AS original_effective_as_of 
						,x.old_cancellation_on 			AS cancellation_on 
						,x.old_cancellation_reason 			AS cancellation_reason 
						,x.old_cancellation_additional_information 			AS cancellation_additional_information 
						,x.old_reinstatement_on 			AS reinstatement_on 
						,x.old_reinstatement_reason 			AS reinstatement_reason 
						,x.old_reinstatement_additional_information 			AS reinstatement_additional_information 
						,x.old_voluntary_product 			AS voluntary_product 
						,x.old_union_product 			AS union_product 
						,x.old_non_payable 			AS non_payable 
						,x.old_non_revenue 			AS non_revenue 
						,x.old_premium_payment_frequency 			AS premium_payment_frequency 
						,x.old_number_of_eligible_employees 			AS number_of_eligible_employees 
						,x.old_total_estimated_monthly_revenue 			AS total_estimated_monthly_revenue 
						,x.old_total_estimated_monthly_premium 			AS total_estimated_monthly_premium 
						,x.old_billing_type 			AS billing_type 
						,x.old_billing_carrier_type 			AS billing_carrier_type 
						,x.old_billing_carrier_id 			AS billing_carrier_id 
						,x.old_office_id 			AS office_id 
						,x.old_department_id 			AS department_id 
						,x.old_primary_sales_lead_user_id 			AS primary_sales_lead_user_id 
						,x.old_primary_servicer_lead_user_id 			AS primary_servicer_lead_user_id 
						,x.old_last_modified_on 			AS last_modified_on 
						,x.old_created_on 			AS created_on 
						,x.old_metal_level_type 			AS metal_level_type 
						,x.old_aca_safe_harbor_type 			AS aca_safe_harbor_type 
						,x.old_aca_sage_harbor_reporting_year 			AS aca_sage_harbor_reporting_year 
						,x.old_custom_cancellation_reason_id 			AS custom_cancellation_reason_id 
			) 	AS _ 
		) 			AS new_record 
FROM benefitpoint.audit_product 	AS x 
	INNER JOIN 	benefitpoint.product 	AS y 
		ON x.product_id = y.product_id
			 AND x.account_id = y.account_id; 
GO 

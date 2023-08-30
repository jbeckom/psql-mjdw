/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE benefitpoint.rate 
	 DROP CONSTRAINT IF EXISTS rate_pkey 
	,ADD CONSTRAINT rate_rate_id_uq 	UNIQUE (rate_id)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON benefitpoint.rate; 
GO
DROP TRIGGER IF EXISTS audit_i ON benefitpoint.rate; 
GO
DROP TRIGGER IF EXISTS audit_u ON benefitpoint.rate; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON benefitpoint.rate; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON benefitpoint.rate FOR EACH ROW EXECUTE FUNCTION audit.tr_benefitpoint_log_change(); 
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
		,'rate' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.rate_id
						,x.product_id
						,x.old_response_id 			AS response_id 
						,x.old_description 			AS description 
						,x.old_rate_type_id 			AS rate_type_id 
						,x.old_rate_type_tier_id 			AS rate_type_tier_id 
						,x.old_effective_as_of 			AS effective_as_of 
						,x.old_expiration_on 			AS expiration_on 
						,x.old_include_ee 			AS include_ee 
						,x.old_age_banded 			AS age_banded 
						,x.old_age_banded_start_on 			AS age_banded_start_on 
						,x.old_age_banded_end_on 			AS age_banded_end_on 
						,x.old_age_banded_interval 			AS age_banded_interval 
						,x.old_age_banded_gender_specific 			AS age_banded_gender_specific 
						,x.old_rating_method 			AS rating_method 
						,x.old_estimated_monthly_premium 			AS estimated_monthly_premium 
						,x.old_estimated_monthly_revenue 			AS estimated_monthly_revenue 
						,x.old_additional_info 			AS additional_info 
						,x.old_rate_guarantee 			AS rate_guarantee 
						,x.old_rate_guarantee_uom 			AS rate_guarantee_uom 
						,x.old_number_of_lives_as_of 			AS number_of_lives_as_of 
						,x.old_payment_cycle 			AS payment_cycle 
						,x.old_renewal_percentage_change 			AS renewal_percentage_change 
						,x.old_last_modified_on 			AS last_modified_on 
						,x.old_created_on 			AS created_on 
			) 	AS _ 
		) 			AS new_record 
FROM benefitpoint.audit_rate 	AS x 
	INNER JOIN 	benefitpoint.rate 	AS y 
		ON x.rate_id = y.rate_id
			 AND x.product_id = y.product_id; 
GO 

/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE powerapps.account 
	 DROP CONSTRAINT IF EXISTS account_pkey 
	,ADD CONSTRAINT account_guid_uq 	UNIQUE (guid)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON powerapps.account; 
GO
DROP TRIGGER IF EXISTS audit_i ON powerapps.account; 
GO
DROP TRIGGER IF EXISTS audit_u ON powerapps.account; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON powerapps.account; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON powerapps.account FOR EACH ROW EXECUTE FUNCTION audit.tr_powerapps_log_change(); 
GO
 
/*** MOVE AUDIT DATA FROM LEGACY TABLE(S) TO NEW AUDIT SCHEMA ***/
INSERT INTO audit.powerapps_log (audit_time, audit_user, audit_client, operation, table_name, table_key, new_record) 
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
				SELECT 	 x.guid
						,x.old_account_name 			AS account_name 
						,x.old_client_code 			AS client_code 
						,x.old_client_category 			AS client_category 
						,x.old_pc_client_category 			AS pc_client_category 
						,x.old_medical_funding_type 			AS medical_funding_type 
						,x.old_enrolled_employees 			AS enrolled_employees 
						,x.old_bor_dt 			AS bor_dt 
						,x.old_erisa_info 			AS erisa_info 
						,x.old_stop_loss_renew_dt 			AS stop_loss_renew_dt 
						,x.old_benefit_plan_change_effective_date 			AS benefit_plan_change_effective_date 
						,x.old_industry 			AS industry 
						,x.old_dba 			AS dba 
						,x.old_eb_primary_sic 			AS eb_primary_sic 
						,x.old_pc_primary_sic 			AS pc_primary_sic 
						,x.old_pc_second_sic 			AS pc_second_sic 
						,x.old_pc_tertiary_sic 			AS pc_tertiary_sic 
						,x.old_other_subsidiaries 			AS other_subsidiaries 
						,x.old_pc_client_profile 			AS pc_client_profile 
						,x.old_eb_client_profile 			AS eb_client_profile 
						,x.old_eb_account_classification 			AS eb_account_classification 
						,x.old_client_rev_25k 			AS client_rev_25k 
						,x.old_revenue_range 			AS revenue_range 
						,x.old_ein 			AS ein 
						,x.old_naics_description 			AS naics_description 
						,x.old_web_url 			AS web_url 
						,x.old_parent_account 			AS parent_account 
						,x.old_primary_contact 			AS primary_contact 
						,x.old_account_owner 			AS account_owner 
						,x.old_status_code 			AS status_code 
						,x.old_status_reason 			AS status_reason 
						,x.old_total_rewards_producer 			AS total_rewards_producer 
			) 	AS _ 
		) 			AS new_record 
FROM powerapps.audit_account 	AS x 
	INNER JOIN 	powerapps.account 	AS y 
		ON x.guid = y.guid; 
GO 

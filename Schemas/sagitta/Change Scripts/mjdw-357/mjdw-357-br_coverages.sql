/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE sagitta.br_coverages 
	 DROP CONSTRAINT IF EXISTS br_coverages_pkey 
	,ADD CONSTRAINT br_coverages_sagitem_uq 	UNIQUE (sagitem)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON sagitta.br_coverages; 
GO
DROP TRIGGER IF EXISTS audit_i ON sagitta.br_coverages; 
GO
DROP TRIGGER IF EXISTS audit_u ON sagitta.br_coverages; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON sagitta.br_coverages; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON sagitta.br_coverages FOR EACH ROW EXECUTE FUNCTION audit.tr_sagitta_log_change(); 
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
		,'br_coverages' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.sagitem
						,x.old_audit_staff_cd 			AS audit_staff_cd 
						,x.old_audit_entry_dt 			AS audit_entry_dt 
						,x.old_audit_time 			AS audit_time 
						,x.old_audit_cd 			AS audit_cd 
						,x.old_audit_history_record_number 			AS audit_history_record_number 
						,x.old_audit_program 			AS audit_program 
						,x.old_audit_effective_dt 			AS audit_effective_dt 
						,x.old_audit_change_agency_id 			AS audit_change_agency_id 
						,x.old_policy_agency_id 			AS policy_agency_id 
						,x.old_builders_risk_yes_no_cd 			AS builders_risk_yes_no_cd 
						,x.old_installation_yes_no_cd 			AS installation_yes_no_cd 
						,x.old_open_reporting_ind 			AS open_reporting_ind 
						,x.old_job_specified_ind 			AS job_specified_ind 
						,x.old_completed_value 			AS completed_value 
						,x.old_job_specific_location_limit 			AS job_specific_location_limit 
						,x.old_job_specific_temporary_limit 			AS job_specific_temporary_limit 
						,x.old_job_specific_transit_limit 			AS job_specific_transit_limit 
						,x.old_job_specific_max_paid 			AS job_specific_max_paid 
						,x.old_first_any_one_location_limit 			AS first_any_one_location_limit 
						,x.old_first_any_one_location_construction 			AS first_any_one_location_construction 
						,x.old_second_any_one_location_limit 			AS second_any_one_location_limit 
						,x.old_second_any_one_location_construction 			AS second_any_one_location_construction 
						,x.old_per_disaster_limit 			AS per_disaster_limit 
						,x.old_temporary_location_limit 			AS temporary_location_limit 
						,x.old_transit_limit 			AS transit_limit 
						,x.old_addl_cov_ind 			AS addl_cov_ind 
						,x.old_off_dt 			AS off_dt 
						,x.old_reporting_annual_premium_amt 			AS reporting_annual_premium_amt 
						,x.old_reporting_adj_period 			AS reporting_adj_period 
						,x.old_reporting_deposit_amt 			AS reporting_deposit_amt 
						,x.old_reporting_period 			AS reporting_period 
			) 	AS _ 
		) 			AS new_record 
FROM sagitta.audit_br_coverages 	AS x 
	INNER JOIN 	sagitta.br_coverages 	AS y 
		ON x.sagitem = y.sagitem; 
GO 

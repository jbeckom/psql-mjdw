/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE sagitta.wc_coverages 
	 DROP CONSTRAINT IF EXISTS wc_coverages_pkey 
	,ADD CONSTRAINT wc_coverages_sagitem_uq 	UNIQUE (sagitem)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON sagitta.wc_coverages; 
GO
DROP TRIGGER IF EXISTS audit_i ON sagitta.wc_coverages; 
GO
DROP TRIGGER IF EXISTS audit_u ON sagitta.wc_coverages; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON sagitta.wc_coverages; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON sagitta.wc_coverages FOR EACH ROW EXECUTE FUNCTION audit.tr_sagitta_log_change(); 
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
		,'wc_coverages' 			AS table_name 
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
						,x.old_empl_liab_acc_limit 			AS empl_liab_acc_limit 
						,x.old_disease_per_empl_limit 			AS disease_per_empl_limit 
						,x.old_disease_policy_limit 			AS disease_policy_limit 
						,x.old_empl_liab_premium_amt 			AS empl_liab_premium_amt 
						,x.old_uslh_ind 			AS uslh_ind 
						,x.old_uslh_premium_amt 			AS uslh_premium_amt 
						,x.old_voluntary_comp_ind 			AS voluntary_comp_ind 
						,x.old_voluntary_comp_premium_amt 			AS voluntary_comp_premium_amt 
						,x.old_other_states_ind 			AS other_states_ind 
						,x.old_other_states_premium_amt 			AS other_states_premium_amt 
						,x.old_excluded_states 			AS excluded_states 
						,x.old_included_states 			AS included_states 
						,x.old_off_dt 			AS off_dt 
						,x.old_rate 			AS rate 
						,x.old_statutory_limits_apply 			AS statutory_limits_apply 
			) 	AS _ 
		) 			AS new_record 
FROM sagitta.audit_wc_coverages 	AS x 
	INNER JOIN 	sagitta.wc_coverages 	AS y 
		ON x.sagitem = y.sagitem; 
GO 

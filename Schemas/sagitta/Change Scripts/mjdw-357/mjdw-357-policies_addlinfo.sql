/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE sagitta.policies_addlinfo 
	 DROP CONSTRAINT IF EXISTS policies_addlinfo_pkey 
	,ADD CONSTRAINT policies_addlinfo_sagitem_uq 	UNIQUE (sagitem)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON sagitta.policies_addlinfo; 
GO
DROP TRIGGER IF EXISTS audit_i ON sagitta.policies_addlinfo; 
GO
DROP TRIGGER IF EXISTS audit_u ON sagitta.policies_addlinfo; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON sagitta.policies_addlinfo; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON sagitta.policies_addlinfo FOR EACH ROW EXECUTE FUNCTION audit.tr_sagitta_log_change(); 
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
		,'policies_addlinfo' 			AS table_name 
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
						,x.old_rewrite 			AS rewrite 
						,x.old_new_policy_new_client 			AS new_policy_new_client 
						,x.old_new_policy_existing_client 			AS new_policy_existing_client 
						,x.old_new_policy_spinoff_from_current_client 			AS new_policy_spinoff_from_current_client 
						,x.old_new_policy_aor 			AS new_policy_aor 
						,x.old_cancel_policy 			AS cancel_policy 
						,x.old_pkg_includes_auto 			AS pkg_includes_auto 
						,x.old_pkg_includes_umbrella 			AS pkg_includes_umbrella 
						,x.old_cancel_entire_client 			AS cancel_entire_client 
						,x.old_included_on_another_policy_at_renewal 			AS included_on_another_policy_at_renewal 
						,x.old_bond_amount 			AS bond_amount 
			) 	AS _ 
		) 			AS new_record 
FROM sagitta.audit_policies_addlinfo 	AS x 
	INNER JOIN 	sagitta.policies_addlinfo 	AS y 
		ON x.sagitem = y.sagitem; 
GO 

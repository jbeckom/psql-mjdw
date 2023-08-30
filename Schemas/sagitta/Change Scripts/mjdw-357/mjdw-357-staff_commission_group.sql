/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE sagitta.staff_commission_group 
	 DROP CONSTRAINT IF EXISTS staff_commission_group_pkey 
	,ADD CONSTRAINT staff_commission_group_sagitem_uq 	UNIQUE (sagitem)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON sagitta.staff_commission_group; 
GO
DROP TRIGGER IF EXISTS audit_i ON sagitta.staff_commission_group; 
GO
DROP TRIGGER IF EXISTS audit_u ON sagitta.staff_commission_group; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON sagitta.staff_commission_group; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON sagitta.staff_commission_group FOR EACH ROW EXECUTE FUNCTION audit.tr_sagitta_log_change(); 
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
		,'staff_commission_group' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.sagitem
						,x.lis
						,x.old_standard_commission 			AS standard_commission 
						,x.old_type 			AS type 
						,x.old_insurer_id 			AS insurer_id 
						,x.old_coverage_cd 			AS coverage_cd 
						,x.old_from_amt 			AS from_amt 
						,x.old_to_amt 			AS to_amt 
						,x.old_ab_new_comm_percentage 			AS ab_new_comm_percentage 
						,x.old_ab_renewal_comm_percentage 			AS ab_renewal_comm_percentage 
						,x.old_cb_new_comm_percentage 			AS cb_new_comm_percentage 
						,x.old_cb_renew_comm_percentage 			AS cb_renew_comm_percentage 
						,x.old_start_dt 			AS start_dt 
						,x.old_end_dt 			AS end_dt 
						,x.old_comm_div 			AS comm_div 
						,x.old_comm_dept 			AS comm_dept 
			) 	AS _ 
		) 			AS new_record 
FROM sagitta.audit_staff_commission_group 	AS x 
	INNER JOIN 	sagitta.staff_commission_group 	AS y 
		ON x.sagitem = y.sagitem
			 AND x.lis = y.lis; 
GO 

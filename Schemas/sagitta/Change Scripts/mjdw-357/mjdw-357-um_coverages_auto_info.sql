/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE sagitta.um_coverages_auto_info 
	 DROP CONSTRAINT IF EXISTS um_coverages_auto_info_pkey 
	,ADD CONSTRAINT um_coverages_auto_info_sagitem_uq 	UNIQUE (sagitem)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON sagitta.um_coverages_auto_info; 
GO
DROP TRIGGER IF EXISTS audit_i ON sagitta.um_coverages_auto_info; 
GO
DROP TRIGGER IF EXISTS audit_u ON sagitta.um_coverages_auto_info; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON sagitta.um_coverages_auto_info; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON sagitta.um_coverages_auto_info FOR EACH ROW EXECUTE FUNCTION audit.tr_sagitta_log_change(); 
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
		,'um_coverages_auto_info' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.sagitem
						,x.lis
						,x.old_auto_pol_seq 			AS auto_pol_seq 
						,x.old_auto_pol_number 			AS auto_pol_number 
						,x.old_auto_insurer 			AS auto_insurer 
						,x.old_auto_insurer_name 			AS auto_insurer_name 
						,x.old_auto_effective_date 			AS auto_effective_date 
						,x.old_auto_exp_date 			AS auto_exp_date 
						,x.old_auto_any_auto_symbol 			AS auto_any_auto_symbol 
						,x.old_auto_rating_mod 			AS auto_rating_mod 
						,x.old_auto_csl_limit 			AS auto_csl_limit 
						,x.old_auto_bi_limit 			AS auto_bi_limit 
						,x.old_auto_pd_limit 			AS auto_pd_limit 
						,x.old_auto_csl_ann_prem 			AS auto_csl_ann_prem 
						,x.old_auto_bi_ann_prem 			AS auto_bi_ann_prem 
						,x.old_pd_ann_prem 			AS pd_ann_prem 
			) 	AS _ 
		) 			AS new_record 
FROM sagitta.audit_um_coverages_auto_info 	AS x 
	INNER JOIN 	sagitta.um_coverages_auto_info 	AS y 
		ON x.sagitem = y.sagitem
			 AND x.lis = y.lis; 
GO 

/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE sagitta.um_coverages_gl_pol_info 
	 DROP CONSTRAINT IF EXISTS um_coverages_gl_pol_info_pkey 
	,ADD CONSTRAINT um_coverages_gl_pol_info_sagitem_uq 	UNIQUE (sagitem)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON sagitta.um_coverages_gl_pol_info; 
GO
DROP TRIGGER IF EXISTS audit_i ON sagitta.um_coverages_gl_pol_info; 
GO
DROP TRIGGER IF EXISTS audit_u ON sagitta.um_coverages_gl_pol_info; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON sagitta.um_coverages_gl_pol_info; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON sagitta.um_coverages_gl_pol_info FOR EACH ROW EXECUTE FUNCTION audit.tr_sagitta_log_change(); 
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
		,'um_coverages_gl_pol_info' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.sagitem
						,x.lis
						,x.old_gl_pol_seq_number 			AS gl_pol_seq_number 
						,x.old_gl_pol_number 			AS gl_pol_number 
						,x.old_gl_claims_occur 			AS gl_claims_occur 
						,x.old_gl_insurer 			AS gl_insurer 
						,x.old_gl_insurer_name 			AS gl_insurer_name 
						,x.old_gl_effective_date 			AS gl_effective_date 
						,x.old_gl_exp_date 			AS gl_exp_date 
						,x.old_gl_rate_mode 			AS gl_rate_mode 
						,x.old_gl_each_occur_limit 			AS gl_each_occur_limit 
						,x.old_gl_gen_agg_amount 			AS gl_gen_agg_amount 
						,x.old_gl_prod_compl_oper_limit 			AS gl_prod_compl_oper_limit 
						,x.old_gl_fire_damage_limit 			AS gl_fire_damage_limit 
						,x.old_gl_med_exp_limit 			AS gl_med_exp_limit 
						,x.old_gl_pes_adv_inj_limit 			AS gl_pes_adv_inj_limit 
						,x.old_gl_prem_operations_ann_prem 			AS gl_prem_operations_ann_prem 
						,x.old_gl_products_ann_prem 			AS gl_products_ann_prem 
						,x.old_gl_other_ann_prem 			AS gl_other_ann_prem 
			) 	AS _ 
		) 			AS new_record 
FROM sagitta.audit_um_coverages_gl_pol_info 	AS x 
	INNER JOIN 	sagitta.um_coverages_gl_pol_info 	AS y 
		ON x.sagitem = y.sagitem
			 AND x.lis = y.lis; 
GO 

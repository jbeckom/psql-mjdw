/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE sagitta.br_coverages_additional_coverage_info 
	 DROP CONSTRAINT IF EXISTS br_coverages_additional_coverage_info_pkey 
	,ADD CONSTRAINT br_coverages_additional_coverage_info_sagitem_uq 	UNIQUE (sagitem)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON sagitta.br_coverages_additional_coverage_info; 
GO
DROP TRIGGER IF EXISTS audit_i ON sagitta.br_coverages_additional_coverage_info; 
GO
DROP TRIGGER IF EXISTS audit_u ON sagitta.br_coverages_additional_coverage_info; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON sagitta.br_coverages_additional_coverage_info; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON sagitta.br_coverages_additional_coverage_info FOR EACH ROW EXECUTE FUNCTION audit.tr_sagitta_log_change(); 
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
		,'br_coverages_additional_coverage_info' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.sagitem
						,x.lis
						,x.old_addl_cov_cd 			AS addl_cov_cd 
						,x.old_first_addl_cov_limit 			AS first_addl_cov_limit 
						,x.old_first_addl_cov_deductible_amt 			AS first_addl_cov_deductible_amt 
						,x.old_first_addl_cov_ded_desc 			AS first_addl_cov_ded_desc 
						,x.old_second_addl_cov_limit 			AS second_addl_cov_limit 
						,x.old_second_addl_cov_deductible_amt 			AS second_addl_cov_deductible_amt 
						,x.old_second_addl_cov_ded_desc 			AS second_addl_cov_ded_desc 
						,x.old_addl_cov_desc 			AS addl_cov_desc 
						,x.old_addl_cov_addl_info 			AS addl_cov_addl_info 
						,x.old_addl_cov_rate 			AS addl_cov_rate 
						,x.old_addl_cov_endorse_form 			AS addl_cov_endorse_form 
						,x.old_addl_cov_endorse_form_date 			AS addl_cov_endorse_form_date 
						,x.old_addl_cov_premium_amt 			AS addl_cov_premium_amt 
			) 	AS _ 
		) 			AS new_record 
FROM sagitta.audit_br_coverages_additional_coverage_info 	AS x 
	INNER JOIN 	sagitta.br_coverages_additional_coverage_info 	AS y 
		ON x.sagitem = y.sagitem
			 AND x.lis = y.lis; 
GO 

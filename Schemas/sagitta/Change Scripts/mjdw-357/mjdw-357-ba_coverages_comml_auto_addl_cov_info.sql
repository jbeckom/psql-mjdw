/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE sagitta.ba_coverages_comml_auto_addl_cov_info 
	 DROP CONSTRAINT IF EXISTS ba_coverages_comml_auto_addl_cov_info_pkey 
	,ADD CONSTRAINT ba_coverages_comml_auto_addl_cov_info_sagitem_uq 	UNIQUE (sagitem)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON sagitta.ba_coverages_comml_auto_addl_cov_info; 
GO
DROP TRIGGER IF EXISTS audit_i ON sagitta.ba_coverages_comml_auto_addl_cov_info; 
GO
DROP TRIGGER IF EXISTS audit_u ON sagitta.ba_coverages_comml_auto_addl_cov_info; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON sagitta.ba_coverages_comml_auto_addl_cov_info; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON sagitta.ba_coverages_comml_auto_addl_cov_info FOR EACH ROW EXECUTE FUNCTION audit.tr_sagitta_log_change(); 
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
		,'ba_coverages_comml_auto_addl_cov_info' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.sagitem
						,x.lis
						,x.old_comml_auto_addl_cov_coverage_cd 			AS comml_auto_addl_cov_coverage_cd 
						,x.old_comml_auto_addl_cov_addl_coverage_desc 			AS comml_auto_addl_cov_addl_coverage_desc 
						,x.old_comml_auto_addl_cov_form_number 			AS comml_auto_addl_cov_form_number 
						,x.old_comml_auto_addl_cov_edition_dt 			AS comml_auto_addl_cov_edition_dt 
						,x.old_comml_auto_addl_cov_state_prov_cd 			AS comml_auto_addl_cov_state_prov_cd 
						,x.old_comml_auto_addl_cov_limit_1 			AS comml_auto_addl_cov_limit_1 
						,x.old_comml_auto_addl_cov_limit_2 			AS comml_auto_addl_cov_limit_2 
						,x.old_comml_auto_addl_cov_deductible_amt_1 			AS comml_auto_addl_cov_deductible_amt_1 
						,x.old_comml_auto_addl_cov_deductible_amt_2 			AS comml_auto_addl_cov_deductible_amt_2 
						,x.old_comml_auto_addl_cov_deductible_typ 			AS comml_auto_addl_cov_deductible_typ 
						,x.old_comml_auto_addl_cov_credit_pct 			AS comml_auto_addl_cov_credit_pct 
						,x.old_comml_auto_addl_cov_addl_cov_rate_factor 			AS comml_auto_addl_cov_addl_cov_rate_factor 
						,x.old_comml_auto_addl_cov_addl_cov_coverage_premium_amt 			AS comml_auto_addl_cov_addl_cov_coverage_premium_amt 
						,x.old_comml_auto_addl_cov_veh_1 			AS comml_auto_addl_cov_veh_1 
						,x.old_comml_auto_addl_cov_veh_2 			AS comml_auto_addl_cov_veh_2 
						,x.old_comml_auto_addl_cov_veh_3 			AS comml_auto_addl_cov_veh_3 
						,x.old_comml_auto_addl_cov_veh_4 			AS comml_auto_addl_cov_veh_4 
						,x.old_comml_auto_addl_cov_veh_5 			AS comml_auto_addl_cov_veh_5 
						,x.old_comml_auto_addl_cov_veh_6 			AS comml_auto_addl_cov_veh_6 
						,x.old_comml_auto_addl_cov_veh_7 			AS comml_auto_addl_cov_veh_7 
						,x.old_comml_auto_addl_cov_buyback_yes_no_cd 			AS comml_auto_addl_cov_buyback_yes_no_cd 
						,x.old_comml_auto_addl_cov_misc_options_1 			AS comml_auto_addl_cov_misc_options_1 
						,x.old_comml_auto_addl_cov_misc_options_2 			AS comml_auto_addl_cov_misc_options_2 
						,x.old_comml_auto_addl_cov_options_1 			AS comml_auto_addl_cov_options_1 
						,x.old_comml_auto_addl_cov_options_2 			AS comml_auto_addl_cov_options_2 
						,x.old_comml_auto_addl_cov_options_3 			AS comml_auto_addl_cov_options_3 
						,x.old_comml_auto_addl_cov_options_4 			AS comml_auto_addl_cov_options_4 
						,x.old_comml_auto_addl_cov_benefits_1 			AS comml_auto_addl_cov_benefits_1 
						,x.old_comml_auto_addl_cov_benefits_2 			AS comml_auto_addl_cov_benefits_2 
						,x.old_comml_auto_addl_cov_benefits_3 			AS comml_auto_addl_cov_benefits_3 
						,x.old_comml_auto_addl_cov_class_cd 			AS comml_auto_addl_cov_class_cd 
						,x.old_comml_auto_addl_cov_hired_non_owned_doc 			AS comml_auto_addl_cov_hired_non_owned_doc 
						,x.old_comml_auto_addl_cov_misc_factor 			AS comml_auto_addl_cov_misc_factor 
			) 	AS _ 
		) 			AS new_record 
FROM sagitta.audit_ba_coverages_comml_auto_addl_cov_info 	AS x 
	INNER JOIN 	sagitta.ba_coverages_comml_auto_addl_cov_info 	AS y 
		ON x.sagitem = y.sagitem
			 AND x.lis = y.lis; 
GO 

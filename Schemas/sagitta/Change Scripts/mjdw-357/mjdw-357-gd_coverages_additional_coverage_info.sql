/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE sagitta.gd_coverages_additional_coverage_info 
	 DROP CONSTRAINT IF EXISTS gd_coverages_additional_coverage_info_pkey 
	,ADD CONSTRAINT gd_coverages_additional_coverage_info_sagitem_uq 	UNIQUE (sagitem)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON sagitta.gd_coverages_additional_coverage_info; 
GO
DROP TRIGGER IF EXISTS audit_i ON sagitta.gd_coverages_additional_coverage_info; 
GO
DROP TRIGGER IF EXISTS audit_u ON sagitta.gd_coverages_additional_coverage_info; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON sagitta.gd_coverages_additional_coverage_info; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON sagitta.gd_coverages_additional_coverage_info FOR EACH ROW EXECUTE FUNCTION audit.tr_sagitta_log_change(); 
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
		,'gd_coverages_additional_coverage_info' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.sagitem
						,x.lis
						,x.old_addl_coverage_cd 			AS addl_coverage_cd 
						,x.old_additional_state_coverage_info 			AS additional_state_coverage_info 
						,x.old_state_prov_cd 			AS state_prov_cd 
						,x.old_buyback_yes_no_cd 			AS buyback_yes_no_cd 
						,x.old_addl_cov_form_num 			AS addl_cov_form_num 
						,x.old_addl_edition_dt 			AS addl_edition_dt 
						,x.old_addl_coverage_1_limit 			AS addl_coverage_1_limit 
						,x.old_addl_coverage_2_limit 			AS addl_coverage_2_limit 
						,x.old_addl_deductible_1_amt 			AS addl_deductible_1_amt 
						,x.old_addl_deductible_2_amt 			AS addl_deductible_2_amt 
						,x.old_addl_deductible_factor 			AS addl_deductible_factor 
						,x.old_addl_cov_deductible_type 			AS addl_cov_deductible_type 
						,x.old_addl_cov_deductible_credit_pct 			AS addl_cov_deductible_credit_pct 
						,x.old_additional_coverage_info 			AS additional_coverage_info 
						,x.old_addl_cov_1_vehicle_num 			AS addl_cov_1_vehicle_num 
						,x.old_addl_cov_2_vehicle_num 			AS addl_cov_2_vehicle_num 
						,x.old_addl_cov_3_vehicle_num 			AS addl_cov_3_vehicle_num 
						,x.old_addl_cov_4_vehicle_num 			AS addl_cov_4_vehicle_num 
						,x.old_addl_cov_5_vehicle_num 			AS addl_cov_5_vehicle_num 
						,x.old_addl_cov_6_vehicle_num 			AS addl_cov_6_vehicle_num 
						,x.old_addl_cov_7_vehicle_num 			AS addl_cov_7_vehicle_num 
						,x.old_miscellaneous_options_info 			AS miscellaneous_options_info 
						,x.old_miscellaneous_options_1_cd 			AS miscellaneous_options_1_cd 
						,x.old_miscellaneous_options_2_cd 			AS miscellaneous_options_2_cd 
						,x.old_addlcov_option_info 			AS addlcov_option_info 
						,x.old_addl_cov_option_1_cd 			AS addl_cov_option_1_cd 
						,x.old_addl_cov_option_2_cd 			AS addl_cov_option_2_cd 
						,x.old_addl_cov_option_3_cd 			AS addl_cov_option_3_cd 
						,x.old_addl_cov_option_4_cd 			AS addl_cov_option_4_cd 
						,x.old_addl_cov_benefits_info 			AS addl_cov_benefits_info 
						,x.old_addl_cov_benefits_1_cd 			AS addl_cov_benefits_1_cd 
						,x.old_addl_cov_benefits_2_cd 			AS addl_cov_benefits_2_cd 
						,x.old_addl_cov_benefits_3_cd 			AS addl_cov_benefits_3_cd 
						,x.old_addl_cov_rate_factor 			AS addl_cov_rate_factor 
						,x.old_addl_cov_premium_amt 			AS addl_cov_premium_amt 
						,x.old_addl_coverage_cd_desc 			AS addl_coverage_cd_desc 
			) 	AS _ 
		) 			AS new_record 
FROM sagitta.audit_gd_coverages_additional_coverage_info 	AS x 
	INNER JOIN 	sagitta.gd_coverages_additional_coverage_info 	AS y 
		ON x.sagitem = y.sagitem
			 AND x.lis = y.lis; 
GO 

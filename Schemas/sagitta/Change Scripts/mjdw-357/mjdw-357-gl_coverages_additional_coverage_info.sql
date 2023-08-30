/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE sagitta.gl_coverages_additional_coverage_info 
	 DROP CONSTRAINT IF EXISTS gl_coverages_additional_coverage_info_pkey 
	,ADD CONSTRAINT gl_coverages_additional_coverage_info_sagitem_uq 	UNIQUE (sagitem)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON sagitta.gl_coverages_additional_coverage_info; 
GO
DROP TRIGGER IF EXISTS audit_i ON sagitta.gl_coverages_additional_coverage_info; 
GO
DROP TRIGGER IF EXISTS audit_u ON sagitta.gl_coverages_additional_coverage_info; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON sagitta.gl_coverages_additional_coverage_info; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON sagitta.gl_coverages_additional_coverage_info FOR EACH ROW EXECUTE FUNCTION audit.tr_sagitta_log_change(); 
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
		,'gl_coverages_additional_coverage_info' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.sagitem
						,x.lis
						,x.old_gl_coverage_cd 			AS gl_coverage_cd 
						,x.old_hazard_number 			AS hazard_number 
						,x.old_form_number 			AS form_number 
						,x.old_edition_dt 			AS edition_dt 
						,x.old_cov_1_limit 			AS cov_1_limit 
						,x.old_cov_2_limit 			AS cov_2_limit 
						,x.old_deductible 			AS deductible 
						,x.old_cov_1_type_deductible 			AS cov_1_type_deductible 
						,x.old_cov_1_basis_1_deductible 			AS cov_1_basis_1_deductible 
						,x.old_cov_1_basis_2_deductible 			AS cov_1_basis_2_deductible 
						,x.old_cov_rate 			AS cov_rate 
						,x.old_premium_amt 			AS premium_amt 
						,x.old_job_number 			AS job_number 
						,x.old_num_one 			AS num_one 
						,x.old_num_two 			AS num_two 
						,x.old_type_dt 			AS type_dt 
						,x.old_dt 			AS dt 
						,x.old_coverage_desc 			AS coverage_desc 
						,x.old_coverage_2_deductible 			AS coverage_2_deductible 
						,x.old_coverage_2_ded_type 			AS coverage_2_ded_type 
						,x.old_cov_2_basis_1_deductible 			AS cov_2_basis_1_deductible 
						,x.old_cov_basis_2_deductible 			AS cov_basis_2_deductible 
						,x.old_location_agency_id 			AS location_agency_id 
						,x.old_state_prov_cd 			AS state_prov_cd 
						,x.old_line_1_remark_text 			AS line_1_remark_text 
						,x.old_line_2_remark_text 			AS line_2_remark_text 
						,x.old_building_num 			AS building_num 
			) 	AS _ 
		) 			AS new_record 
FROM sagitta.audit_gl_coverages_additional_coverage_info 	AS x 
	INNER JOIN 	sagitta.gl_coverages_additional_coverage_info 	AS y 
		ON x.sagitem = y.sagitem
			 AND x.lis = y.lis; 
GO 

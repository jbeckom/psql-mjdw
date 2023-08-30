/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE sagitta.ol_coverages_coverage_info 
	 DROP CONSTRAINT IF EXISTS ol_coverages_coverage_info_pkey 
	,ADD CONSTRAINT ol_coverages_coverage_info_sagitem_uq 	UNIQUE (sagitem)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON sagitta.ol_coverages_coverage_info; 
GO
DROP TRIGGER IF EXISTS audit_i ON sagitta.ol_coverages_coverage_info; 
GO
DROP TRIGGER IF EXISTS audit_u ON sagitta.ol_coverages_coverage_info; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON sagitta.ol_coverages_coverage_info; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON sagitta.ol_coverages_coverage_info FOR EACH ROW EXECUTE FUNCTION audit.tr_sagitta_log_change(); 
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
		,'ol_coverages_coverage_info' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.sagitem
						,x.lis
						,x.old_coverage_cd 			AS coverage_cd 
						,x.old_state_prov_cd 			AS state_prov_cd 
						,x.old_location_number 			AS location_number 
						,x.old_building_number 			AS building_number 
						,x.old_form_number 			AS form_number 
						,x.old_addl_cov_edition_dt 			AS addl_cov_edition_dt 
						,x.old_rate 			AS rate 
						,x.old_co_insurance 			AS co_insurance 
						,x.old_premium_amt 			AS premium_amt 
						,x.old_limit_1 			AS limit_1 
						,x.old_limit_1_desc_code 			AS limit_1_desc_code 
						,x.old_deductible_1 			AS deductible_1 
						,x.old_ded_symbol_1 			AS ded_symbol_1 
						,x.old_deductible_basis_cd_1 			AS deductible_basis_cd_1 
						,x.old_deductible_type_cd_1 			AS deductible_type_cd_1 
						,x.old_limit_2 			AS limit_2 
						,x.old_limit_2_desc_code 			AS limit_2_desc_code 
						,x.old_deductible_2 			AS deductible_2 
						,x.old_ded_symbol_2 			AS ded_symbol_2 
						,x.old_deductible_basis_cd_2 			AS deductible_basis_cd_2 
						,x.old_deductible_type_cd_2 			AS deductible_type_cd_2 
						,x.old_exposure_1 			AS exposure_1 
						,x.old_territory 			AS territory 
						,x.old_coverage_desc 			AS coverage_desc 
						,x.old_addl_info_ind 			AS addl_info_ind 
						,x.old_vehicle_no 			AS vehicle_no 
						,x.old_rating_basis 			AS rating_basis 
						,x.old_valuation_code_1 			AS valuation_code_1 
						,x.old_valuation_code_2 			AS valuation_code_2 
						,x.old_cause_of_loss 			AS cause_of_loss 
						,x.old_cov_effective_date 			AS cov_effective_date 
						,x.old_cov_expiration_date 			AS cov_expiration_date 
						,x.old_exposure_1basis 			AS exposure_1basis 
						,x.old_exposure_2 			AS exposure_2 
						,x.old_exposure_2basis 			AS exposure_2basis 
						,x.old_cov_type_code 			AS cov_type_code 
			) 	AS _ 
		) 			AS new_record 
FROM sagitta.audit_ol_coverages_coverage_info 	AS x 
	INNER JOIN 	sagitta.ol_coverages_coverage_info 	AS y 
		ON x.sagitem = y.sagitem
			 AND x.lis = y.lis; 
GO 

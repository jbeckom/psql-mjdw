/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE sagitta.eq_coverages_addl_cov_cd_info 
	 DROP CONSTRAINT IF EXISTS eq_coverages_addl_cov_cd_info_pkey 
	,ADD CONSTRAINT eq_coverages_addl_cov_cd_info_sagitem_uq 	UNIQUE (sagitem)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON sagitta.eq_coverages_addl_cov_cd_info; 
GO
DROP TRIGGER IF EXISTS audit_i ON sagitta.eq_coverages_addl_cov_cd_info; 
GO
DROP TRIGGER IF EXISTS audit_u ON sagitta.eq_coverages_addl_cov_cd_info; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON sagitta.eq_coverages_addl_cov_cd_info; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON sagitta.eq_coverages_addl_cov_cd_info FOR EACH ROW EXECUTE FUNCTION audit.tr_sagitta_log_change(); 
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
		,'eq_coverages_addl_cov_cd_info' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.sagitem
						,x.lis
						,x.old_addl_cov_cd 			AS addl_cov_cd 
						,x.old_addl_cov_item_number 			AS addl_cov_item_number 
						,x.old_addl_cov_limit 			AS addl_cov_limit 
						,x.old_addl_cov_ded_amt 			AS addl_cov_ded_amt 
						,x.old_addl_cov_ded_pct 			AS addl_cov_ded_pct 
						,x.old_addl_cov_rate 			AS addl_cov_rate 
						,x.old_addl_cov_endt_form_number 			AS addl_cov_endt_form_number 
						,x.old_addl_cov_edition_dt 			AS addl_cov_edition_dt 
						,x.old_addl_cov_premium 			AS addl_cov_premium 
						,x.old_addl_cov_des 			AS addl_cov_des 
						,x.old_addl_cov_estimated_ann_rental_expense 			AS addl_cov_estimated_ann_rental_expense 
						,x.old_item_limit_basis 			AS item_limit_basis 
						,x.old_item_limit_valuation_type 			AS item_limit_valuation_type 
						,x.old_item_deductible_type 			AS item_deductible_type 
						,x.old_item_deductible_basis 			AS item_deductible_basis 
			) 	AS _ 
		) 			AS new_record 
FROM sagitta.audit_eq_coverages_addl_cov_cd_info 	AS x 
	INNER JOIN 	sagitta.eq_coverages_addl_cov_cd_info 	AS y 
		ON x.sagitem = y.sagitem
			 AND x.lis = y.lis; 
GO 

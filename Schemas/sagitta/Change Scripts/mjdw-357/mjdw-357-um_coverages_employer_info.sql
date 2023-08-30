/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE sagitta.um_coverages_employer_info 
	 DROP CONSTRAINT IF EXISTS um_coverages_employer_info_pkey 
	,ADD CONSTRAINT um_coverages_employer_info_sagitem_uq 	UNIQUE (sagitem)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON sagitta.um_coverages_employer_info; 
GO
DROP TRIGGER IF EXISTS audit_i ON sagitta.um_coverages_employer_info; 
GO
DROP TRIGGER IF EXISTS audit_u ON sagitta.um_coverages_employer_info; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON sagitta.um_coverages_employer_info; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON sagitta.um_coverages_employer_info FOR EACH ROW EXECUTE FUNCTION audit.tr_sagitta_log_change(); 
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
		,'um_coverages_employer_info' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.sagitem
						,x.lis
						,x.old_empl_pol_seq_number 			AS empl_pol_seq_number 
						,x.old_empl_pol_number 			AS empl_pol_number 
						,x.old_employers_insurer 			AS employers_insurer 
						,x.old_employers_insurer_name 			AS employers_insurer_name 
						,x.old_employers_effective_date 			AS employers_effective_date 
						,x.old_employers_exp_date 			AS employers_exp_date 
						,x.old_employers_ann_prem 			AS employers_ann_prem 
						,x.old_employers_each_occ_limit 			AS employers_each_occ_limit 
						,x.old_employers_disease_each_employee 			AS employers_disease_each_employee 
						,x.old_employers_disease_policy_limit 			AS employers_disease_policy_limit 
						,x.old_employers_first_rat_mod_info 			AS employers_first_rat_mod_info 
						,x.old_employers_first_rate_mod_type 			AS employers_first_rate_mod_type 
						,x.old_employers_first_rate_mod_amount 			AS employers_first_rate_mod_amount 
						,x.old_employers_second_rate_mod_info 			AS employers_second_rate_mod_info 
						,x.old_employers_second_rate_mod_type 			AS employers_second_rate_mod_type 
						,x.old_employers_second_rate_mod_amount 			AS employers_second_rate_mod_amount 
						,x.old_employers_third_rate_mod_info 			AS employers_third_rate_mod_info 
						,x.old_employers_third_rate_mod_type 			AS employers_third_rate_mod_type 
						,x.old_employers_third_rate_mod_amount 			AS employers_third_rate_mod_amount 
						,x.old_employers_fourth_rate_mod_info 			AS employers_fourth_rate_mod_info 
						,x.old_employers_fourth_rate_mod_type 			AS employers_fourth_rate_mod_type 
						,x.old_employers_fourth_rate_mod_amount 			AS employers_fourth_rate_mod_amount 
			) 	AS _ 
		) 			AS new_record 
FROM sagitta.audit_um_coverages_employer_info 	AS x 
	INNER JOIN 	sagitta.um_coverages_employer_info 	AS y 
		ON x.sagitem = y.sagitem
			 AND x.lis = y.lis; 
GO 

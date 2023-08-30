/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE sagitta.um_coverages 
	 DROP CONSTRAINT IF EXISTS um_coverages_pkey 
	,ADD CONSTRAINT um_coverages_sagitem_uq 	UNIQUE (sagitem)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON sagitta.um_coverages; 
GO
DROP TRIGGER IF EXISTS audit_i ON sagitta.um_coverages; 
GO
DROP TRIGGER IF EXISTS audit_u ON sagitta.um_coverages; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON sagitta.um_coverages; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON sagitta.um_coverages FOR EACH ROW EXECUTE FUNCTION audit.tr_sagitta_log_change(); 
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
		,'um_coverages' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.sagitem
						,x.old_audit_staff_cd 			AS audit_staff_cd 
						,x.old_audit_entry_dt 			AS audit_entry_dt 
						,x.old_audit_time 			AS audit_time 
						,x.old_audit_cd 			AS audit_cd 
						,x.old_audit_history_record_number 			AS audit_history_record_number 
						,x.old_audit_program 			AS audit_program 
						,x.old_audit_effective_dt 			AS audit_effective_dt 
						,x.old_audit_change_agency_id 			AS audit_change_agency_id 
						,x.old_policy_agency_id 			AS policy_agency_id 
						,x.old_follow_umb_form 			AS follow_umb_form 
						,x.old_follow_form_excess 			AS follow_form_excess 
						,x.old_umbrella_excess 			AS umbrella_excess 
						,x.old_liab_each_occur_limit 			AS liab_each_occur_limit 
						,x.old_liab_annual_aggregate 			AS liab_annual_aggregate 
						,x.old_retained_limit 			AS retained_limit 
						,x.old_first_dollar_defense 			AS first_dollar_defense 
						,x.old_current_retro_date 			AS current_retro_date 
						,x.old_off_dt 			AS off_dt 
						,x.old_desc_of_underlying_cov 			AS desc_of_underlying_cov 
						,x.old_garagekeepers_coverage 			AS garagekeepers_coverage 
						,x.old_garagekeepers_exposure 			AS garagekeepers_exposure 
						,x.old_aircraft_pass_coverage 			AS aircraft_pass_coverage 
						,x.old_aircraft_pass_exposure 			AS aircraft_pass_exposure 
						,x.old_care_custody_coverage 			AS care_custody_coverage 
						,x.old_care_custody_exposure 			AS care_custody_exposure 
						,x.old_professional_coverage 			AS professional_coverage 
						,x.old_professional_exposure 			AS professional_exposure 
						,x.old_foreign_liab_coverage 			AS foreign_liab_coverage 
						,x.old_foreign_liab_exposure 			AS foreign_liab_exposure 
						,x.old_malpractice_coverage 			AS malpractice_coverage 
						,x.old_malpractive_exposure 			AS malpractive_exposure 
						,x.old_aircraft_liab_coverage 			AS aircraft_liab_coverage 
						,x.old_aircraft_liab_exposure 			AS aircraft_liab_exposure 
						,x.old_add_int_coverage 			AS add_int_coverage 
						,x.old_add_int_exposure 			AS add_int_exposure 
						,x.old_emp_benefit_coverage 			AS emp_benefit_coverage 
						,x.old_emp_benefit_exposure 			AS emp_benefit_exposure 
						,x.old_liquor_coverage 			AS liquor_coverage 
						,x.old_liquor_exposure 			AS liquor_exposure 
						,x.old_pollution_coverage 			AS pollution_coverage 
						,x.old_pollution_exposure 			AS pollution_exposure 
						,x.old_vendors_liab_coverage 			AS vendors_liab_coverage 
						,x.old_vendors_liab_exposure 			AS vendors_liab_exposure 
						,x.old_watercraft_coverage 			AS watercraft_coverage 
						,x.old_watercraft_exposure 			AS watercraft_exposure 
						,x.old_first_other_description 			AS first_other_description 
						,x.old_first_other_coverage 			AS first_other_coverage 
						,x.old_first_other_exposure 			AS first_other_exposure 
						,x.old_second_other_description 			AS second_other_description 
						,x.old_second_other_coverage 			AS second_other_coverage 
						,x.old_second_other_exposure 			AS second_other_exposure 
						,x.old_third_other_description 			AS third_other_description 
						,x.old_third_other_coverage 			AS third_other_coverage 
						,x.old_third_other_exposure 			AS third_other_exposure 
						,x.old_fourth_other_description 			AS fourth_other_description 
						,x.old_fourth_other_coverage 			AS fourth_other_coverage 
						,x.old_fourth_other_exposure 			AS fourth_other_exposure 
						,x.old_retro_coverage_yes_no_cd 			AS retro_coverage_yes_no_cd 
						,x.old_retro_proposed_date 			AS retro_proposed_date 
			) 	AS _ 
		) 			AS new_record 
FROM sagitta.audit_um_coverages 	AS x 
	INNER JOIN 	sagitta.um_coverages 	AS y 
		ON x.sagitem = y.sagitem; 
GO 

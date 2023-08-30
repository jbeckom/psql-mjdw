/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE sagitta.gd_coverages_hired_borrowed_coverage_info 
	 DROP CONSTRAINT IF EXISTS gd_coverages_hired_borrowed_coverage_info_pkey 
	,ADD CONSTRAINT gd_coverages_hired_borrowed_coverage_info_sagitem_uq 	UNIQUE (sagitem)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON sagitta.gd_coverages_hired_borrowed_coverage_info; 
GO
DROP TRIGGER IF EXISTS audit_i ON sagitta.gd_coverages_hired_borrowed_coverage_info; 
GO
DROP TRIGGER IF EXISTS audit_u ON sagitta.gd_coverages_hired_borrowed_coverage_info; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON sagitta.gd_coverages_hired_borrowed_coverage_info; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON sagitta.gd_coverages_hired_borrowed_coverage_info FOR EACH ROW EXECUTE FUNCTION audit.tr_sagitta_log_change(); 
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
		,'gd_coverages_hired_borrowed_coverage_info' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.sagitem
						,x.lis
						,x.old_hired_liability_class_cd 			AS hired_liability_class_cd 
						,x.old_hired_liability_location_number 			AS hired_liability_location_number 
						,x.old_hired_liability_state_prov_cd 			AS hired_liability_state_prov_cd 
						,x.old_hired_liability_cost_amt 			AS hired_liability_cost_amt 
						,x.old_hired_liability_rate 			AS hired_liability_rate 
						,x.old_hired_physical_damage_rate 			AS hired_physical_damage_rate 
						,x.old_if_any_rating_basis_ind 			AS if_any_rating_basis_ind 
						,x.old_num_days 			AS num_days 
						,x.old_num_vehs 			AS num_vehs 
						,x.old_hired_comprehensive_deductible_amt 			AS hired_comprehensive_deductible_amt 
						,x.old_hired_specified_perils_deductible_amt 			AS hired_specified_perils_deductible_amt 
						,x.old_hired_collision_deductible_amt 			AS hired_collision_deductible_amt 
			) 	AS _ 
		) 			AS new_record 
FROM sagitta.audit_gd_coverages_hired_borrowed_coverage_info 	AS x 
	INNER JOIN 	sagitta.gd_coverages_hired_borrowed_coverage_info 	AS y 
		ON x.sagitem = y.sagitem
			 AND x.lis = y.lis; 
GO 

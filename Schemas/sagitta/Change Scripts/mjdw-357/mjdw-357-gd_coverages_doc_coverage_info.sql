/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE sagitta.gd_coverages_doc_coverage_info 
	 DROP CONSTRAINT IF EXISTS gd_coverages_doc_coverage_info_pkey 
	,ADD CONSTRAINT gd_coverages_doc_coverage_info_sagitem_uq 	UNIQUE (sagitem)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON sagitta.gd_coverages_doc_coverage_info; 
GO
DROP TRIGGER IF EXISTS audit_i ON sagitta.gd_coverages_doc_coverage_info; 
GO
DROP TRIGGER IF EXISTS audit_u ON sagitta.gd_coverages_doc_coverage_info; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON sagitta.gd_coverages_doc_coverage_info; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON sagitta.gd_coverages_doc_coverage_info FOR EACH ROW EXECUTE FUNCTION audit.tr_sagitta_log_change(); 
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
		,'gd_coverages_doc_coverage_info' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.sagitem
						,x.lis
						,x.old_doc_class_cd 			AS doc_class_cd 
						,x.old_doc_location_number 			AS doc_location_number 
						,x.old_state_prov_cd 			AS state_prov_cd 
						,x.old_rating_territory_desc 			AS rating_territory_desc 
						,x.old_num_employees 			AS num_employees 
						,x.old_num_individuals_covered 			AS num_individuals_covered 
						,x.old_fin_resp_doc_cert_yes_no_cd 			AS fin_resp_doc_cert_yes_no_cd 
						,x.old_doc_driver_info 			AS doc_driver_info 
						,x.old_driver_1_number 			AS driver_1_number 
						,x.old_driver_2_number 			AS driver_2_number 
						,x.old_driver_3_number 			AS driver_3_number 
						,x.old_driver_4_number 			AS driver_4_number 
						,x.old_driver_5_number 			AS driver_5_number 
						,x.old_driver_6_number 			AS driver_6_number 
						,x.old_driver_7_number 			AS driver_7_number 
						,x.old_driver_8_number 			AS driver_8_number 
						,x.old_driver_9_number 			AS driver_9_number 
			) 	AS _ 
		) 			AS new_record 
FROM sagitta.audit_gd_coverages_doc_coverage_info 	AS x 
	INNER JOIN 	sagitta.gd_coverages_doc_coverage_info 	AS y 
		ON x.sagitem = y.sagitem
			 AND x.lis = y.lis; 
GO 

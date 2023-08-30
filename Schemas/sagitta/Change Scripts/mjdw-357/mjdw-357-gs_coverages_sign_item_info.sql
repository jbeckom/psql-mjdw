/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE sagitta.gs_coverages_sign_item_info 
	 DROP CONSTRAINT IF EXISTS gs_coverages_sign_item_info_pkey 
	,ADD CONSTRAINT gs_coverages_sign_item_info_sagitem_uq 	UNIQUE (sagitem)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON sagitta.gs_coverages_sign_item_info; 
GO
DROP TRIGGER IF EXISTS audit_i ON sagitta.gs_coverages_sign_item_info; 
GO
DROP TRIGGER IF EXISTS audit_u ON sagitta.gs_coverages_sign_item_info; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON sagitta.gs_coverages_sign_item_info; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON sagitta.gs_coverages_sign_item_info FOR EACH ROW EXECUTE FUNCTION audit.tr_sagitta_log_change(); 
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
		,'gs_coverages_sign_item_info' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.sagitem
						,x.lis
						,x.old_sign_item_number 			AS sign_item_number 
						,x.old_sign_location_agency_id 			AS sign_location_agency_id 
						,x.old_sign_sub_location 			AS sign_sub_location 
						,x.old_inside_outside_sign_cd 			AS inside_outside_sign_cd 
						,x.old_sign_limit_amt 			AS sign_limit_amt 
						,x.old_sign_deductible 			AS sign_deductible 
						,x.old_sign_descriptions 			AS sign_descriptions 
						,x.old_sign_1_desc_remark_text 			AS sign_1_desc_remark_text 
						,x.old_sign_2_desc_remark_text 			AS sign_2_desc_remark_text 
			) 	AS _ 
		) 			AS new_record 
FROM sagitta.audit_gs_coverages_sign_item_info 	AS x 
	INNER JOIN 	sagitta.gs_coverages_sign_item_info 	AS y 
		ON x.sagitem = y.sagitem
			 AND x.lis = y.lis; 
GO 

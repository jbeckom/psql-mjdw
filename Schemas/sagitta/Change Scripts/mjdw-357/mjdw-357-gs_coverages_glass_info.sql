/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE sagitta.gs_coverages_glass_info 
	 DROP CONSTRAINT IF EXISTS gs_coverages_glass_info_pkey 
	,ADD CONSTRAINT gs_coverages_glass_info_sagitem_uq 	UNIQUE (sagitem)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON sagitta.gs_coverages_glass_info; 
GO
DROP TRIGGER IF EXISTS audit_i ON sagitta.gs_coverages_glass_info; 
GO
DROP TRIGGER IF EXISTS audit_u ON sagitta.gs_coverages_glass_info; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON sagitta.gs_coverages_glass_info; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON sagitta.gs_coverages_glass_info FOR EACH ROW EXECUTE FUNCTION audit.tr_sagitta_log_change(); 
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
		,'gs_coverages_glass_info' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.sagitem
						,x.lis
						,x.old_glass_item_number 			AS glass_item_number 
						,x.old_glass_location_agency_id 			AS glass_location_agency_id 
						,x.old_glass_sub_location 			AS glass_sub_location 
						,x.old_glass_type_cd 			AS glass_type_cd 
						,x.old_num_plates 			AS num_plates 
						,x.old_glass_length_num_units 			AS glass_length_num_units 
						,x.old_glass_width_num_units 			AS glass_width_num_units 
						,x.old_glass_area_num_units 			AS glass_area_num_units 
						,x.old_use_and_position_in_bldg_desc 			AS use_and_position_in_bldg_desc 
						,x.old_item_desc 			AS item_desc 
						,x.old_glass_limit_amt 			AS glass_limit_amt 
						,x.old_safety_glass_ind 			AS safety_glass_ind 
						,x.old_glass_position_and_use_in_bldg_cd 			AS glass_position_and_use_in_bldg_cd 
						,x.old_glass_linear_length_num_units 			AS glass_linear_length_num_units 
						,x.old_glass_tenants_exterior_ind 			AS glass_tenants_exterior_ind 
						,x.old_remark_text 			AS remark_text 
						,x.old_glass_bldg_interior_ind 			AS glass_bldg_interior_ind 
						,x.old_glass_bldg_interior_remark_text 			AS glass_bldg_interior_remark_text 
						,x.old_num_large_replacement_plates 			AS num_large_replacement_plates 
			) 	AS _ 
		) 			AS new_record 
FROM sagitta.audit_gs_coverages_glass_info 	AS x 
	INNER JOIN 	sagitta.gs_coverages_glass_info 	AS y 
		ON x.sagitem = y.sagitem
			 AND x.lis = y.lis; 
GO 

CREATE OR REPLACE VIEW config.vw_bp_file_imports
AS 
SELECT 	 entity
		,file
		,file_cols
		,target
		,target_cols
		,merge_col
FROM 	config.benefitpoint_file_import 
WHERE 	active = TRUE 
ORDER BY proc_ord;

ALTER VIEW config.vw_bp_file_imports OWNER TO postgres_dev;
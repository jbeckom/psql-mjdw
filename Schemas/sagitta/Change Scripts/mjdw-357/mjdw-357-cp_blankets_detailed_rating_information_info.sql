/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE sagitta.cp_blankets_detailed_rating_information_info 
	 DROP CONSTRAINT IF EXISTS cp_blankets_detailed_rating_information_info_pkey 
	,ADD CONSTRAINT cp_blankets_detailed_rating_information_info_sagitem_uq 	UNIQUE (sagitem)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON sagitta.cp_blankets_detailed_rating_information_info; 
GO
DROP TRIGGER IF EXISTS audit_i ON sagitta.cp_blankets_detailed_rating_information_info; 
GO
DROP TRIGGER IF EXISTS audit_u ON sagitta.cp_blankets_detailed_rating_information_info; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON sagitta.cp_blankets_detailed_rating_information_info; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON sagitta.cp_blankets_detailed_rating_information_info FOR EACH ROW EXECUTE FUNCTION audit.tr_sagitta_log_change(); 
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
		,'cp_blankets_detailed_rating_information_info' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.sagitem
						,x.lis
						,x.old_detailed_cause 			AS detailed_cause 
						,x.old_coinsurance_pct 			AS coinsurance_pct 
						,x.old_detailed_rate 			AS detailed_rate 
						,x.old_detailed_ded_symbol 			AS detailed_ded_symbol 
						,x.old_detailed_ded_amt 			AS detailed_ded_amt 
						,x.old_detailed_premium 			AS detailed_premium 
			) 	AS _ 
		) 			AS new_record 
FROM sagitta.audit_cp_blankets_detailed_rating_information_info 	AS x 
	INNER JOIN 	sagitta.cp_blankets_detailed_rating_information_info 	AS y 
		ON x.sagitem = y.sagitem
			 AND x.lis = y.lis; 
GO 

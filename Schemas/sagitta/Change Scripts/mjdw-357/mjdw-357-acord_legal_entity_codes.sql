/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE sagitta.acord_legal_entity_codes 
	 DROP CONSTRAINT IF EXISTS acord_legal_entity_codes_pkey 
	,ADD CONSTRAINT acord_legal_entity_codes_sagitem_uq 	UNIQUE (sagitem)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON sagitta.acord_legal_entity_codes; 
GO
DROP TRIGGER IF EXISTS audit_i ON sagitta.acord_legal_entity_codes; 
GO
DROP TRIGGER IF EXISTS audit_u ON sagitta.acord_legal_entity_codes; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON sagitta.acord_legal_entity_codes; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON sagitta.acord_legal_entity_codes FOR EACH ROW EXECUTE FUNCTION audit.tr_sagitta_log_change(); 
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
		,'acord_legal_entity_codes' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.sagitem
						,x.old_uc 			AS uc 
						,x.old_description 			AS description 
						,x.old_date_off 			AS date_off 
						,x.old_date_off_remarks 			AS date_off_remarks 
			) 	AS _ 
		) 			AS new_record 
FROM sagitta.audit_acord_legal_entity_codes 	AS x 
	INNER JOIN 	sagitta.acord_legal_entity_codes 	AS y 
		ON x.sagitem = y.sagitem; 
GO 

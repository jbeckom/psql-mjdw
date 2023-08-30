/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE benefitpoint.posting_record 
	 DROP CONSTRAINT IF EXISTS posting_record_pkey 
	,ADD CONSTRAINT posting_record_posting_record_id_uq 	UNIQUE (posting_record_id)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON benefitpoint.posting_record; 
GO
DROP TRIGGER IF EXISTS audit_i ON benefitpoint.posting_record; 
GO
DROP TRIGGER IF EXISTS audit_u ON benefitpoint.posting_record; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON benefitpoint.posting_record; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON benefitpoint.posting_record FOR EACH ROW EXECUTE FUNCTION audit.tr_benefitpoint_log_change(); 
GO
 
/*** MOVE AUDIT DATA FROM LEGACY TABLE(S) TO NEW AUDIT SCHEMA ***/
INSERT INTO audit.benefitpoint_log (audit_time, audit_user, audit_client, operation, table_name, table_key, new_record) 
SELECT 	 x.audit_timestamp 			AS audit_time 
		,x.audit_user 			AS audit_user 
		,'0.0.0.0'::inet 			AS audit_client 
		,CASE 
			WHEN x.audit_action = 'D' THEN 'DELETE' 
			WHEN x.audit_action = 'I' THEN 'INSERT' 
			WHEN x.audit_action = 'U' THEN 'UPDATE' 
		END 			AS operation 
		,'posting_record' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.posting_record_id
						,x.old_statement_id 			AS statement_id 
						,x.old_effective_as_of 			AS effective_as_of 
						,x.old_posted_on 			AS posted_on 
						,x.old_posted_amount 			AS posted_amount 
						,x.old_voided_record 			AS voided_record 
						,x.old_voided_posting_record_id 			AS voided_posting_record_id 
						,x.old_split_column_type 			AS split_column_type 
						,x.old_split_basis_type 			AS split_basis_type 
						,x.old_accept_tolerance 			AS accept_tolerance 
						,x.old_statement_split 			AS statement_split 
			) 	AS _ 
		) 			AS new_record 
FROM benefitpoint.audit_posting_record 	AS x 
	INNER JOIN 	benefitpoint.posting_record 	AS y 
		ON x.posting_record_id = y.posting_record_id; 
GO 

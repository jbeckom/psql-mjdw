CREATE TABLE IF NOT EXISTS benefitpoint.audit_tam_customer (
	 account_id 			int 		NOT NULL 
	,customer_code 			varchar(7) 	NOT NULL 
	,old_customer_class_code 	TEXT 		NULL 
	,new_customer_class_code 	TEXT 		NULL 
	,old_branch_code 			TEXT 		NULL 
	,new_branch_code 			TEXT 		NULL 
	,old_agency_code 			TEXT 		NULL 
	,new_agency_code 			TEXT 		NULL 
	,old_branch_name 			TEXT 		NULL 
	,new_branch_name 			TEXT 		NULL 
	,old_agency_name 			TEXT 		NULL 
	,new_agency_name 			TEXT 		NULL 
	,old_office_id 				int 		NULL 
	,new_office_id 				int 		NULL 
	,audit_action 				char(1) 	NOT NULL 
	,audit_user 				TEXT 		NOT NULL 	DEFAULT current_user 
	,audit_timestamp 			timestamp 	NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 					bigint 		NOT NULL 	GENERATED ALWAYS AS IDENTITY 	PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.audit_tam_customer OWNER TO mj_admin;
GO 

GRANT INSERT ON TABLE benefitpoint.audit_tam_customer TO rl_benefitpoint_a;
GO 
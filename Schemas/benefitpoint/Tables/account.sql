CREATE TABLE IF NOT EXISTS benefitpoint.account (
	 account_id 									int 				NOT NULL
	,active 										bool 				NOT NULL 	DEFAULT TRUE 
	,inactive_as_of 								timestamptz			NULL 
	,inactive_reason								benefitpoint.inactive_reason 				NULL 
	,account_classification 						benefitpoint.account_classification_type 	NOT NULL 
	,account_type 									benefitpoint.account_type 					NOT NULL 
	,office_id 										int 				NOT NULL 
	,department_id 									int 				NULL 
	,administrator_user_id 							int 				NOT NULL 
	,primary_contact_user_id 						int 				NOT NULL 
	,primary_sales_lead_user_id 					int 				NULL 
	,primary_service_lead_user_id 					int 				NULL 
	,notes 											varchar(1000) 		NULL 
	,last_reviewed_by_user_id 						int 				NULL 
	,last_reviewed_on 								timestamptz			NULL 
	,created_on 									timestamptz			NULL 
	,last_modified_on 								timestamptz			NULL 
	,excluded_purge 								bool 				NULL 
	,CONSTRAINT account_pkey PRIMARY KEY (account_id) 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.account OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE benefitpoint.account TO rl_benefitpoint_r; 
GO 

GRANT INSERT ON TABLE benefitpoint.account TO rl_benefitpoint_a;
GO 

GRANT UPDATE ON TABLE benefitpoint.account TO rl_benefitpoint_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON benefitpoint.account FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_account_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON benefitpoint.account FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_account_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON benefitpoint.account FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION benefitpoint.tr_audit_account_u();
GO 

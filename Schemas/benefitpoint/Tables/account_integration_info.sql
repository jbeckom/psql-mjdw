CREATE TABLE IF NOT EXISTS benefitpoint.account_integration_info (
	 account_id 					int 			NOT NULL 
	,sagitta_client_id 				varchar(100) 	NOT NULL 
	,source_code 					varchar(16) 	NULL 
	,primary_sales_lead_int_code 	varchar(10) 	NULL 
	,primary_service_lead_int_code 	varchar(10) 	NULL 
	,ams_customer_id 				TEXT 			NULL 
	,ams_customer_number 			int 			NULL 
	,CONSTRAINT account_integration_info_pkey PRIMARY KEY (account_id, sagitta_client_id)
	,CONSTRAINT account_fkey FOREIGN KEY (account_id) REFERENCES benefitpoint.account (account_id) ON DELETE CASCADE 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.account_integration_info OWNER TO mj_admin;
GO 

GRANT SELECT ON benefitpoint.account_integration_info TO rl_benefitpoint_r;
GO 

GRANT INSERT ON benefitpoint.account_integration_info TO rl_benefitpoint_a;
GO 

GRANT UPDATE ON benefitpoint.account_integration_info TO rl_benefitpoint_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON benefitpoint.account_integration_info FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_account_integration_info_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON benefitpoint.account_integration_info FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_account_integration_info_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON benefitpoint.account_integration_info FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION benefitpoint.tr_audit_account_integration_info_u();
GO 

CREATE TABLE benefitpoint.brokerage_account_info (
	 account_id 				int 							NOT NULL 
	,account_type 				TEXT 							NOT NULL 
	,account_number 			varchar(100) 					NULL 
	,broker_of_record_as_of 	timestamp 						NULL 
	,hipaa_required 			benefitpoint.optional_boolean 	NULL 
	,hipaa_signed_on 			timestamp 						NULL 
	,CONSTRAINT brokerage_account_info_pkey PRIMARY KEY (account_id, account_type)
	,CONSTRAINT account_fkey FOREIGN KEY (account_id) REFERENCES benefitpoint.account (account_id) ON DELETE CASCADE 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.brokerage_account_info OWNER TO mj_admin;
GO 

GRANT SELECT ON benefitpoint.brokerage_account_info TO rl_benefitpoint_r;
GO 

GRANT INSERT ON benefitpoint.brokerage_account_info TO rl_benefitpoint_a;
GO 

GRANT UPDATE ON benefitpoint.brokerage_account_info TO rl_benefitpoint_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON benefitpoint.brokerage_account_info FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_brokerage_account_info_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON benefitpoint.brokerage_account_info FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_brokerage_account_info_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON benefitpoint.brokerage_account_info FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION benefitpoint.tr_audit_brokerage_account_info_u();
GO 

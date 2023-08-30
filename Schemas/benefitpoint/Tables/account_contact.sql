CREATE TABLE benefitpoint.account_contact (
	 account_id 			int 			NOT NULL 
	,title 					varchar(100) 	NULL 
	,additional_info 		varchar(100) 	NULL 
	,primary_contact 		boolean 		NULL 
	,primary_location_id 	int 			NULL 
	,notes 					varchar(500) 	NULL 
	,last_modified_on 		timestamptz 	NULL 
	,CONSTRAINT account_contact_pkey PRIMARY KEY (account_id)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.account_contact OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE benefitpoint.account_contact TO rl_benefitpoint_r;
GO 

GRANT INSERT ON TABLE benefitpoint.account_contact TO rl_benefitpoint_a;
GO 

GRANT UPDATE ON TABLE benefitpoint.account_contact TO rl_benefitpoint_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON benefitpoint.account_contact FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_account_contact_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON benefitpoint.account_contact FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_account_contact_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON benefitpoint.account_contact FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION benefitpoint.tr_audit_account_contact_u();
GO 

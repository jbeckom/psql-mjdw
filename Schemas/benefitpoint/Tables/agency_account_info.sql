CREATE TABLE benefitpoint.agency_account_info (
	 account_id 	int 			NOT NULL 
	,agency_name 	varchar(250) 	NOT NULL 
	,CONSTRAINT account_fkey FOREIGN KEY (account_id) REFERENCES benefitpoint.account (account_id) ON DELETE CASCADE 
	,CONSTRAINT agency_account_pkey PRIMARY KEY (account_id)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.agency_account_info OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE benefitpoint.agency_account_info TO rl_benefitpoint_r;
GO 

GRANT INSERT ON TABLE benefitpoint.agency_account_info TO rl_benefitpoint_a;
GO 

GRANT UPDATE ON TABLE benefitpoint.agency_account_info TO rl_benefitpoint_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON benefitpoint.agency_account_info FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_agency_account_info_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON benefitpoint.agency_account_info FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_agency_account_info_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON benefitpoint.agency_account_info FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION benefitpoint.tr_audit_agency_account_info_u();
GO 

CREATE TABLE benefitpoint.agency_account_associated_accounts (
	 agency_account_id 		int 	NOT NULL 
	,associated_account_id 	int 	NOT NULL 
	,CONSTRAINT agency_account_fkey FOREIGN KEY (agency_account_id) REFERENCES benefitpoint.account (account_id)
	,CONSTRAINT agency_account_associated_accounts_pkey PRIMARY KEY (agency_account_id, associated_account_id)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.agency_account_associated_accounts OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE benefitpoint.agency_account_associated_accounts TO rl_benefitpoint_r;
GO 

GRANT INSERT ON TABLE benefitpoint.agency_account_associated_accounts TO rl_benefitpoint_a;
GO 

GRANT DELETE ON TABLE benefitpoint.agency_account_associated_accounts TO rl_benefitpoint_d;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER prevent_u BEFORE UPDATE ON benefitpoint.agency_account_associated_accounts FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_prevent_modify();
GO 

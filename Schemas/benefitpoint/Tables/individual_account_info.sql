CREATE TABLE IF NOT EXISTS benefitpoint.individual_account_info (
	 account_id 					int 			NOT NULL 
	,email 							varchar(250) 	NULL 
	,affiliated_group_account_id 	int 			NULL 
	,CONSTRAINT individual_account_info_pkey PRIMARY KEY (account_id)
	,CONSTRAINT account_fkey FOREIGN KEY (account_id) REFERENCES benefitpoint.account (account_id) ON DELETE CASCADE 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.individual_account_info OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE benefitpoint.individual_account_info TO rl_benefitpoint_r;
GO 

GRANT INSERT ON TABLE benefitpoint.individual_account_info TO rl_benefitpoint_a;
GO 

GRANT UPDATE ON TABLE benefitpoint.individual_account_info TO rl_benefitpoint_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON benefitpoint.individual_account_info FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_individual_account_info_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON benefitpoint.individual_account_info FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_individual_account_info_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON benefitpoint.individual_account_info FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION benefitpoint.tr_audit_individual_account_info_u();
GO 

CREATE TABLE IF NOT EXISTS benefitpoint.ams360_account_business_type (
	 account_id 					int 	NOT NULL 
	,is_benefits 					bool 	NULL 
	,is_commercial 					bool 	NULL 
	,is_financial 					bool 	NULL 
	,is_health 						bool 	NULL 
	,is_life 						bool 	NULL 
	,is_non_property_and_casualty 	bool 	NULL 
	,is_personal 					bool 	NULL 
	,CONSTRAINT ams360_account_business_type_pkey PRIMARY KEY (account_id)
	,CONSTRAINT account_fkey FOREIGN KEY (account_id) REFERENCES benefitpoint.account (account_id)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.ams360_account_business_type OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE benefitpoint.ams360_account_business_type TO rl_benefitpoint_r;
GO 

GRANT INSERT ON TABLE benefitpoint.ams360_account_business_type TO rl_benefitpoint_a;
GO 

GRANT UPDATE ON TABLE benefitpoint.ams360_account_business_type TO rl_benefitpoint_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON benefitpoint.ams360_account_business_type FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_ams360_account_business_type_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON benefitpoint.ams360_account_business_type FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_ams360_account_business_type_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON benefitpoint.ams360_account_business_type FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION benefitpoint.tr_audit_ams360_account_business_type_u();
GO 

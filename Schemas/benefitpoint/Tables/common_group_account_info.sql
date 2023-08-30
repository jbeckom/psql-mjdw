CREATE TABLE IF NOT EXISTS benefitpoint.common_group_account_info (
	 account_id 				int 			NOT NULL 
	,number_of_retirees 		int 			NULL 
	,number_of_retirees_as_of 	timestamp 		NULL 
	,year_established 			int 			NULL 
	,account_funding_type 		benefitpoint.account_funding_type 	NULL 
	,primary_industry 			benefitpoint.industry_type 			NULL 
	,secondary_industry 		benefitpoint.industry_type 			NULL 
	,other_primary_industry 	varchar(100) 	NULL 
	,other_secondary_industry 	varchar(100) 	NULL 
	,tax_payer_id 				varchar(20) 	NULL 
	,website 					varchar(100) 	NULL 
	,CONSTRAINT account_fkey FOREIGN KEY (account_id) REFERENCES benefitpoint.account (account_id) ON DELETE CASCADE 
	,CONSTRAINT common_group_account_info_pkey PRIMARY KEY (account_id)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.common_group_account_info OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE benefitpoint.common_group_account_info TO rl_benefitpoint_r;
GO 

GRANT INSERT ON TABLE benefitpoint.common_group_account_info TO rl_benefitpoint_a;
GO 

GRANT UPDATE ON TABLE benefitpoint.common_group_account_info TO rl_benefitpoint_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON benefitpoint.common_group_account_info FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_common_group_account_info_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON benefitpoint.common_group_account_info FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_common_group_account_info_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON benefitpoint.common_group_account_info FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION benefitpoint.tr_audit_common_group_account_info_u();
GO 

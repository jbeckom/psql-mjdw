CREATE TABLE IF NOT EXISTS benefitpoint.audit_common_group_account_info (
	 account_id 					int 			NOT NULL 
	,old_number_of_retirees 		int 			NULL 
	,new_number_of_retirees 		int 			NULL 
	,old_number_of_retirees_as_of 	timestamp 		NULL 
	,new_number_of_retirees_as_of 	timestamp 		NULL 
	,old_year_established 			int 			NULL 
	,new_year_established 			int 			NULL 
	,old_account_funding_type 		TEXT 			NULL 
	,new_account_funding_type 		TEXT 			NULL 
	,old_primary_industry 			TEXT 			NULL 
	,new_primary_industry 			TEXT 			NULL 
	,old_secondary_industry 		TEXT 			NULL 
	,new_secondary_industry 		TEXT 			NULL 
	,old_other_primary_industry 	varchar(100) 	NULL 
	,new_other_primary_industry 	varchar(100) 	NULL 
	,old_other_secondary_industry 	varchar(100) 	NULL 
	,new_other_secondary_industry 	varchar(100) 	NULL 
	,old_tax_payer_id 				varchar(20) 	NULL 
	,new_tax_payer_id 				varchar(20) 	NULL 
	,old_website 					varchar(100) 	NULL 
	,new_website 					varchar(100) 	NULL 
	,audit_action 					char(1) 		NOT NULL 
	,audit_user 					TEXT 			NOT NULL 	DEFAULT current_user 
	,audit_timestamp 				timestamp 		NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 						bigint 			NOT NULL 	GENERATED ALWAYS AS IDENTITY 	PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.audit_common_group_account_info OWNER TO mj_admin;
GO 

GRANT INSERT ON TABLE benefitpoint.audit_common_group_account_info TO rl_benefitpoint_a;
GO 

CREATE TABLE IF NOT EXISTS benefitpoint.group_account_info (
	 account_id 									int 								NOT NULL 
	,account_name 									varchar(100) 						NOT NULL 
	,dba 											varchar(100) 						NULL 
	,number_of_ftes 								int 								NULL 
	,number_of_ftes_as_of 							timestamp 							NULL 
	,number_of_full_time_equivalents 				int 								NULL 
	,number_of_full_time_equivalents_as_of_date 	timestamp 							NULL 
	,coverage_subject_to_employer_mandate 			bool 								NULL 
	,market_size 									benefitpoint.employer_market_size 	NULL 
	,business_type 									benefitpoint.business_type 			NULL 
	,sic_code 										varchar(20) 						NULL 
	,naics_code 									varchar(100) 						NULL 
	,requires_5500 									benefitpoint.optional_boolean 		NULL 
	,locations_by_zip 								varchar(256) 						NULL 
	,affiliates 									varchar(512) 						NULL 
	,budgeted_total_annual_premium 					double PRECISION 					NULL 
	,budgeted_total_annual_revenue 					double PRECISION 					NULL 
	,multiple_payroll_cycles 						bool 				NULL 
	,multiple_payroll_cycles_differ_by 				TEXT 				NULL 
	,single_payroll_cycle 							TEXT 				NULL 
	,CONSTRAINT account_fkey FOREIGN KEY (account_id) REFERENCES benefitpoint.account (account_id) ON DELETE CASCADE 
	,CONSTRAINT group_account_info_pkey PRIMARY KEY (account_id)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.group_account_info OWNER TO mj_admin;
GO 

GRANT SELECT ON benefitpoint.group_account_info TO rl_benefitpoint_r;
GO 

GRANT INSERT ON benefitpoint.group_account_info TO rl_benefitpoint_a;
GO 

GRANT UPDATE ON benefitpoint.group_account_info TO rl_benefitpoint_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON benefitpoint.group_account_info FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_group_account_info_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON benefitpoint.group_account_info FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_group_account_info_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON benefitpoint.group_account_info FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION benefitpoint.tr_audit_group_account_info_u();
GO 

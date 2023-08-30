CREATE TABLE benefitpoint.marketing_group_account_info (
	 account_id 									int 								NOT NULL 
	,marketing_group_name 							varchar(100) 						NOT NULL 
	,marketing_group_type 							benefitpoint.marketing_group_type 	NOT NULL 
	,number_of_ftes 								int 								NULL 
	,number_of_ftes_as_of 							timestamp 							NULL 
	,number_of_full_time_equivalents 				int 								NULL 
	,number_of_full_time_equivalents_as_of_date 	timestamp 							NULL 
	,coverage_subject_to_employer_mandate 			bool 								NULL 
	,CONSTRAINT account_fkey FOREIGN KEY (account_id) REFERENCES benefitpoint.account (account_id) ON DELETE CASCADE 
	,CONSTRAINT marketing_group_account_pkey PRIMARY KEY (account_id)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.marketing_group_account_info OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE benefitpoint.marketing_group_account_info TO rl_benefitpoint_r;
GO 

GRANT INSERT ON TABLE benefitpoint.marketing_group_account_info TO rl_benefitpoint_a;
GO 

GRANT UPDATE ON TABLE benefitpoint.marketing_group_account_info TO rl_benefitpoint_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON benefitpoint.marketing_group_account_info FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_marketing_group_account_info_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON benefitpoint.marketing_group_account_info FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_marketing_group_account_info_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON benefitpoint.marketing_group_account_info FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION benefitpoint.tr_audit_marketing_group_account_info_u();
GO 

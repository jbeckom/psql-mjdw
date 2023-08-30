CREATE TABLE benefitpoint.audit_account_contact (
	 account_id 			    int 			NOT NULL 
	,old_title 					varchar(100) 	NULL 
	,new_title 					varchar(100) 	NULL 
	,old_additional_info 		varchar(100) 	NULL 
	,new_additional_info 		varchar(100) 	NULL 
	,old_primary_contact 		boolean 		NULL 
	,new_primary_contact 		boolean 		NULL 
	,old_primary_location_id 	int 			NULL 
	,new_primary_location_id 	int 			NULL 
	,old_notes 					varchar(500) 	NULL 
	,new_notes 					varchar(500) 	NULL 
	,old_last_modified_on 		timestamptz 	NULL 
	,new_last_modified_on 		timestamptz 	NULL 
	,audit_action 				char(1) 		NOT NULL 
	,audit_user 				TEXT 			NOT NULL 	DEFAULT current_user 
	,audit_timestamp 			timestamp 		NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 					bigint 			NOT NULL 	GENERATED ALWAYS AS IDENTITY 
	,CONSTRAINT audit_account_contact_pkey PRIMARY KEY (audit_id)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.audit_account_contact OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE benefitpoint.audit_account_contact TO rl_benefitpoint_r;
GO 

GRANT INSERT ON TABLE benefitpoint.audit_account_contact TO rl_benefitpoint_a;
GO 

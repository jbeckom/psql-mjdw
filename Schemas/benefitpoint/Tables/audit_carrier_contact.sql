CREATE TABLE benefitpoint.audit_carrier_contact (
	 carrier_id 				int 			NOT NULL 
 	,old_all_contact 			bool 			NULL 
 	,new_all_contact 			bool 			NULL 
 	,old_title 					varchar(100) 	NULL 
 	,new_title 					varchar(100) 	NULL 
 	,old_assistant_first_name 	varchar(100) 	NULL 
 	,new_assistant_first_name 	varchar(100) 	NULL 
 	,old_assistant_last_name 	varchar(100) 	NULL 
 	,new_assistant_last_name 	varchar(100) 	NULL 
 	,old_assistant_email 		varchar(100) 	NULL 
 	,new_assistant_email 		varchar(100) 	NULL 
 	,old_market_size 			benefitpoint.market_size 	NULL 
 	,new_market_size 			benefitpoint.market_size 	NULL 
 	,old_notes 					varchar(500) 	NULL 
 	,new_notes 					varchar(500) 	NULL 
 	,old_last_modified_on 		timestamptz 	NULL 
 	,new_last_modified_on 		timestamptz 	NULL 
 	,audit_action 				char(1) 		NOT NULL 
 	,audit_user 				TEXT 			NOT NULL 	DEFAULT current_user
 	,audit_timestamp	 		timestamp 		NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
 	,audit_id 					bigint 			NOT NULL 	GENERATED ALWAYS AS IDENTITY 
 	,CONSTRAINT audit_carrier_contact_pkey PRIMARY KEY (audit_id)
);
GO

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.audit_carrier_contact OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE benefitpoint.audit_carrier_contact TO rl_benefitpoint_r;
GO 

GRANT INSERT ON TABLE benefitpoint.audit_carrier_contact TO rl_benefitpoint_a;
GO 

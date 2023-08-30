CREATE TABLE sagitta.audit_contacts_phone_group (
	sagitem 			int 		NOT NULL,
	lis 				int 		NOT NULL,
	old_type 			text 		NULL,
	new_type 			text 		NULL,
	old_phone_number 	text 		NULL,
	new_phone_number 	text 		NULL,
	old_extension 		text 		NULL,
	new_extension 		text 		NULL,
	old_primary_phone 	text 		NULL,
	new_primary_phone 	text 		NULL,
	old_mobile_number 	text 		NULL,
	new_mobile_number 	text 		NULL,
	old_primary_mobile 	text 		NULL,
	new_primary_mobile 	text 		NULL,
	old_fax 			text 		NULL,
	new_fax 			text 		NULL,
	old_preferred 		text 		NULL,
	new_preferred 		text 		NULL,
	audit_action 		char(1) 	NOT NULL,
	audit_user 			text 		NOT NULL 	DEFAULT CURRENT_USER,
	audit_timestamp 	timestamp 	NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp()),
	audit_id 			bigint 		NOT NULL 	GENERATED ALWAYS AS IDENTITY 	PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.audit_contacts_phone_group OWNER TO mj_admin;
GO 

GRANT INSERT ON TABLE sagitta.audit_contacts_phone_group TO rl_sagitta_a;
GO 

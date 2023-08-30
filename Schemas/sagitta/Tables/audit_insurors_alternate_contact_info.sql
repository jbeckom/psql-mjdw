CREATE TABLE sagitta.audit_insurors_alternate_contact_info (
	 sagitem 									int 		NOT NULL
	,lis 										int 		NOT NULL 
	,old_alternate_contact_type_cd 					TEXT 		NULL 
	,new_alternate_contact_type_cd 					TEXT 		NULL 
	,old_alternate_contact_name 					TEXT 		NULL 
	,new_alternate_contact_name 					TEXT 		NULL 
	,old_alternate_contact_addr_1 					TEXT 		NULL 
	,new_alternate_contact_addr_1 					TEXT 		NULL 
	,old_alternate_contact_postal_code 				TEXT 		NULL 
	,new_alternate_contact_postal_code 				TEXT 		NULL 
	,old_alternate_contact_postal_extension_code 	TEXT 		NULL 
	,new_alternate_contact_postal_extension_code 	TEXT 		NULL 
	,old_alternate_contact_city 					TEXT 		NULL 
	,new_alternate_contact_city 					TEXT 		NULL 
	,old_alternate_contact_state_prov_cd 			TEXT 		NULL 
	,new_alternate_contact_state_prov_cd 			TEXT 		NULL 
	,old_alternate_contact_salutation 				TEXT 		NULL 
	,new_alternate_contact_salutation 				TEXT 		NULL 
	,old_alternate_contact_phone_number 			TEXT 		NULL 
	,new_alternate_contact_phone_number 			TEXT 		NULL 
	,old_alternate_contact_phone_extension_number 	TEXT 		NULL 
	,new_alternate_contact_phone_extension_number 	TEXT 		NULL 
	,old_alternate_contact_addr_2 					TEXT 		NULL 
	,new_alternate_contact_addr_2 					TEXT 		NULL 
	,old_contact_fax_number 						TEXT 		NULL 
	,new_contact_fax_number 						TEXT 		NULL 
	,old_email_addr 								TEXT 		NULL 
	,new_email_addr 								TEXT 		NULL 
	,audit_action 									char(1) 	NOT NULL 
	,audit_user 									TEXT 		NOT NULL 	DEFAULT current_user 
	,audit_timestamp 								timestamp 	NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 										bigint 		NOT NULL 	GENERATED ALWAYS AS IDENTITY 	PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.audit_insurors_alternate_contact_info OWNER TO mj_admin;
GO 

GRANT INSERT ON sagitta.audit_insurors_alternate_contact_info TO rl_sagitta_a;
GO 

CREATE TABLE sagitta.audit_contacts_address_group (
	 sagitem 			int 		NOT NULL 
	,lis 				int 		NOT NULL 
	,old_type 			TEXT 		NULL 
	,new_type 			TEXT 		NULL 
	,old_address 		TEXT 		NULL 
	,new_address 		TEXT 		NULL 
	,old_address_2 		TEXT 		NULL 
	,new_address_2 		TEXT 		NULL 
	,old_zip 			TEXT 		NULL 
	,new_zip 			TEXT 		NULL 
	,old_zip_ext 		TEXT 		NULL 
	,new_zip_ext 		TEXT 		NULL 
	,old_city 			TEXT 		NULL 
	,new_city 			TEXT 		NULL 
	,old_state 			TEXT 		NULL 
	,new_state 			TEXT 		NULL 
	,old_country 		TEXT 		NULL 
	,new_country 		TEXT 		NULL 
	,old_primary 		TEXT 		NULL 
	,new_primary 		TEXT 		NULL 
	,old_preferred 		TEXT 		NULL 
	,new_preferred 		TEXT 		NULL 
	,audit_action 		char(1) 	NOT NULL 
	,audit_user 		TEXT 		NOT NULL 	DEFAULT current_user
	,audit_timestamp 	timestamp 	NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 			bigint 		NOT NULL 	GENERATED ALWAYS AS IDENTITY 	PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.audit_contacts_address_group OWNER TO mj_admin;
GO 

GRANT INSERT ON TABLE sagitta.audit_contacts_address_group TO rl_sagitta_a;
GO 
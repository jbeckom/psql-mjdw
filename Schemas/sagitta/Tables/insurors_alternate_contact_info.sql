CREATE TABLE sagitta.insurors_alternate_contact_info (
	 sagitem 									int 		NOT NULL
	,lis 										int 		NOT NULL 
	,alternate_contact_type_cd 					TEXT 		NULL 
	,alternate_contact_name 					TEXT 		NULL 
	,alternate_contact_addr_1 					TEXT 		NULL 
	,alternate_contact_postal_code 				TEXT 		NULL 
	,alternate_contact_postal_extension_code 	TEXT 		NULL 
	,alternate_contact_city 					TEXT 		NULL 
	,alternate_contact_state_prov_cd 			TEXT 		NULL 
	,alternate_contact_salutation 				TEXT 		NULL 
	,alternate_contact_phone_number 			TEXT 		NULL 
	,alternate_contact_phone_extension_number 	TEXT 		NULL 
	,alternate_contact_addr_2 					TEXT 		NULL 
	,contact_fax_number 						TEXT 		NULL 
	,email_addr 								TEXT 		NULL 
	,CONSTRAINT insurors_alter_contact_info_pkey 	PRIMARY KEY (sagitem,lis)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.insurors_alternate_contact_info OWNER TO mj_admin;
GO 

GRANT SELECT ON sagitta.insurors_alternate_contact_info TO rl_sagitta_r;
GO 

GRANT INSERT ON sagitta.insurors_alternate_contact_info TO rl_sagitta_a;
GO 

GRANT UPDATE ON sagitta.insurors_alternate_contact_info TO rl_sagitta_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON sagitta.insurors_alternate_contact_info FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_insurors_alternate_contact_info_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON sagitta.insurors_alternate_contact_info FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_insurors_alternate_contact_info_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON sagitta.insurors_alternate_contact_info FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION sagitta.tr_audit_insurors_alternate_contact_info_u();
GO 

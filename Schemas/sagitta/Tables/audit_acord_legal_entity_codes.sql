CREATE TABLE sagitta.audit_acord_legal_entity_codes (
	 sagitem 					varchar(4) 		NOT NULL 
	,old_uc 					text 			NULL 
	,new_uc 					text 			NULL 
	,old_description 			TEXT 			NULL 
	,new_description 			TEXT 			NULL 
	,old_date_off 				TEXT 			NULL 
	,new_date_off 				TEXT 			NULL 
	,old_date_off_remarks 		TEXT 			NULL 
	,new_date_off_remarks 		TEXT 			NULL 
	,audit_action 				char(1) 		NOT NULL 
	,audit_user 				TEXT 			NOT NULL 	DEFAULT current_user 
	,audit_timestamp 			timestamp 		NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 					bigint 			NOT NULL 	GENERATED ALWAYS AS IDENTITY 	PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.audit_acord_legal_entity_codes OWNER TO mj_admin;
GO 

GRANT INSERT ON TABLE sagitta.audit_acord_legal_entity_codes TO rl_sagitta_a;
GO 

CREATE TABLE sagitta.acord_legal_entity_codes (
	 sagitem 			varchar(4) 		NOT NULL 
	,uc 				text 			NULL 
	,description 		text 			NULL 
	,date_off 			text 			NULL 
	,date_off_remarks 	text 			NULL 
	,modify_dt 			timestamp 		NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,CONSTRAINT acord_legal_entity_codes_pkey PRIMARY KEY (sagitem)
);

/*** PERMISSIONS ***/
ALTER TABLE sagitta.acord_legal_entity_codes OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE sagitta.acord_legal_entity_codes TO rl_sagitta_r;
GO 

GRANT INSERT ON TABLE sagitta.acord_legal_entity_codes TO rl_sagitta_a;
GO 

GRANT UPDATE ON TABLE sagitta.acord_legal_entity_codes TO rl_sagitta_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON sagitta.acord_legal_entity_codes FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_acord_legal_entity_codes_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON sagitta.acord_legal_entity_codes FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_acord_legal_entity_codes_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON sagitta.acord_legal_entity_codes FOR EACH ROW WHEN (NEW IS DISTINCT FROM OLD) EXECUTE FUNCTION sagitta.tr_audit_acord_legal_entity_codes_u();
GO 

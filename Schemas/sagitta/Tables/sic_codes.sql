CREATE TABLE sagitta.sic_codes (
	 sagitem 		int 		NOT NULL 
	,uc 			TEXT 		NULL 
	,description 	TEXT 		NULL 
	,category 		TEXT 		NULL 
	,modify_dt 		timestamp 	NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp()) 
	,CONSTRAINT sic_codes_pkey PRIMARY KEY (sagitem) 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.sic_codes OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE sagitta.sic_codes TO rl_sagitta_r;
GO 

GRANT INSERT ON TABLE sagitta.sic_codes TO rl_sagitta_a;
GO 

GRANT UPDATE ON TABLE sagitta.sic_codes TO rl_sagitta_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON sagitta.sic_codes FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_sic_codes_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON sagitta.sic_codes FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_sic_codes_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON sagitta.sic_codes FOR EACH ROW WHEN (NEW IS DISTINCT FROM OLD) EXECUTE FUNCTION sagitta.tr_audit_sic_codes_u();
GO 

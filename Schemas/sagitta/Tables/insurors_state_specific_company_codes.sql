CREATE TABLE sagitta.insurors_state_specific_company_codes (
	 sagitem 					int 		NOT NULL 
	,lis 						int 		NOT NULL 
	,code_state 				TEXT 		NOT NULL 
	,state_company_code 		TEXT 		NOT NULL 
	,CONSTRAINT insurors_state_specific_company_codes_pkey PRIMARY KEY (sagitem,lis,code_state,state_company_code)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.insurors_state_specific_company_codes OWNER TO mj_admin;
GO 

GRANT SELECT ON sagitta.insurors_state_specific_company_codes TO rl_sagitta_r;
GO 

GRANT INSERT ON sagitta.insurors_state_specific_company_codes TO rl_sagitta_a;
GO 

GRANT DELETE ON sagitta.insurors_state_specific_company_codes TO rl_sagitta_d;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON sagitta.insurors_state_specific_company_codes FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_insurors_state_specific_company_codes_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON sagitta.insurors_state_specific_company_codes FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_insurors_state_specific_company_codes_i();
GO 

CREATE TRIGGER prevent_u BEFORE UPDATE ON sagitta.insurors_state_specific_company_codes FOR EACH ROW EXECUTE FUNCTION sagitta.tr_prevent_update();
GO 
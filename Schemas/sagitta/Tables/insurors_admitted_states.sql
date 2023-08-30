CREATE TABLE sagitta.insurors_admitted_states (
	 sagitem 		int 		NOT NULL 
	,lis 			int 		NOT NULL 
	,state_code 	TEXT 		NOT NULL 
	,CONSTRAINT insurors_admitted_states_pkey PRIMARY KEY (sagitem,lis,state_code) 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.insurors_admitted_states OWNER TO mj_admin;
GO 

GRANT SELECT ON sagitta.insurors_admitted_states TO rl_sagitta_r;
GO 

GRANT INSERT ON sagitta.insurors_admitted_states TO rl_sagitta_a;
GO 

GRANT DELETE ON sagitta.insurors_admitted_states TO rl_sagitta_d;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON sagitta.insurors_admitted_states FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_insurors_admitted_states_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON sagitta.insurors_admitted_states FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_insurors_admitted_states_i();
GO 

CREATE TRIGGER prevent_u BEFORE UPDATE ON sagitta.insurors_admitted_states FOR EACH ROW EXECUTE FUNCTION sagitta.tr_prevent_update();
GO 
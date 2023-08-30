CREATE TABLE sagitta.br_coverages_loss_cause_cd_info (
	 sagitem 					int 		NOT NULL 
	,lis 						int 		NOT NULL 
	,loss_cause 				TEXT 		NULL 
	,loss_cause_sub_limit 		TEXT 		NULL 
	,loss_cause_deductible_amt 	TEXT 		NULL 
	,CONSTRAINT br_coverages_loss_cause_cd_info_pkey PRIMARY KEY (sagitem,lis)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.br_coverages_loss_cause_cd_info OWNER TO mj_admin;
GO 

GRANT SELECT ON sagitta.br_coverages_loss_cause_cd_info TO rl_sagitta_r;
GO 

GRANT INSERT ON sagitta.br_coverages_loss_cause_cd_info TO rl_sagitta_a;
GO 

GRANT UPDATE ON sagitta.br_coverages_loss_cause_cd_info TO rl_sagitta_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON sagitta.br_coverages_loss_cause_cd_info FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_br_coverages_loss_cause_cd_info_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON sagitta.br_coverages_loss_cause_cd_info FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_br_coverages_loss_cause_cd_info_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON sagitta.br_coverages_loss_cause_cd_info FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION sagitta.tr_audit_br_coverages_loss_cause_cd_info_u();
GO 

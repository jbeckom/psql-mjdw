CREATE TABLE sagitta.ac_coverages_vpcli(
	 sagitem 						int 	NOT NULL 
	,lis 							int 	NOT NULL 
	,val_papers_location_id 		TEXT 	NULL 
	,val_papers_sub 				TEXT 	NULL 
	,val_papers_your_premises_amt 	TEXT 	NULL 
	,CONSTRAINT ac_coverages_vpcli_pkey PRIMARY KEY (sagitem,lis)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.ac_coverages_vpcli OWNER TO mj_admin;
GO 

GRANT SELECT ON sagitta.ac_coverages_vpcli TO rl_sagitta_r;
GO 

GRANT INSERT ON sagitta.ac_coverages_vpcli TO rl_sagitta_a;
GO 

GRANT UPDATE ON sagitta.ac_coverages_vpcli TO rl_sagitta_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON sagitta.ac_coverages_vpcli FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_ac_coverages_vpcli_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON sagitta.ac_coverages_vpcli FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_ac_coverages_vpcli_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON sagitta.ac_coverages_vpcli FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION sagitta.tr_audit_ac_coverages_vpcli_u();
GO 
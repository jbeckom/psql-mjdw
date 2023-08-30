CREATE TABLE sagitta.ac_coverages_arcli (
	 sagitem 						int 	NOT NULL 
	,lis 							int 	NOT NULL 
	,accts_rec_location_id 			TEXT 	NULL 
	,accts_rec_sub 					TEXT 	NULL 
	,accts_rec_cov_sub 				TEXT 	NULL 
	,accts_rec_your_premises_limit 	TEXT 	NULL 
	,CONSTRAINT ac_coverages_arcli_pkey PRIMARY KEY (sagitem, lis)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.ac_coverages_arcli OWNER TO mj_admin;
GO 

GRANT SELECT ON sagitta.ac_coverages_arcli TO rl_sagitta_r;
GO 

GRANT INSERT ON sagitta.ac_coverages_arcli TO rl_sagitta_a;
GO 

GRANT UPDATE ON sagitta.ac_coverages_arcli TO rl_sagitta_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON sagitta.ac_coverages_arcli FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_ac_coverages_arcli_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON sagitta.ac_coverages_arcli FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_ac_coverages_arcli_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON sagitta.ac_coverages_arcli FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION sagitta.tr_audit_ac_coverages_arcli_u();
GO 
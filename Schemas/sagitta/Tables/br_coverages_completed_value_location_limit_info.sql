CREATE TABLE sagitta.br_coverages_completed_value_location_limit_info (
	 sagitem 									int 		NOT NULL 
	,lis 										int 		NOT NULL 
	,completed_value_location_number 			TEXT 		NULL 
	,completed_value_sub_location_number 		TEXT 		NULL 
	,completed_value_site_limit 				TEXT 		NULL 
	,CONSTRAINT br_coverages_completed_value_location_limit_info_pkey PRIMARY KEY (sagitem,lis)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.br_coverages_completed_value_location_limit_info OWNER TO mj_admin;
GO 

GRANT SELECT ON sagitta.br_coverages_completed_value_location_limit_info TO rl_sagitta_r;
GO 

GRANT INSERT ON sagitta.br_coverages_completed_value_location_limit_info TO rl_sagitta_a;
GO 

GRANT UPDATE ON sagitta.br_coverages_completed_value_location_limit_info TO rl_sagitta_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON sagitta.br_coverages_completed_value_location_limit_info FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_br_coverages_completed_value_location_limit_info_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON sagitta.br_coverages_completed_value_location_limit_info FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_br_coverages_completed_value_location_limit_info_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON sagitta.br_coverages_completed_value_location_limit_info FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION sagitta.tr_audit_br_coverages_completed_value_location_limit_info_u();
GO 

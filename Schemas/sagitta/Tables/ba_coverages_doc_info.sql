CREATE TABLE sagitta.ba_coverages_doc_info(
	 sagitem 								TEXT 		NOT NULL 
	,lis 									int 		NOT NULL 
	,doc_class_cd 							TEXT 		NULL 
	,doc_location_agency_id 				TEXT 		NULL 
	,doc_state_prov_cd 						TEXT 		NULL 
	,doc_territory_cd 						TEXT 		NULL 
	,doc_num_employees 						TEXT 		NULL 
	,doc_num_individuals_covered 			TEXT 		NULL 
	,doc_fin_resp_doc_cert_yes_no_cd 		TEXT 		NULL 
	,CONSTRAINT ba_coverages_doc_info_pkey PRIMARY KEY (sagitem,lis)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.ba_coverages_doc_info OWNER TO mj_admin;
GO 

GRANT SELECT ON sagitta.ba_coverages_doc_info TO rl_sagitta_r;
GO 

GRANT INSERT ON sagitta.ba_coverages_doc_info TO rl_sagitta_a;
GO 

GRANT UPDATE ON sagitta.ba_coverages_doc_info TO rl_sagitta_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON sagitta.ba_coverages_doc_info FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_ba_coverages_doc_info_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON sagitta.ba_coverages_doc_info FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_ba_coverages_doc_info_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON sagitta.ba_coverages_doc_info FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION sagitta.tr_audit_ba_coverages_doc_info_u();
GO 

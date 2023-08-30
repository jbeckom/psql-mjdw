DROP TABLE IF EXISTS sagitta.coverages;

CREATE TABLE sagitta.coverages (
	 sagitem 						int 		NOT NULL  
	,audit_staff_cd 				TEXT 		NULL 
	,audit_entry_dt 				int 		NULL 
	,audit_time 					int 		NULL 
	,audit_cd 						TEXT 		NULL 
	,audit_history_record_number 	TEXT 		NULL 
	,audit_program 					TEXT 		NULL 
	,audit_effective_dt 			TEXT 		NULL 
	,audit_change_agency_id 		TEXT 		NULL 
	,coverage_cd 					TEXT 		NULL 
	,coverage_description 			TEXT 		NULL 
	,major_lob_cd 					TEXT 		NULL 
	,acord_lob_cd 					TEXT 		NULL 
	,acord_sub_lob 					TEXT 		NULL 
	,coverage_type 					TEXT 		NULL 
	,personal_commercial 			TEXT 		NULL 
	,off_dt 						int 		NULL 
	,off_dt_remarks 				TEXT 		NULL
	,CONSTRAINT coverages_pkey PRIMARY KEY (sagitem) 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.coverages OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE sagitta.coverages TO rl_sagitta_r;
GO 

GRANT INSERT ON TABLE sagitta.coverages TO rl_sagitta_a;
GO 

GRANT UPDATE ON TABLE sagitta.coverages TO rl_sagitta_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON sagitta.coverages FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_coverages_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON sagitta.coverages FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_coverages_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON sagitta.coverages FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION sagitta.tr_audit_coverages_u();
GO 

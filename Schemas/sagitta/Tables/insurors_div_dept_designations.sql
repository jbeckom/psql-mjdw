CREATE TABLE sagitta.insurors_div_dept_designations (
	 sagitem 			int 		NOT NULL 
	,lis 				int 		NOT NULL 
	,valid_div 			TEXT 		NOT NULL 
	,valid_dept 		TEXT 		NOT NULL 
	,limit_new 			TEXT 		NULL 
	,limit_new_date 	TEXT 		NULL 
	,limit_renew 		TEXT 		NULL 
	,limit_renew_date 	TEXT 		NULL 
	,CONSTRAINT insurors_div_dept_designations_pkey PRIMARY KEY (sagitem,lis,valid_div,valid_dept)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.insurors_div_dept_designations OWNER TO mj_admin;
GO 

GRANT SELECT ON sagitta.insurors_div_dept_designations TO rl_sagitta_r;
GO 

GRANT INSERT ON sagitta.insurors_div_dept_designations TO rl_sagitta_a;
GO 

GRANT UPDATE ON sagitta.insurors_div_dept_designations TO rl_sagitta_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON sagitta.insurors_div_dept_designations FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_insurors_div_dept_designations_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON sagitta.insurors_div_dept_designations FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_insurors_div_dept_designations_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON sagitta.insurors_div_dept_designations FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION sagitta.tr_audit_insurors_div_dept_designations_u();
GO 
CREATE TABLE sagitta.staff_commission_group (
	 sagitem 						varchar(5) 	NOT NULL 
	,lis 							int 		NOT NULL 
	,standard_commission 			TEXT 		NULL 
	,"type" 						TEXT 		NULL 
	,insurer_id 					TEXT 		NULL 
	,coverage_cd 					TEXT 		NULL 
	,from_amt 						TEXT 		NULL 
	,to_amt 						TEXT 		NULL 
	,ab_new_comm_percentage 		TEXT 		NULL 
	,ab_renewal_comm_percentage 	TEXT 		NULL 
	,cb_new_comm_percentage 		TEXT 		NULL 
	,cb_renew_comm_percentage 		TEXT 		NULL 
	,start_dt 						TEXT 		NULL 
	,end_dt 						TEXT 		NULL 
	,comm_div 						TEXT 		NULL 
	,comm_dept 						TEXT 		NULL 
	,modify_dt 						timestamp 	NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,CONSTRAINT staff_commission_group_pkey PRIMARY KEY (sagitem, lis)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.staff_commission_group OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE sagitta.staff_commission_group TO rl_sagitta_r;
GO 

GRANT INSERT ON TABLE sagitta.staff_commission_group TO rl_sagitta_a;
GO 

GRANT UPDATE ON TABLE sagitta.staff_commission_group TO rl_sagitta_w;
GO 

GRANT DELETE ON TABLE sagitta.staff_commission_group TO rl_sagitta_d;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON sagitta.staff_commission_group FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_staff_commission_group_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON sagitta.staff_commission_group FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_staff_commission_group_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON sagitta.staff_commission_group FOR EACH ROW WHEN (NEW IS DISTINCT FROM OLD) EXECUTE FUNCTION sagitta.tr_audit_staff_commission_group_u();
GO 

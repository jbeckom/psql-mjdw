CREATE TABLE sagitta.audit_staff_commission_group (
	 sagitem 	                        varchar(5) 	NOT NULL 
	,lis 	                            int 	    NOT NULL 
	,old_standard_commission            TEXT        NULL
	,new_standard_commission            TEXT        NULL
	,old_type                           TEXT        NULL
	,new_type                           TEXT        NULL
	,old_insurer_id                     TEXT        NULL
	,new_insurer_id                     TEXT        NULL
	,old_coverage_cd                    TEXT        NULL
	,new_coverage_cd                    TEXT        NULL
	,old_from_amt                       TEXT        NULL
	,new_from_amt                       TEXT        NULL
	,old_to_amt                         TEXT        NULL
	,new_to_amt                         TEXT        NULL
	,old_ab_new_comm_percentage         TEXT        NULL
	,new_ab_new_comm_percentage         TEXT        NULL
	,old_ab_renewal_comm_percentage     TEXT        NULL
	,new_ab_renewal_comm_percentage     TEXT        NULL
	,old_cb_new_comm_percentage         TEXT        NULL
	,new_cb_new_comm_percentage         TEXT        NULL
	,old_cb_renew_comm_percentage       TEXT        NULL
	,new_cb_renew_comm_percentage       TEXT        NULL
	,old_start_dt                       TEXT        NULL
	,new_start_dt                       TEXT        NULL
	,old_end_dt                         TEXT        NULL
	,new_end_dt                         TEXT        NULL
	,old_comm_div                       TEXT        NULL
	,new_comm_div                       TEXT        NULL
	,old_comm_dept                      TEXT        NULL
	,new_comm_dept                      TEXT        NULL
	,audit_action 	                    char(1) 	NOT NULL 
	,audit_user 	                    TEXT 	    NOT NULL 	DEFAULT current_user
	,audit_timestamp 	                timestamp 	NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 	                        bigint 	    NOT NULL 	GENERATED ALWAYS AS IDENTITY 	PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.audit_staff_commission_group OWNER TO mj_admin;
GO 

GRANT INSERT ON TABLE sagitta.audit_staff_commission_group TO rl_sagitta_a;
GO 

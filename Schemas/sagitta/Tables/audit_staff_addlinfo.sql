CREATE TABLE sagitta.audit_staff_addlinfo (
	 sagitem 	                        varchar(5) 	NOT NULL 
	,old_audit_staff_cd                 TEXT        NULL
	,new_audit_staff_cd                 TEXT        NULL
	,old_audit_entry_dt                 int         NULL
	,new_audit_entry_dt                 int         NULL
	,old_audit_time                     int         NULL
	,new_audit_time                     int         NULL
	,old_audit_cd                       TEXT        NULL
	,new_audit_cd                       TEXT        NULL
	,old_audit_history_record_number    TEXT        NULL
	,new_audit_history_record_number    TEXT        NULL
	,old_audit_program                  TEXT        NULL
	,new_audit_program                  TEXT        NULL
	,old_only_staff_name                TEXT        NULL
	,new_only_staff_name                TEXT        NULL
	,old_associate_role                 TEXT        NULL
	,new_associate_role                 TEXT        NULL
	,audit_action 	                    char(1) 	NOT NULL 
	,audit_user 	                    TEXT 	    NOT NULL 	DEFAULT current_user
	,audit_timestamp 	                timestamp 	NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 	                        bigint 	    NOT NULL 	GENERATED ALWAYS AS IDENTITY 	PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.audit_staff_addlinfo OWNER TO mj_admin;
GO 

GRANT INSERT ON TABLE sagitta.audit_staff_addlinfo TO rl_sagitta_a;
GO 
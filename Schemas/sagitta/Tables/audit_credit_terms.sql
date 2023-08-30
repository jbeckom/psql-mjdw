CREATE TABLE sagitta.audit_credit_terms (
	 sagitem 	                        varchar(3) 	NOT NULL 
	,old_audit_staff_cd 	            TEXT 	    NULL 
	,new_audit_staff_cd 	            TEXT 	    NULL 
	,old_audit_entry_dt 	            int 	    NULL 
	,new_audit_entry_dt 	            int 	    NULL 
	,old_audit_time 	                int 	    NULL 
	,new_audit_time 	                int 	    NULL 
	,old_audit_cd 	                    TEXT 	    NULL 
	,new_audit_cd 	                    TEXT 	    NULL 
	,old_audit_history_record_number 	TEXT 	    NULL 
	,new_audit_history_record_number 	TEXT 	    NULL 
	,old_audit_program 	                TEXT 	    NULL 
	,new_audit_program 	                TEXT 	    NULL 
	,old_credit_terms_description 	    TEXT 	    NULL 
	,new_credit_terms_description 	    TEXT 	    NULL 
	,old_due_days 	                    TEXT 	    NULL 
	,new_due_days 	                    TEXT 	    NULL 
	,old_percent 	                    TEXT 	    NULL 
	,new_percent 	                    TEXT 	    NULL 
	,old_date_off 	                    TEXT 	    NULL 
	,new_date_off 	                    TEXT 	    NULL 
	,old_date_off_remarks 	            TEXT 	    NULL 
	,new_date_off_remarks 	            TEXT 	    NULL 
	,audit_action 	                    char(1)     NOT NULL 
	,audit_user 	                    text 	    NOT NULL 	DEFAULT CURRENT_USER 
	,audit_timestamp 	                timestamp 	NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 	                        bigint 	    NOT NULL 	GENERATED ALWAYS AS IDENTITY 	PRIMARY KEY
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.audit_credit_terms OWNER TO mj_admin;
GO 

GRANT INSERT ON TABLE sagitta.audit_credit_terms TO rl_sagitta_a;
GO 

CREATE TABLE sagitta.audit_coverages (
	 sagitem 							int 		NOT NULL 
	,old_audit_staff_cd                 TEXT    	NULL
	,new_audit_staff_cd                 TEXT    	NULL
	,old_audit_entry_dt                 TEXT    	NULL
	,new_audit_entry_dt                 TEXT    	NULL
	,old_audit_time                     TEXT    	NULL
	,new_audit_time                     TEXT    	NULL
	,old_audit_cd                       TEXT    	NULL
	,new_audit_cd                       TEXT    	NULL
	,old_audit_history_record_number    TEXT    	NULL
	,new_audit_history_record_number    TEXT    	NULL
	,old_audit_program                  TEXT    	NULL
	,new_audit_program                  TEXT    	NULL
	,old_audit_effective_dt             TEXT    	NULL
	,new_audit_effective_dt             TEXT    	NULL
	,old_audit_change_agency_id         TEXT    	NULL
	,new_audit_change_agency_id         TEXT    	NULL
	,old_coverage_cd                    TEXT    	NULL
	,new_coverage_cd                    TEXT    	NULL
	,old_coverage_description           TEXT    	NULL
	,new_coverage_description           TEXT    	NULL
	,old_major_lob_cd                   TEXT    	NULL
	,new_major_lob_cd                   TEXT    	NULL
	,old_acord_lob_cd                   TEXT    	NULL
	,new_acord_lob_cd                   TEXT    	NULL
	,old_acord_sub_lob                  TEXT    	NULL
	,new_acord_sub_lob                  TEXT    	NULL
	,old_coverage_type                  TEXT    	NULL
	,new_coverage_type                  TEXT    	NULL
	,old_personal_commercial            TEXT    	NULL
	,new_personal_commercial            TEXT    	NULL
	,old_off_dt                         TEXT    	NULL
	,new_off_dt                         TEXT    	NULL
	,old_off_dt_remarks                 TEXT    	NULL
	,new_off_dt_remarks                 TEXT    	NULL
	,audit_action 						char(1) 	NOT NULL 
	,audit_user 						TEXT 		NOT NULL 	DEFAULT current_user 
	,audit_timestamp 					timestamp 	NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 							bigint 		NOT NULL 	GENERATED ALWAYS AS IDENTITY 	PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.audit_coverages OWNER TO mj_admin;
GO 

GRANT INSERT ON TABLE sagitta.audit_coverages TO rl_sagitta_a;
GO 

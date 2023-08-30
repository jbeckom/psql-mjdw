CREATE TABLE sagitta.audit_staff (
	 sagitem 	                        varchar(5) 	NOT NULL
	,old_audit_staff_cd                 TEXT        NULL
	,new_audit_staff_cd                 TEXT        NULL
	,old_audit_entry_dt                 int 		NULL
	,new_audit_entry_dt                 int 		NULL
	,old_audit_time                     int 		NULL
	,new_audit_time                     int 		NULL
	,old_audit_cd                       TEXT        NULL
	,new_audit_cd                       TEXT        NULL
	,old_audit_history_record_number    TEXT        NULL
	,new_audit_history_record_number    TEXT        NULL
	,old_audit_program                  TEXT        NULL
	,new_audit_program                  TEXT        NULL
	,old_staff_name                     TEXT        NULL
	,new_staff_name                     TEXT        NULL
	,old_addr_1                         TEXT        NULL
	,new_addr_1                         TEXT        NULL
	,old_addr_2                         TEXT        NULL
	,new_addr_2                         TEXT        NULL
	,old_postal_code                    TEXT        NULL
	,new_postal_code                    TEXT        NULL
	,old_postal_extension_code          TEXT        NULL
	,new_postal_extension_code          TEXT        NULL
	,old_city                           TEXT        NULL
	,new_city                           TEXT        NULL
	,old_state_prov_cd                  TEXT        NULL
	,new_state_prov_cd                  TEXT        NULL
	,old_work_phone_number              TEXT        NULL
	,new_work_phone_number              TEXT        NULL
	,old_home_phone_number              TEXT        NULL
	,new_home_phone_number              TEXT        NULL
	,old_dept                           TEXT        NULL
	,new_dept                           TEXT        NULL
	,old_hired_dt                       TEXT        NULL
	,new_hired_dt                       TEXT        NULL
	,old_next_review_dt                 TEXT        NULL
	,new_next_review_dt                 TEXT        NULL
	,old_termination_dt                 TEXT        NULL
	,new_termination_dt                 TEXT        NULL
	,old_annual_salary_amt              TEXT        NULL
	,new_annual_salary_amt              TEXT        NULL
	,old_division_id                    TEXT        NULL
	,new_division_id                    TEXT        NULL
	,old_tax_id                         TEXT        NULL
	,new_tax_id                         TEXT        NULL
	,old_emergency_phone_number         TEXT        NULL
	,new_emergency_phone_number         TEXT        NULL
	,old_title                          TEXT        NULL
	,new_title                          TEXT        NULL
	,old_birth_dt                       TEXT        NULL
	,new_birth_dt                       TEXT        NULL
	,old_skip_flag                      TEXT        NULL
	,new_skip_flag                      TEXT        NULL
	,old_display_only                   TEXT        NULL
	,new_display_only                   TEXT        NULL
	,old_date_off                       TEXT        NULL
	,new_date_off                       TEXT        NULL
	,old_date_off_remark                TEXT        NULL
	,new_date_off_remark                TEXT        NULL
	,old_fax_number                     TEXT        NULL
	,new_fax_number                     TEXT        NULL
	,old_super_user_id                  TEXT        NULL
	,new_super_user_id                  TEXT        NULL
	,old_agency_cd                      TEXT        NULL
	,new_agency_cd                      TEXT        NULL
	,old_email_addr                     TEXT        NULL
	,new_email_addr                     TEXT        NULL
	,old_role                           TEXT        NULL
	,new_role                           TEXT        NULL
	,old_national_producer_number       TEXT        NULL
	,new_national_producer_number       TEXT        NULL
	,old_service_account                TEXT        NULL
	,new_service_account                TEXT        NULL
	,old_integration_staff_name         TEXT        NULL
	,new_integration_staff_name         TEXT        NULL
	,old_integration_staff_title        TEXT        NULL
	,new_integration_staff_title        TEXT        NULL
	,old_mobile_phone                   TEXT        NULL
	,new_mobile_phone                   TEXT        NULL
	,audit_action 	                    char(1) 	NOT NULL 
	,audit_user 	                    TEXT 	    NOT NULL 	DEFAULT current_user
	,audit_timestamp 	                timestamp 	NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 	                        bigint 	    NOT NULL 	GENERATED ALWAYS AS IDENTITY 	PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.audit_staff OWNER TO mj_admin;
GO 

GRANT INSERT ON TABLE sagitta.audit_staff TO rl_sagitta_a;
GO 
create table sagitta.audit_chart_of_accounts_master (
     sagitem 	                        		    text 	    	not null 
	,old_audit_staff_cd 							text 			null 
    ,new_audit_staff_cd 							text 			null 
	,old_audit_entry_dt 							int 			null 
    ,new_audit_entry_dt 							int 			null 
	,old_audit_time 								int 			null 
    ,new_audit_time 								int 			null 
	,old_audit_cd 									text 			null 
    ,new_audit_cd 									text 			null 
	,old_audit_history_record_number 				text 			null 
    ,new_audit_history_record_number 				text 			null 
	,old_audit_program 								text 			null 
    ,new_audit_program 								text 			null 
	,old_audit_effective_dt 						text 			null 
    ,new_audit_effective_dt 						text 			null 
	,old_audit_change_agency_id 					text 			null 
    ,new_audit_change_agency_id 					text 			null 
    ,old_description                                text            null 
    ,new_description                                text            null 
    ,old_normal_balance_amt                         text            null 
    ,new_normal_balance_amt                         text            null 
    ,old_ledger_type_cd                             text            null 
    ,new_ledger_type_cd                             text            null 
    ,old_period_end_dt                              text            null 
    ,new_period_end_dt                              text            null 
    ,old_close_to_account                           text            null 
    ,new_close_to_account                           text            null 
    ,old_report_cd                                  text            null 
    ,new_report_cd                                  text            null 
    ,old_base_pct                                   text            null 
    ,new_base_pct                                   text            null 
    ,old_allocated_by                               text            null 
    ,new_allocated_by                               text            null 
    ,old_gl_account_number                          text            null 
    ,new_gl_account_number                          text            null 
    ,audit_action                                   char(1)         not null 
    ,audit_user                                     text            not null            default current_user 
    ,audit_timestamp                                timestamp       not null            default timezone('utc'::text, clock_timestamp())
    ,audit_id                                       bigint          not null            generated always as identity            primary key 
);
go 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.audit_chart_of_accounts_master OWNER TO mj_admin;
GO 

GRANT INSERT ON TABLE sagitta.audit_chart_of_accounts_master TO rl_sagitta_a;
GO 

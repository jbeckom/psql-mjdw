create table sagitta.audit_wc_coverages(
     sagitem                                	int             not null 
    ,old_audit_staff_cd                         text            null 
    ,new_audit_staff_cd                         text            null 
    ,old_audit_entry_dt                         int 			null 
    ,new_audit_entry_dt                         int 			null 
    ,old_audit_time                             int 			null 
    ,new_audit_time                             int 			null 
    ,old_audit_cd                               text            null 
    ,new_audit_cd                               text            null 
    ,old_audit_history_record_number            text            null 
    ,new_audit_history_record_number            text            null 
    ,old_audit_program                          text            null 
    ,new_audit_program                          text            null 
    ,old_audit_effective_dt                     text            null 
    ,new_audit_effective_dt                     text            null 
    ,old_audit_change_agency_id                 text            null 
    ,new_audit_change_agency_id                 text            null 
    ,old_policy_agency_id                       text            null 
    ,new_policy_agency_id                       text            null 
    ,old_empl_liab_acc_limit                    text            null 
    ,new_empl_liab_acc_limit                    text            null 
    ,old_disease_per_empl_limit                 text            null 
    ,new_disease_per_empl_limit                 text            null 
    ,old_disease_policy_limit                   text            null 
    ,new_disease_policy_limit                   text            null 
    ,old_empl_liab_premium_amt                  text            null 
    ,new_empl_liab_premium_amt                  text            null 
    ,old_uslh_ind                               text            null 
    ,new_uslh_ind                               text            null 
    ,old_uslh_premium_amt                       text            null 
    ,new_uslh_premium_amt                       text            null 
    ,old_voluntary_comp_ind                     text            null 
    ,new_voluntary_comp_ind                     text            null 
    ,old_voluntary_comp_premium_amt             text            null 
    ,new_voluntary_comp_premium_amt             text            null 
    ,old_other_states_ind                       text            null 
    ,new_other_states_ind                       text            null 
    ,old_other_states_premium_amt               text            null 
    ,new_other_states_premium_amt               text            null 
    ,old_excluded_states                        text            null 
    ,new_excluded_states                        text            null 
    ,old_included_states                        text            null 
    ,new_included_states                        text            null 
    ,old_off_dt                                 text            null 
    ,new_off_dt                                 text            null 
    ,old_rate                                   text            null 
    ,new_rate                                   text            null 
    ,old_statutory_limits_apply                 text            null 
    ,new_statutory_limits_apply                 text            null 
    ,audit_action                               char(1)         not null 
    ,audit_user                                 text            not null            default current_user 
    ,audit_timestamp                            timestamp       not null            default timezone('utc'::text, clock_timestamp())
    ,audit_id                                   bigint          not null            generated always as identity            primary key 
);
go 

/*** PERMISSIONS ***/
alter table sagitta.audit_wc_coverages owner to mj_admin;
go

grant insert on sagitta.audit_wc_coverages to rl_sagitta_a;
go 
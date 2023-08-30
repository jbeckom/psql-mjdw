create table sagitta.audit_payees_cov_ins_percent_info(
     sagitem                            text            not null 
    ,lis                                int             not null 
    ,old_coverage_cd                    text            null 
    ,new_coverage_cd                    text            null 
    ,old_agency_new_pct                 text            null 
    ,new_agency_new_pct                 text            null 
    ,old_db_new_pct                     text            null 
    ,new_db_new_pct                     text            null 
    ,old_agency_ren_pct                 text            null 
    ,new_agency_ren_pct                 text            null 
    ,old_db_ren_pct                     text            null 
    ,new_db_ren_pct                     text            null 
    ,old_begin_dt                       text            null 
    ,new_begin_dt                       text            null 
    ,old_end_dt                         text            null 
    ,new_end_dt                         text            null 
    ,old_standard_comm_ind              text            null 
    ,new_standard_comm_ind              text            null 
    ,old_insurer_cd                     text            null 
    ,new_insurer_cd                     text            null 
    ,old_grading_from_amt               text            null 
    ,new_grading_from_amt               text            null 
    ,old_grading_to_amt                 text            null 
    ,new_grading_to_amt                 text            null 
    ,old_commission_type_ind            text            null 
    ,new_commission_type_ind            text            null 
    ,old_comm_div                       text            null 
    ,new_comm_div                       text            null 
    ,old_comm_dept                      text            null 
    ,new_comm_dept                      text            null 
    ,audit_action                       char(1)         not null 
    ,audit_user                         text            not null            default current_user 
    ,audit_timestamp                    timestamp       not null            default timezone('utc'::text, clock_timestamp())
    ,audit_id                           bigint          not null            generated always as identity            primary key 
);
go 

/*** PERMISSIONS ***/
alter table sagitta.audit_payees_cov_ins_percent_info owner to mj_admin;
go 

grant insert on sagitta.audit_payees_cov_ins_percent_info to rl_sagitta_a;
go 

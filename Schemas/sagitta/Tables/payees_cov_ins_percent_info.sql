create table sagitta.payees_cov_ins_percent_info(
     sagitem                        text            not null 
    ,lis                            int             not null 
    ,coverage_cd                    text            null 
    ,agency_new_pct                 text            null 
    ,db_new_pct                     text            null 
    ,agency_ren_pct                 text            null 
    ,db_ren_pct                     text            null 
    ,begin_dt                       text            null 
    ,end_dt                         text            null 
    ,standard_comm_ind              text            null 
    ,insurer_cd                     text            null 
    ,grading_from_amt               text            null 
    ,grading_to_amt                 text            null 
    ,commission_type_ind            text            null 
    ,comm_div                       text            null 
    ,comm_dept                      text            null 
    ,constraint payees_cov_ins_percent_info_pkey    primary key (sagitem,lis)
);
go 

/*** PERMISSIONS ***/
alter table sagitta.payees_cov_ins_percent_info owner to mj_admin;
go 

grant select on sagitta.payees_cov_ins_percent_info to rl_sagitta_r;
go 

grant insert on sagitta.payees_cov_ins_percent_info to rl_sagitta_a;
go 

grant update on sagitta.payees_cov_ins_percent_info to rl_sagitta_w;
go 

/*** TRIGGERS ***/
create trigger audit_d after delete on sagitta.payees_cov_ins_percent_info for each row execute function sagitta.tr_audit_payees_cov_ins_percent_info_d();
go 

create trigger audit_i after insert on sagitta.payees_cov_ins_percent_info for each row execute function sagitta.tr_audit_payees_cov_ins_percent_info_i();
go 

create trigger audit_u after update on sagitta.payees_cov_ins_percent_info for each row when (old is distinct from new) execute function sagitta.tr_audit_payees_cov_ins_percent_info_u();
go 
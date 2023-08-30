create table sagitta.ol_coverages (
     sagitem                                int             not null 
    ,audit_staff_cd                         text            null 
    ,audit_entry_dt                         int             null 
    ,audit_time                             int             null 
    ,audit_cd                               text            null 
    ,audit_history_record_number            text            null 
    ,audit_program                          text            null 
    ,audit_effective_dt                     text            null 
    ,audit_change_agency_id                 text            null 
    ,policy_agency_id                       text            null 
    ,lob_cd                                 text            null 
    ,lob_desc                               text            null 
    ,rating_basis                           text            null 
    ,valuation_code_1                       text            null 
    ,valuation_code_2                       text            null 
    ,cause_of_loss                          text            null 
    ,cov_effective_date                     text            null 
    ,cov_expiration_date                    text            null 
    ,number_of_1_desc                       text            null 
    ,number_of_2                            text            null 
    ,number_of_2_desc                       text            null 
    ,off_dt                                 text            null 
    ,constraint ol_coverages_pkey   primary key (sagitem)
);
go 

/*** PERMISSIONS ***/
alter table sagitta.ol_coverages owner to mj_admin;
go 

grant select on sagitta.ol_coverages to rl_sagitta_r;
go 

grant insert on sagitta.ol_coverages to rl_sagitta_a;
go 

grant update on sagitta.ol_coverages to rl_sagitta_w;
go 

/*** TRIGGERS ***/
create trigger audit_d after delete on sagitta.ol_coverages for each row execute function sagitta.tr_audit_ol_coverages_d();
go 

create trigger audit_i after insert on sagitta.ol_coverages for each row execute function sagitta.tr_audit_ol_coverages_i();
go 

create trigger audit_u after update on sagitta.ol_coverages for each row when (old is distinct from new) execute function sagitta.tr_audit_ol_coverages_u();
go 

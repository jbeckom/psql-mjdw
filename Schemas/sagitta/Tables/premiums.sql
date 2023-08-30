drop table if exists sagitta.premiums; 
go 

create table if not exists sagitta.premiums (
     sagitem                                int             not null 
    ,audit_staff_cd                         text            null 
    ,audit_entry_dt                         int            	null 
    ,audit_time_ind                         int             null 
    ,audit_cd                               text            null 
    ,audit_history_record_number            text            null 
    ,audit_program                          text            null 
    ,audit_effective_dt                     text            null 
    ,audit_change_agency_id                 text            null 
    ,policy_agency_id                       text            null 
    ,installment_plan                       text            null 
    ,day                                    text            null 
    ,deposit_amt                            text            null 
    ,down                                   text            null 
    ,fee_amt                                text            null 
    ,fee_pct                                text            null 
    ,payment_plan_remark_text               text            null 
    ,utm_id                                 text            null 
    ,payables_id                            text            null 
    ,not_posted                             text            null 
    ,purge_dt                               text            null 
    ,invoice_new_ren                        text            null 
    ,id                                     bigint          not null            generated always as identity            primary key 
    ,constraint premiums_sagitem_uq unique (sagitem)
);
go 

/*** PERMISSIONS ***/
alter table sagitta.premiums owner to mj_admin;
go 

grant select on sagitta.premiums to rl_sagitta_r;
go 

grant insert on sagitta.premiums to rl_sagitta_a;
go 

grant update on sagitta.premiums to rl_sagitta_w;
go 

/*** TRIGGERS ***/
create trigger log_change_iud after insert or update or delete on sagitta.premiums for each row execute function audit.tr_sagitta_log_change();
go 
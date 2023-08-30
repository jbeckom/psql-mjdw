drop table if exists sagitta.ledger_type_codes;
go 

create table if not exists sagitta.ledger_type_codes (
     sagitem                                text            not null 
    ,description                            text            null 
    ,audit_staff_cd                         text            null 
    ,audit_entry_dt                         int             null 
    ,audit_time                             int             null 
    ,audit_cd                               text            null 
    ,audit_history_record_number            text            null 
    ,audit_program                          text            null 
    ,id                                     bigint          not null            generated always as identity            primary key 
    ,constraint ledger_type_codes_sagitem_uq    unique (sagitem)
);
go 

/*** PERMISSIONS ***/
alter table sagitta.ledger_type_codes owner to mj_admin;
go 

grant select on sagitta.ledger_type_codes to rl_sagitta_r;
go 

grant insert on sagitta.ledger_type_codes to rl_sagitta_a;
go 

grant update on sagitta.ledger_type_codes to rl_sagitta_w;
go 

/*** TRIGGERS ***/
create trigger log_change_iud after insert or update or delete on sagitta.ledger_type_codes for each row execute function audit.tr_sagitta_log_change();
go 

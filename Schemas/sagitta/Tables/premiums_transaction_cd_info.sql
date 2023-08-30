drop table if exists sagitta.premiums_transaction_cd_info;
go 

create table if not exists sagitta.premiums_transaction_cd_info(
     sagitem                                int             not null 
    ,lis                                    int             not null 
    ,transaction_cd                         text            null 
    ,transaction_effective_dt               text            null 
    ,transaction_entry_dt                   text            null 
    ,transaction_amt                        text            null 
    ,agency_pct                             text            null 
    ,agency_amt                             text            null 
    ,producer_cd                            text            null 
    ,producer_pct                           text            null 
    ,producer_amt                           text            null 
    ,annualize_dt                           text            null 
    ,invoice_number                         text            null 
    ,sales_id                               text            null 
    ,ar_id                                  text            null 
    ,previous_posted_ind                    text            null 
    ,staff_cd                               text            null 
    ,department_cd                          text            null 
    ,bill_to_cd                             text            null 
    ,payee_cd                               text            null 
    ,coverage_cd                            text            null 
    ,insurer_cd                             text            null 
    ,id                                     bigint          not null            generated always as identity            primary key 
    ,constraint premiums_transaction_cd_info_sagitem_lis_uq     unique (sagitem,lis)
);
go 

/*** PERMISSIONS ***/
alter table sagitta.premiums_transaction_cd_info owner to mj_admin;
go 

grant select on sagitta.premiums_transaction_cd_info to rl_sagitta_r;
go 

grant insert on sagitta.premiums_transaction_cd_info to rl_sagitta_a;
go 

grant update on sagitta.premiums_transaction_cd_info to rl_sagitta_w;
go 

/*** TRIGGERS ***/
create trigger log_change_iud after insert or update or delete on sagitta.premiums_transaction_cd_info for each row execute function audit.tr_sagitta_log_change();
go 
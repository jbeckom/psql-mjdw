create table sagitta.payees (
     sagitem                                text            not null 
    ,audit_staff_cd                         text            null 
    ,audit_entry_dt                         int             null 
    ,audit_time                             int             null 
    ,audit_cd                               text            null 
    ,audit_history_record_number            text            null 
    ,audit_program                          text            null 
    ,audit_effective_dt                     text            null 
    ,payee_name                             text            null 
    ,initial_dt                             text            null 
    ,contact_name                           text            null 
    ,addr_1                                 text            null 
    ,addr_2                                 text            null 
    ,postal_code                            text            null 
    ,postal_extension_code                  text            null 
    ,city                                   text            null 
    ,state_prov_cd                          text            null 
    ,phone_1_number                         text            null 
    ,phone_2_number                         text            null 
    ,agency_cd                              text            null 
    ,pay_method_cd                          text            null 
    ,num_days                               text            null 
    ,fax_number                             text            null 
    ,phone_1_extention_number               text            null 
    ,phone_2_extention_number               text            null 
    ,off_dt                                 text            null 
    ,direct_bill_ind                        text            null 
    ,release_ind                            text            null 
    ,email_addr                             text            null 
    ,description                            text            null 
    ,mga                                    text            null 
    ,global                                 text            null 
    ,payee_responsible_for_filing           text            null 
    ,tax_fee_payee                          text            null 
    ,constraint payees_pkey     primary key (sagitem)
);
go 

/*** PERMISSIONS ***/
alter table sagitta.payees owner to mj_admin;
go 

grant select on sagitta.payees to rl_sagitta_r;
go 

grant insert on sagitta.payees to rl_sagitta_a;
go 

grant update on sagitta.payees to rl_sagitta_w;
go 

/*** TRIGGERS ***/
create trigger audit_d after delete on sagitta.payees for each row execute function sagitta.tr_audit_payees_d();
go 

create trigger audit_i after insert on sagitta.payees for each row execute function sagitta.tr_audit_payees_i();
go 

create trigger audit_u after update on sagitta.payees for each row when (old is distinct from new) execute function sagitta.tr_audit_payees_u();
go 
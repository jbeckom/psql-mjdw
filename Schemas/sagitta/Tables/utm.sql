create table sagitta.utm (
     sagitem                    int             not null 
    ,source_code                text            null 
    ,posting_date               int             null 
    ,period_end_date            int             null 
    ,gl_acct_no                 text            null 
    ,debit_amount               text            null 
    ,credit_amount              text            null 
    ,div                        text            null 
    ,document_ref               text            null 
    ,vendor_code                text            null 
    ,client_code                text            null 
    ,transfer_journal           text            null 
    ,transfer_date              text            null 
    ,audit_info                 text            null 
    ,tracking_client            text            null 
    ,ins                        text            null 
    ,tracking_vendor            text            null 
    ,emp                        text            null 
    ,program                    text            null 
    ,constraint utm_pkey    primary key (sagitem)
);
go 

/*** PERMISSIONS ***/
alter table sagitta.utm owner to mj_admin;
go 

grant select on sagitta.utm to rl_sagitta_r;
go 

grant insert on sagitta.utm to rl_sagitta_a;
go 
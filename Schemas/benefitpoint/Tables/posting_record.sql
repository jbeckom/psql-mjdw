create table benefitpoint.posting_record (
     posting_record_id                  int                         not null 
    ,statement_id                       int                         null 
    ,effective_as_of                    timestamp                   null 
    ,posted_on                          timestamp                   null 
    ,posted_amount                      double precision            null 
    ,voided_record                      bool                        null 
    ,voided_posting_record_id           int                         null 
    ,split_column_type                  text                        null 
    ,split_basis_type                   text                        null 
    ,accept_tolerance                   bool                        null 
    ,statement_split                    bool                        null 
    ,statement_entry_id                 bigint                      null 
    ,accounting_month 					date 						NULL 
    ,constraint posting_record_pkey     primary key (posting_record_id)
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.posting_record owner to mj_admin;
go 

grant select on benefitpoint.posting_record to rl_benefitpoint_r;
go 

grant insert on benefitpoint.posting_record to rl_benefitpoint_a;
go 
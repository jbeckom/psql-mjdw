create table benefitpoint.statement_entry (
     statement_id                       int                 not null 
    ,statement_entry_id                 bigint              not null 
    ,product_id                         int                 not null 
    ,activity_log_record_id             int                 null 
    ,statement_split_id                 int                 null 
    ,revenue_amount                     decimal             null 
    ,premium_amount                     decimal             null 
    ,apply_to_date                      timestamp           null 
    ,posted                             bool                null 
    ,num_of_lives                       bigint              null 
    ,split_column_type                  text                null 
    ,override                           bool                null 
    ,sagitta_transaction_code           text                null 
    ,constraint statement_entry_pkey    primary key (statement_id, statement_entry_id)
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.statement_entry owner to mj_admin;
go 

grant select on benefitpoint.statement_entry to rl_benefitpoint_r;
go 

grant insert on benefitpoint.statement_entry to rl_benefitpoint_a;
go 
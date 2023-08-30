create table benefitpoint.audit_statement_entry (
     posting_record_id                  int                 not null 
    ,statement_entry_id                 int                 not null 
    ,old_product_id                         int                 null 
    ,new_product_id                         int                 null 
    ,old_activity_log_record_id             int                 null 
    ,new_activity_log_record_id             int                 null 
    ,old_statement_split_id                 int                 null 
    ,new_statement_split_id                 int                 null 
    ,old_revenue_amount                     decimal             null 
    ,new_revenue_amount                     decimal             null 
    ,old_premium_amount                     decimal             null 
    ,new_premium_amount                     decimal             null 
    ,old_apply_to_date                      timestamp           null 
    ,new_apply_to_date                      timestamp           null 
    ,old_posted                             bool                null 
    ,new_posted                             bool                null 
    ,old_num_of_lives                       bigint              null 
    ,new_num_of_lives                       bigint              null 
    ,old_split_column_type                  text                null 
    ,new_split_column_type                  text                null 
    ,old_override                           bool                null 
    ,new_override                           bool                null 
    ,old_sagitta_transaction_code           text                null 
    ,new_sagitta_transaction_code           text                null 
    ,audit_action                           char(1)             not null 
    ,audit_user                             text                not null            default current_user 
    ,audit_timestamp                        timestamp           not null            default timezone('utc'::text,clock_timestamp()) 
    ,audit_id                               bigint              not null            generated always as identity            primary key 
);
go


/*** PERMISSIONS ***/
alter table benefitpoint.audit_statement_entry owner to mj_admin;
go 

grant insert on benefitpoint.audit_statement_entry to rl_benefitpoint_a;
go 
create table benefitpoint.statement (
     statement_id                   int                 not null 
    ,billing_carrier_id             int                 null 
    ,ams360_gl_date                 timestamp           null 
    ,statement_status               text                null 
    ,statement_total                decimal             null 
    ,payement_method                text                null 
    ,entry_date                     timestamp           null 
    ,statement_date                 timestamp           null 
    ,accounting_month               date                null 
    ,office_id                      int                 null 
    ,notes                          text                null 
    ,override_only                  bool                null 
    ,override_payee_id              int                 null 
    ,range_start_on                 timestamp           null 
    ,range_end_on                   timestamp           null 
    ,use_estimated_premium          bool                null 
    ,last_posted_on                 timestamp           null 
    ,voided_on                      timestamp           null 
    ,created_by_user_id             int                 null 
    ,last_modified_on               timestamp           null 
    ,constraint statement_pkey  primary key (statement_id)
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.statement owner to mj_admin;
go 

grant select on benefitpoint.statement to rl_benefitpoint_r;
go 

grant insert on benefitpoint.statement to rl_benefitpoint_a;
go 
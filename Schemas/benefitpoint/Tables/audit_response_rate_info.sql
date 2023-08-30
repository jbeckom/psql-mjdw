create table benefitpoint.audit_response_rate_info (
     rate_id                        int                 not null 
    ,rate_version                   int                 not null 
    ,rate_version_reasons           text                null 
    ,parent_rate_id                 int                 null 
    ,selected                       bool                null 
    ,created_by_broker              bool                null 
    ,quote_valid_through            timestamp           null 
    ,audit_action                   char(1)             not null 
    ,audit_user                     text                not null            default current_user 
    ,audit_timestamp                timestamp           not null            default timezone('utc'::text, clock_timestamp()) 
    ,audit_id                       bigint              not null            generated always as identity 
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.audit_response_rate_info owner to mj_admin;
go 

grant insert on benefitpoint.audit_response_rate_info to rl_benefitpoint_a;
go 

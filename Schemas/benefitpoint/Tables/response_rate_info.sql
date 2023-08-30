create table benefitpoint.response_rate_info (
     rate_id                        int                 not null 
    ,rate_version                   int                 not null 
    ,rate_version_reasons           text                null 
    ,parent_rate_id                 int                 null 
    ,selected                       bool                null 
    ,created_by_broker              bool                null 
    ,quote_valid_through            timestamp           null 
    ,constraint response_rate_info_pkey     primary key (rate_id, rate_version)
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.response_rate_info owner to mj_admin;
go 

grant select on benefitpoint.response_rate_info to rl_benefitpoint_r;
go 

grant insert on benefitpoint.response_rate_info to rl_benefitpoint_a;
go 

grant update on benefitpoint.response_rate_info to rl_benefitpoint_w;
go 

/*** TRIGGERS ***/
create trigger audit_d after delete on benefitpoint.response_rate_info for each row execute function benefitpoint.tr_audit_response_rate_info_d();
go 

create trigger audit_i after insert on benefitpoint.response_rate_info for each row execute function benefitpoint.tr_audit_response_rate_info_i();
go 

create trigger audit_u after update on benefitpoint.response_rate_info for each row when (old is distinct from new) execute function benefitpoint.tr_audit_response_rate_info_u();
go 
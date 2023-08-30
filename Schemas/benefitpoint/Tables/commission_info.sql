create table benefitpoint.commission_info (
     product_id                         int                 not null 
    ,account_id                         int                 not null 
    ,alternative_policy_number          text                null 
    ,new_business_until                 timestamp           null 
    ,commission_start_on                timestamp           null 
    ,notes                              text                null 
    ,constraint commission_info_pkey    primary key (product_id, account_id)
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.commission_info owner to mj_admin;
go 

grant select on benefitpoint.commission_info to rl_benefitpoint_r;
go 

grant insert on benefitpoint.commission_info to rl_benefitpoint_a;
go 

grant update on benefitpoint.commission_info to rl_benefitpoint_w;
go 

/*** TRIGGERS ***/
create trigger audit_d after delete on benefitpoint.commission_info for each row execute function benefitpoint.tr_audit_commission_info_d();
go 

create trigger audit_i after insert on benefitpoint.commission_info for each row execute function benefitpoint.tr_audit_commission_info_i();
go 

create trigger audit_u after update on benefitpoint.commission_info for each row when (old is distinct from new) execute function benefitpoint.tr_audit_commission_info_u();
go
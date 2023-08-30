create table benefitpoint.policy_integration_info (
     product_id                 int             not null 
    ,account_id                 int             not null 
    ,sagitta_policy_id          text            null 
    ,ams_policy_id              text            null 
    ,tam_policy_id              text            null 
    ,vision_policy_id           text            null 
    ,constraint policy_integration_info_pkey    primary key (product_id, account_id)
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.policy_integration_info owner to mj_admin;
go 

grant select on benefitpoint.policy_integration_info to rl_benefitpoint_r;
go 

grant insert on benefitpoint.policy_integration_info to rl_benefitpoint_a;
go 

grant update on benefitpoint.policy_integration_info to rl_benefitpoint_w;
go 

/*** TRIGGERS ***/
create trigger audit_d after delete on benefitpoint.policy_integration_info for each row execute function benefitpoint.tr_audit_policy_integration_info_d();
go 

create trigger audit_i after insert on benefitpoint.policy_integration_info for each row execute function benefitpoint.tr_audit_policy_integration_info_i();
go 

create trigger audit_u after update on benefitpoint.policy_integration_info for each row when (old is distinct from new) execute function benefitpoint.tr_audit_policy_integration_info_u();
go 
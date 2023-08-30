create table benefitpoint.plan_info (
     product_id                                 int                 not null 
    ,account_id                                 int                 not null 
    ,alternative_plan_id                        text                null 
    ,erisa_plan                                 text                null 
    ,erisa_plan_year_end_month                  int                 null 
    ,erisa_plan_year_end_day                    int                 null 
    ,notes                                      text                null 
    ,frozen_enrollment                          bool                null 
    ,requires_5500                              bool                null 
    ,frozen_enrollment_effective_as_of          timestamp           null 
    ,market_size                                text                null 
    ,maxiumum_group_size                        int                 null 
    ,minimum_group_size                         int                 null 
    ,exclusions_limitations                     text                null 
    ,customizations                             text                null 
    ,participation_requirements                 text                null 
    ,participation_requirements_vol             text                null 
    ,state_list                                 text                null 
    ,market_group_plan_id                       int                 null 
    ,constraint plan_info_pkey  primary key (product_id, account_id)
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.plan_info owner to mj_admin;
go 

grant select on benefitpoint.plan_info to rl_benefitpoint_r;
go 

grant insert on benefitpoint.plan_info to rl_benefitpoint_a;
go 

grant update on benefitpoint.plan_info to rl_benefitpoint_w;
go 

/*** TRIGGERS ***/
create trigger audit_d after delete on benefitpoint.plan_info for each row execute function benefitpoint.tr_audit_plan_info_d();
go 

create trigger audit_i after insert on benefitpoint.plan_info for each row execute function benefitpoint.tr_audit_plan_info_i();
go 

create trigger audit_u after update on benefitpoint.plan_info for each row when (old is distinct from new) execute function benefitpoint.tr_audit_plan_info_u();
go 
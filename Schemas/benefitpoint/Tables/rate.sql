create table benefitpoint.rate (
     rate_id                                int                         not null 
    ,product_id                             int                         not null 
    ,response_id                            int                         null 
    ,description                            text                        null 
    ,rate_type_id                          int                         null 
    ,rate_type_tier_id                      int                         null 
    ,effective_as_of                        timestamp                   null 
    ,expiration_on                          timestamp                   null 
    ,include_ee                             bool                        null 
    ,age_banded                             bool                        null 
    ,age_banded_start_on                    int                         null 
    ,age_banded_end_on                      int                         null 
    ,age_banded_interval                    int                         null 
    ,age_banded_gender_specific             bool                        null 
    ,rating_method                          text                        null 
    ,estimated_monthly_premium              double precision            null 
    ,estimated_monthly_revenue              double precision            null 
    ,additional_info                        text                        null 
    ,rate_guarantee                         int                         null 
    ,rate_guarantee_uom                     text                        null 
    ,number_of_lives_as_of                  timestamp                   null 
    ,payment_cycle                          int                         null 
    ,renewal_percentage_change              double precision            null 
    ,last_modified_on                       timestamp                   null 
    ,created_on                             timestamp                   null 
    ,constraint rate_pkey   primary key (rate_id, product_id)
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.rate owner to mj_admin;
go 

grant select on benefitpoint.rate to rl_benefitpoint_r;
go 

grant insert on benefitpoint.rate to rl_benefitpoint_a;
go 

grant update on benefitpoint.rate to rl_benefitpoint_w;
go 

/*** TRIGGERS ***/
create trigger audit_d after delete on benefitpoint.rate for each row execute function benefitpoint.tr_audit_rate_d();
go 

create trigger audit_i after insert on benefitpoint.rate for each row execute function benefitpoint.tr_audit_rate_i();
go 

create trigger audit_u after update on benefitpoint.rate for each row when (old is distinct from new) execute function benefitpoint.tr_audit_rate_u();
go 
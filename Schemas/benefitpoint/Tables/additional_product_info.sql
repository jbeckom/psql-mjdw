create table benefitpoint.additional_product_info(
     product_id                         int                         not null 
    ,account_id                         int                         not null 
    ,estimated_commission               double precision            null 
    ,commission_period_type             text                        null 
    ,notes                              text                        null 
    ,requires_5500                      bool                        null 
    ,erisa_plan                         text                        null 
    ,erisa_plan_year_end_month          int                         null 
    ,erisa_plan_year_end_day            int                         null 
    ,alternative_plan_id                int                         null 
    ,constraint additional_product_info_pkey    primary key (product_id, account_id)
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.additional_product_info owner to mj_admin;
go 

grant select on benefitpoint.additional_product_info to rl_benefitpoint_r;
go 

grant insert on benefitpoint.additional_product_info to rl_benefitpoint_a;
go 

grant update on benefitpoint.additional_product_info to rl_benefitpoint_w;
go 

/*** TRIGGERS ***/
create trigger audit_d after delete on benefitpoint.additional_product_info for each row execute function benefitpoint.tr_audit_additional_product_info_d();
go 

create trigger audit_i after insert on benefitpoint.additional_product_info for each row execute function benefitpoint.tr_audit_additional_product_info_i();
go 

create trigger audit_u after update on benefitpoint.additional_product_info for each row when (old is distinct from new) execute function benefitpoint.tr_audit_additional_product_info_u();
go 
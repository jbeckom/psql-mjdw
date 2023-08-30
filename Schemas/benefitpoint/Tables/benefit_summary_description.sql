create table benefitpoint.benefit_summary_description (
     rate_id                        int             not null 
    ,benefit_summary_id             int             not null 
    ,product_id                     int             null 
    ,description                    text            null 
    ,constraint benefit_summary_description_pkey    primary key (rate_id,benefit_summary_id)
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.benefit_summary_description owner to mj_admin;
go 

grant select on benefitpoint.benefit_summary_description to rl_benefitpoint_r;
go 

grant insert on benefitpoint.benefit_summary_description to rl_benefitpoint_a;
go 

grant update on benefitpoint.benefit_summary_description to rl_benefitpoint_w;
go 

/*** TRIGGERS ***/
create trigger audit_d after delete on benefitpoint.benefit_summary_description for each row execute function benefitpoint.tr_audit_benefit_summary_description_d();
go 

create trigger audit_i after insert on benefitpoint.benefit_summary_description for each row execute function benefitpoint.tr_audit_benefit_summary_description_i();
go 

create trigger audit_u after update on benefitpoint.benefit_summary_description for each row when (old is distinct from new) execute function benefitpoint.tr_audit_benefit_summary_description_u();
go 
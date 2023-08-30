create table benefitpoint.commission (
     rate_id                                int                         not null 
    ,commission_id                          int                         not null 
    ,commission_type                        text                        null 
    ,commission_paid_by                     text                        null 
    ,description                            text                        null 
    ,estimated_monthly_revenue              double precision            null 
    ,additional_info                        text                        null 
    ,flat_percentage_of_premium             double precision            null 
    ,premium_override_amount                double precision            null 
    ,estimated_number_of_members            int                         null 
    ,constraint commission_pkey     primary key (rate_id, commission_id) 
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.commission owner to mj_admin;
go 

grant select on benefitpoint.commission to rl_benefitpoint_r;
go 

grant insert on benefitpoint.commission to rl_benefitpoint_a;
go 

grant update on benefitpoint.commission to rl_benefitpoint_w;
go 

/*** TRIGGERS ***/
create trigger audit_d after delete on benefitpoint.commission for each row execute function benefitpoint.tr_audit_commission_d();
go 

create trigger audit_i after insert on benefitpoint.commission for each row execute function benefitpoint.tr_audit_commission_i();
go 

create trigger audit_u after update on benefitpoint.commission for each row when (old is distinct from new) execute function benefitpoint.tr_audit_commission_u();
go 
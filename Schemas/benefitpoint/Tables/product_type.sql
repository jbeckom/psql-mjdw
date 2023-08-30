create table benefitpoint.product_type (
     product_type_id            int             not null 
    ,short_description          text            null 
    ,long_description           text            null 
    ,line_of_coverage           text            null 
    ,rate_types                 text            null 
    ,constraint product_type_pkey   primary key (product_type_id)
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.product_type owner to mj_admin;
go 

grant select on benefitpoint.product_type to rl_benefitpoint_r;
go 

grant insert on benefitpoint.product_type to rl_benefitpoint_a;
go 

grant update on benefitpoint.product_type to rl_benefitpoint_w;
go 

/*** TRIGGERS ***/
create trigger audit_d after delete on benefitpoint.product_type for each row execute function benefitpoint.tr_audit_product_type_d();
go 

create trigger audit_i after insert on benefitpoint.product_type for each row execute function benefitpoint.tr_audit_product_type_i();
go 

create trigger audit_u after update on benefitpoint.product_type for each row when (old is distinct from new) execute function benefitpoint.tr_audit_product_type_u();
go 


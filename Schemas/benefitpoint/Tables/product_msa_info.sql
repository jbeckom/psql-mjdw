create table benefitpoint.product_msa_info(
     product_id             int             not null 
    ,account_id             int             not null 
    ,nation_wide            bool            null 
    ,msa_ids                text            null 
    ,constraint product_msa_info_pkey   primary key (product_id, account_id)
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.product_msa_info owner to mj_admin;
go 

grant select on benefitpoint.product_msa_info to rl_benefitpoint_r;
go 

grant insert on benefitpoint.product_msa_info to rl_benefitpoint_a;
go 

grant update on benefitpoint.product_msa_info to rl_benefitpoint_w;
go 

/*** TRIGGERS ***/
create trigger audit_d after delete on benefitpoint.product_msa_info for each row execute function benefitpoint.tr_audit_product_msa_info_d();
go 

create trigger audit_i after insert on benefitpoint.product_msa_info for each row execute function benefitpoint.tr_audit_product_msa_info_i();
go 

create trigger audit_u after update on benefitpoint.product_msa_info for each row when (old is distinct from new) execute function benefitpoint.tr_audit_product_msa_info_u();
go 

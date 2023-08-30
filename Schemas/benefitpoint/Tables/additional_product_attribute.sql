create table benefitpoint.additional_product_attribute (
     product_id                 int                         not null 
    ,account_id                 int                         not null 
    ,attribute_id               int                         not null 
    ,name                       text                        null 
    ,field_value_type           text                        null 
    ,value_num                  double precision            null 
    ,value_text                 text                        null 
    ,value_date                 timestamp                   null 
    ,option_value_id          int                         null 
    ,constraint additional_product_attribute_pkey   primary key (product_id, account_id, attribute_id)
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.additional_product_attribute owner to mj_admin;
go 

grant select on benefitpoint.additional_product_attribute to rl_benefitpoint_r;
go 

grant insert on benefitpoint.additional_product_attribute to rl_benefitpoint_a;
go 

grant update on benefitpoint.additional_product_attribute to rl_benefitpoint_w;
go 

/*** TRIGGERS ***/
create trigger audit_d after delete on benefitpoint.additional_product_attribute for each row execute function benefitpoint.tr_audit_additional_product_attribute_d();
go 

create trigger audit_i after insert on benefitpoint.additional_product_attribute for each row execute function benefitpoint.tr_audit_additional_product_attribute_i();
go 

create trigger audit_u after update on benefitpoint.additional_product_attribute for each row when (old is distinct from new) execute function benefitpoint.tr_audit_additional_product_attribute_u();
go 
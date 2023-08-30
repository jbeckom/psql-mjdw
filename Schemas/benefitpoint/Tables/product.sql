create table benefitpoint.product (
     product_id                                         int                         not null 
    ,account_id                                         int                         not null 
    ,product_type_id                                    int                         null 
    ,is_additional_product                              bool                        null 
    ,product_status                                     text                        null 
    ,name                                               text                        null 
    ,carrier_id                                         int                         null 
    ,broker_of_record_account_id                        int                         null 
    ,broker_of_record_as_of                             timestamp                   null 
    ,policy_number                                      text                        null 
    ,policy_origination_reason                          text                        null 
    ,policy_origination_reason_qualifier_id             text                        null 
    ,parent_product_id                                  int                         null 
    ,effective_as_of                                    timestamp                   null 
    ,renewal_on                                         timestamp                   null 
    ,continuous_policy                                  bool                        null 
    ,original_effective_as_of                           timestamp                   null 
    ,cancellation_on                                    timestamp                   null 
    ,cancellation_reason                                text                        null 
    ,cancellation_additional_information                text                        null 
    ,reinstatement_on                                   timestamp                   null 
    ,reinstatement_reason                               text                        null 
    ,reinstatement_additional_information               text                        null 
    ,voluntary_product                                  bool                        null 
    ,union_product                                      bool                        null 
    ,non_payable                                        bool                        null 
    ,non_revenue                                        bool                        null 
    ,premium_payment_frequency                          text                        null 
    ,number_of_eligible_employees                       int                         null 
    ,total_estimated_monthly_revenue                    double precision            null 
    ,total_estimated_monthly_premium                    double precision            null 
    ,billing_type                                       text                        null 
    ,billing_carrier_type                               text                        null 
    ,billing_carrier_id                                 int                         null 
    ,office_id                                          int                         null 
    ,department_id                                      int                         null 
    ,primary_sales_lead_user_id                         int                         null 
    ,primary_servicer_lead_user_id                      int                         null 
    ,last_modified_on                                   timestamp                   null 
    ,created_on                                         timestamp                   null 
    ,metal_level_type                                   text                        null 
    ,aca_safe_harbor_type                               text                        null 
    ,aca_sage_harbor_reporting_year                     int                         null 
    ,custom_cancellation_reason_id                      int                         null 
    ,constraint product_pkey    primary key (product_id,account_id)
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.product owner to mj_admin;
go 

grant select on benefitpoint.product to rl_benefitpoint_r;
go 

grant insert on benefitpoint.product to rl_benefitpoint_a;
go 

grant update on benefitpoint.product to rl_benefitpoint_w;
go 

/*** TRIGGERS ***/
create trigger audit_d after delete on benefitpoint.product for each row execute function benefitpoint.tr_audit_product_d();
go 

create trigger audit_i after insert on benefitpoint.product for each row execute function benefitpoint.tr_audit_product_i();
go 

create trigger audit_u after update on benefitpoint.product for each row when (old is distinct from new) execute function benefitpoint.tr_audit_product_u();
go

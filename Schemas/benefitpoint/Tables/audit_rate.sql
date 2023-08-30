create table benefitpoint.audit_rate (
     rate_id                                    int                         not null 
    ,product_id                                 int                         not null 
    ,old_response_id                            int                         null 
    ,new_response_id                            int                         null 
    ,old_description                            text                        null 
    ,new_description                            text                        null 
    ,old_rate_type_id                          int                         null 
    ,new_rate_type_id                          int                         null 
    ,old_rate_type_tier_id                      int                         null 
    ,new_rate_type_tier_id                      int                         null 
    ,old_effective_as_of                        timestamp                   null 
    ,new_effective_as_of                        timestamp                   null 
    ,old_expiration_on                          timestamp                   null 
    ,new_expiration_on                          timestamp                   null 
    ,old_include_ee                             bool                        null 
    ,new_include_ee                             bool                        null 
    ,old_age_banded                             bool                        null 
    ,new_age_banded                             bool                        null 
    ,old_age_banded_start_on                    int                         null 
    ,new_age_banded_start_on                    int                         null 
    ,old_age_banded_end_on                      int                         null 
    ,new_age_banded_end_on                      int                         null 
    ,old_age_banded_interval                    int                         null 
    ,new_age_banded_interval                    int                         null 
    ,old_age_banded_gender_specific             bool                        null 
    ,new_age_banded_gender_specific             bool                        null 
    ,old_rating_method                          text                        null 
    ,new_rating_method                          text                        null 
    ,old_estimated_monthly_premium              double precision            null 
    ,new_estimated_monthly_premium              double precision            null 
    ,old_estimated_monthly_revenue              double precision            null 
    ,new_estimated_monthly_revenue              double precision            null 
    ,old_additional_info                        text                        null 
    ,new_additional_info                        text                        null 
    ,old_rate_guarantee                         int                         null 
    ,new_rate_guarantee                         int                         null 
    ,old_rate_guarantee_uom                     text                        null 
    ,new_rate_guarantee_uom                     text                        null 
    ,old_number_of_lives_as_of                  timestamp                   null 
    ,new_number_of_lives_as_of                  timestamp                   null 
    ,old_payment_cycle                          int                         null 
    ,new_payment_cycle                          int                         null 
    ,old_renewal_percentage_change              double precision            null 
    ,new_renewal_percentage_change              double precision            null 
    ,old_last_modified_on                       timestamp                   null 
    ,new_last_modified_on                       timestamp                   null 
    ,old_created_on                             timestamp                   null 
    ,new_created_on                             timestamp                   null 
    ,audit_action                               char(1)                     not null 
    ,audit_user                                 text                        not null            default current_user 
    ,audit_timestamp                            timestamp                   not null            default timezone('utc'::text, clock_timestamp()) 
    ,audit_id                                   bigint                      not null            generated always as identity 
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.audit_rate owner to mj_admin;
go 

grant insert on benefitpoint.audit_rate to rl_benefitpoint_a;
go 

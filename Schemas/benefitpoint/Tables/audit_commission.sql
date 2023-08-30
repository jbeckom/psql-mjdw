create table benefitpoint.audit_commission (
     rate_id                                    int                         not null 
    ,commission_id                              int                         not null 
    ,old_commission_type                        text                        null 
    ,new_commission_type                        text                        null 
    ,old_commission_paid_by                     text                        null 
    ,new_commission_paid_by                     text                        null 
    ,old_description                            text                        null 
    ,new_description                            text                        null 
    ,old_estimated_monthly_revenue              double precision            null 
    ,new_estimated_monthly_revenue              double precision            null 
    ,old_additional_info                        text                        null 
    ,new_additional_info                        text                        null 
    ,old_flat_percentage_of_premium             double precision            null 
    ,new_flat_percentage_of_premium             double precision            null 
    ,old_premium_override_amount                double precision            null 
    ,new_premium_override_amount                double precision            null 
    ,old_estimated_number_of_members            int                         null 
    ,new_estimated_number_of_members            int                         null 
    ,audit_action                                                           char(1)                     not null 
    ,audit_user                                                             text                        not null            default current_user 
    ,audit_timestamp                                                        timestamp                   not null            default timezone('utc'::text, clock_timestamp()) 
    ,audit_id                                                               bigint                      not null            generated always as identity 
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.audit_commission owner to mj_admin;
go 

grant insert on benefitpoint.audit_commission to rl_benefitpoint_a;
go 

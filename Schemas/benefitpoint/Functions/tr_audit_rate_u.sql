create or replace function benefitpoint.tr_audit_rate_u() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_rate (
         rate_id 
        ,product_id 
        ,old_response_id 
        ,new_response_id 
        ,old_description 
        ,new_description 
        ,old_rate_type_id 
        ,new_rate_type_id 
        ,old_rate_type_tier_id 
        ,new_rate_type_tier_id 
        ,old_effective_as_of 
        ,new_effective_as_of 
        ,old_expiration_on 
        ,new_expiration_on 
        ,old_include_ee 
        ,new_include_ee 
        ,old_age_banded 
        ,new_age_banded 
        ,old_age_banded_start_on 
        ,new_age_banded_start_on 
        ,old_age_banded_end_on 
        ,new_age_banded_end_on 
        ,old_age_banded_interval 
        ,new_age_banded_interval 
        ,old_age_banded_gender_specific 
        ,new_age_banded_gender_specific 
        ,old_rating_method 
        ,new_rating_method 
        ,old_estimated_monthly_premium
        ,new_estimated_monthly_premium
        ,old_estimated_monthly_revenue
        ,new_estimated_monthly_revenue
        ,old_additional_info
        ,new_additional_info
        ,old_rate_guarantee
        ,new_rate_guarantee
        ,old_rate_guarantee_uom
        ,new_rate_guarantee_uom
        ,old_number_of_lives_as_of
        ,new_number_of_lives_as_of
        ,old_payment_cycle
        ,new_payment_cycle
        ,old_renewal_percentage_change
        ,new_renewal_percentage_change
        ,old_last_modified_on
        ,new_last_modified_on
        ,old_created_on
        ,new_created_on
        ,audit_action 
    )
    select   old.rate_id 
            ,old.product_id 
            ,old.response_id 
            ,new.response_id 
            ,old.description 
            ,new.description 
            ,old.rate_type_id 
            ,new.rate_type_id 
            ,old.rate_type_tier_id 
            ,new.rate_type_tier_id 
            ,old.effective_as_of 
            ,new.effective_as_of 
            ,old.expiration_on 
            ,new.expiration_on 
            ,old.include_ee 
            ,new.include_ee 
            ,old.age_banded 
            ,new.age_banded 
            ,old.age_banded_start_on 
            ,new.age_banded_start_on 
            ,old.age_banded_end_on 
            ,new.age_banded_end_on 
            ,old.age_banded_interval 
            ,new.age_banded_interval 
            ,old.age_banded_gender_specific 
            ,new.age_banded_gender_specific 
            ,old.rating_method 
            ,new.rating_method 
            ,old.estimated_monthly_premium
            ,new.estimated_monthly_premium
            ,old.estimated_monthly_revenue
            ,new.estimated_monthly_revenue
            ,old.additional_info
            ,new.additional_info
            ,old.rate_guarantee
            ,new.rate_guarantee
            ,old.rate_guarantee_uom
            ,new.rate_guarantee_uom
            ,old.number_of_lives_as_of
            ,new.number_of_lives_as_of
            ,old.payment_cycle
            ,new.payment_cycle
            ,old.renewal_percentage_change
            ,new.renewal_percentage_change
            ,old.last_modified_on
            ,new.last_modified_on
            ,old.created_on
            ,new.created_on
            ,'U';
    return old;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_rate_u() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_rate_u() to rl_benefitpoint_x;
go 
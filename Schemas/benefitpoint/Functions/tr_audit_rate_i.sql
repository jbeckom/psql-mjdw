create or replace function benefitpoint.tr_audit_rate_i() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_rate (
         rate_id 
        ,product_id 
        ,new_response_id 
        ,new_description 
        ,new_rate_type_id 
        ,new_rate_type_tier_id 
        ,new_effective_as_of 
        ,new_expiration_on 
        ,new_include_ee 
        ,new_age_banded 
        ,new_age_banded_start_on 
        ,new_age_banded_end_on 
        ,new_age_banded_interval 
        ,new_age_banded_gender_specific 
        ,new_rating_method 
        ,new_estimated_monthly_premium
        ,new_estimated_monthly_revenue
        ,new_additional_info
        ,new_rate_guarantee
        ,new_rate_guarantee_uom
        ,new_number_of_lives_as_of
        ,new_payment_cycle
        ,new_renewal_percentage_change
        ,new_last_modified_on
        ,new_created_on
        ,audit_action 
    )
    select   new.rate_id 
            ,new.product_id 
            ,new.response_id 
            ,new.description 
            ,new.rate_type_id 
            ,new.rate_type_tier_id 
            ,new.effective_as_of 
            ,new.expiration_on 
            ,new.include_ee 
            ,new.age_banded 
            ,new.age_banded_start_on 
            ,new.age_banded_end_on 
            ,new.age_banded_interval 
            ,new.age_banded_gender_specific 
            ,new.rating_method 
            ,new.estimated_monthly_premium
            ,new.estimated_monthly_revenue
            ,new.additional_info
            ,new.rate_guarantee
            ,new.rate_guarantee_uom
            ,new.number_of_lives_as_of
            ,new.payment_cycle
            ,new.renewal_percentage_change
            ,new.last_modified_on
            ,new.created_on
            ,'I';
    return new;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_rate_i() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_rate_i() to rl_benefitpoint_x;
go 
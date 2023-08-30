create or replace function benefitpoint.tr_audit_rate_d() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_rate (
         rate_id 
        ,product_id 
        ,old_response_id 
        ,old_description 
        ,old_rate_type_id 
        ,old_rate_type_tier_id 
        ,old_effective_as_of 
        ,old_expiration_on 
        ,old_include_ee 
        ,old_age_banded 
        ,old_age_banded_start_on 
        ,old_age_banded_end_on 
        ,old_age_banded_interval 
        ,old_age_banded_gender_specific 
        ,old_rating_method 
        ,old_estimated_monthly_premium
        ,old_estimated_monthly_revenue
        ,old_additional_info
        ,old_rate_guarantee
        ,old_rate_guarantee_uom
        ,old_number_of_lives_as_of
        ,old_payment_cycle
        ,old_renewal_percentage_change
        ,old_last_modified_on
        ,old_created_on
        ,audit_action 
    )
    select   old.rate_id 
            ,old.product_id 
            ,old.response_id 
            ,old.description 
            ,old.rate_type_id 
            ,old.rate_type_tier_id 
            ,old.effective_as_of 
            ,old.expiration_on 
            ,old.include_ee 
            ,old.age_banded 
            ,old.age_banded_start_on 
            ,old.age_banded_end_on 
            ,old.age_banded_interval 
            ,old.age_banded_gender_specific 
            ,old.rating_method 
            ,old.estimated_monthly_premium
            ,old.estimated_monthly_revenue
            ,old.additional_info
            ,old.rate_guarantee
            ,old.rate_guarantee_uom
            ,old.number_of_lives_as_of
            ,old.payment_cycle
            ,old.renewal_percentage_change
            ,old.last_modified_on
            ,old.created_on
            ,'D';
    return old;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_rate_d() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_rate_d() to rl_benefitpoint_x;
go 
create or replace function benefitpoint.tr_audit_plan_info_u() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_plan_info (
         product_id 
        ,account_id 
        ,old_alternative_plan_id 
        ,new_alternative_plan_id 
        ,old_erisa_plan 
        ,new_erisa_plan 
        ,old_erisa_plan_year_end_month 
        ,new_erisa_plan_year_end_month 
        ,old_erisa_plan_year_end_day 
        ,new_erisa_plan_year_end_day 
        ,old_notes 
        ,new_notes 
        ,old_frozen_enrollment 
        ,new_frozen_enrollment 
        ,old_requires_5500 
        ,new_requires_5500 
        ,old_frozen_enrollment_effective_as_of 
        ,new_frozen_enrollment_effective_as_of 
        ,old_market_size 
        ,new_market_size 
        ,old_maxiumum_group_size 
        ,new_maxiumum_group_size 
        ,old_minimum_group_size 
        ,new_minimum_group_size 
        ,old_exclusions_limitations 
        ,new_exclusions_limitations 
        ,old_customizations 
        ,new_customizations 
        ,old_participation_requirements 
        ,new_participation_requirements 
        ,old_participation_requirements_vol 
        ,new_participation_requirements_vol 
        ,old_state_list 
        ,new_state_list 
        ,old_market_group_plan_id 
        ,new_market_group_plan_id 
        ,audit_action 
    )
    select   old.product_id 
            ,old.account_id 
            ,old.alternative_plan_id 
            ,new.alternative_plan_id 
            ,old.erisa_plan 
            ,new.erisa_plan 
            ,old.erisa_plan_year_end_month 
            ,new.erisa_plan_year_end_month 
            ,old.erisa_plan_year_end_day 
            ,new.erisa_plan_year_end_day 
            ,old.notes 
            ,new.notes 
            ,old.frozen_enrollment 
            ,new.frozen_enrollment 
            ,old.requires_5500 
            ,new.requires_5500 
            ,old.frozen_enrollment_effective_as_of 
            ,new.frozen_enrollment_effective_as_of 
            ,old.market_size 
            ,new.market_size 
            ,old.maxiumum_group_size 
            ,new.maxiumum_group_size 
            ,old.minimum_group_size 
            ,new.minimum_group_size 
            ,old.exclusions_limitations 
            ,new.exclusions_limitations 
            ,old.customizations 
            ,new.customizations 
            ,old.participation_requirements 
            ,new.participation_requirements 
            ,old.participation_requirements_vol 
            ,new.participation_requirements_vol 
            ,old.state_list 
            ,new.state_list 
            ,old.market_group_plan_id 
            ,new.market_group_plan_id 
            ,'U';
    return old;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_plan_info_u() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_plan_info_u() to rl_benefitpoint_x;
go 
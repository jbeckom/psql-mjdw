create or replace function benefitpoint.tr_audit_plan_info_i() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_plan_info (
         product_id 
        ,account_id 
        ,new_alternative_plan_id 
        ,new_erisa_plan 
        ,new_erisa_plan_year_end_month 
        ,new_erisa_plan_year_end_day 
        ,new_notes 
        ,new_frozen_enrollment 
        ,new_requires_5500 
        ,new_frozen_enrollment_effective_as_of 
        ,new_market_size 
        ,new_maxiumum_group_size 
        ,new_minimum_group_size 
        ,new_exclusions_limitations 
        ,new_customizations 
        ,new_participation_requirements 
        ,new_participation_requirements_vol 
        ,new_state_list 
        ,new_market_group_plan_id 
        ,audit_action 
    )
    select   new.product_id 
            ,new.account_id 
            ,new.alternative_plan_id 
            ,new.erisa_plan 
            ,new.erisa_plan_year_end_month 
            ,new.erisa_plan_year_end_day 
            ,new.notes 
            ,new.frozen_enrollment 
            ,new.requires_5500 
            ,new.frozen_enrollment_effective_as_of 
            ,new.market_size 
            ,new.maxiumum_group_size 
            ,new.minimum_group_size 
            ,new.exclusions_limitations 
            ,new.customizations 
            ,new.participation_requirements 
            ,new.participation_requirements_vol 
            ,new.state_list 
            ,new.market_group_plan_id 
            ,'I';
    return new;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_plan_info_i() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_plan_info_i() to rl_benefitpoint_x;
go 
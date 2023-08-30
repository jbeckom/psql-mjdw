create or replace function benefitpoint.tr_audit_plan_info_d() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_plan_info (
         product_id 
        ,account_id 
        ,old_alternative_plan_id 
        ,old_erisa_plan 
        ,old_erisa_plan_year_end_month 
        ,old_erisa_plan_year_end_day 
        ,old_notes 
        ,old_frozen_enrollment 
        ,old_requires_5500 
        ,old_frozen_enrollment_effective_as_of 
        ,old_market_size 
        ,old_maxiumum_group_size 
        ,old_minimum_group_size 
        ,old_exclusions_limitations 
        ,old_customizations 
        ,old_participation_requirements 
        ,old_participation_requirements_vol 
        ,old_state_list 
        ,old_market_group_plan_id 
        ,audit_action 
    )
    select   old.product_id 
            ,old.account_id 
            ,old.alternative_plan_id 
            ,old.erisa_plan 
            ,old.erisa_plan_year_end_month 
            ,old.erisa_plan_year_end_day 
            ,old.notes 
            ,old.frozen_enrollment 
            ,old.requires_5500 
            ,old.frozen_enrollment_effective_as_of 
            ,old.market_size 
            ,old.maxiumum_group_size 
            ,old.minimum_group_size 
            ,old.exclusions_limitations 
            ,old.customizations 
            ,old.participation_requirements 
            ,old.participation_requirements_vol 
            ,old.state_list 
            ,old.market_group_plan_id 
            ,'D';
    return old;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_plan_info_d() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_plan_info_d() to rl_benefitpoint_x;
go 
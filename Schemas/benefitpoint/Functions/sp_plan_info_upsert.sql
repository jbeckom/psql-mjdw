create or replace function benefitpoint.sp_plan_info_upsert() 
returns int 
language plpgsql 
as $$ 

declare rc int;

begin 
    insert into benefitpoint.plan_info (
         product_id 
        ,account_id 
        ,alternative_plan_id 
        ,erisa_plan 
        ,erisa_plan_year_end_month 
        ,erisa_plan_year_end_day 
        ,notes 
        ,frozen_enrollment 
        ,requires_5500 
        ,frozen_enrollment_effective_as_of 
        ,market_size 
        ,maxiumum_group_size 
        ,minimum_group_size 
        ,exclusions_limitations 
        ,customizations 
        ,participation_requirements 
        ,participation_requirements_vol 
        ,state_list 
        ,market_group_plan_id 
    )
    select   product_id 
            ,account_id 
            ,alternative_plan_id 
            ,erisa_plan 
            ,erisa_plan_year_end_month::int 
            ,erisa_plan_year_end_day::int 
            ,notes 
            ,frozen_enrollment::bool 
            ,requires_5500::bool 
            ,frozen_enrollment_effective_as_of::timestamp 
            ,market_size 
            ,maxiumum_group_size::int 
            ,minimum_group_size::int 
            ,exclusions_limitations 
            ,customizations 
            ,participation_requirements 
            ,participation_requirements_vol 
            ,state_list 
            ,market_group_plan_id::int  
    from    benefitpoint.stg_plan_info 
    on conflict (product_id,account_id) do update 
    set      alternative_plan_id                = excluded.alternative_plan_id 
            ,erisa_plan                         = excluded.erisa_plan 
            ,erisa_plan_year_end_month          = excluded.erisa_plan_year_end_month 
            ,erisa_plan_year_end_day            = excluded.erisa_plan_year_end_day 
            ,notes                              = excluded.notes 
            ,frozen_enrollment                  = excluded.frozen_enrollment 
            ,requires_5500                      = excluded.requires_5500 
            ,frozen_enrollment_effective_as_of  = excluded.frozen_enrollment_effective_as_of 
            ,market_size                        = excluded.market_size 
            ,maxiumum_group_size                = excluded.maxiumum_group_size 
            ,minimum_group_size                 = excluded.minimum_group_size 
            ,exclusions_limitations             = excluded.exclusions_limitations 
            ,customizations                     = excluded.customizations 
            ,participation_requirements         = excluded.participation_requirements 
            ,participation_requirements_vol     = excluded.participation_requirements_vol 
            ,state_list                         = excluded.state_list 
            ,market_group_plan_id               = excluded.market_group_plan_id 
    where   (plan_info.alternative_plan_id,plan_info.erisa_plan,plan_info.erisa_plan_year_end_month,plan_info.erisa_plan_year_end_day,plan_info.notes,plan_info.frozen_enrollment,plan_info.requires_5500,plan_info.frozen_enrollment_effective_as_of,plan_info.market_size,plan_info.maxiumum_group_size,plan_info.minimum_group_size,plan_info.exclusions_limitations,plan_info.customizations,plan_info.participation_requirements,plan_info.participation_requirements_vol,plan_info.state_list,plan_info.market_group_plan_id) 
        is distinct from    (excluded.alternative_plan_id,excluded.erisa_plan,excluded.erisa_plan_year_end_month,excluded.erisa_plan_year_end_day,excluded.notes,excluded.frozen_enrollment,excluded.requires_5500,excluded.frozen_enrollment_effective_as_of,excluded.market_size,excluded.maxiumum_group_size,excluded.minimum_group_size,excluded.exclusions_limitations,excluded.customizations,excluded.participation_requirements,excluded.participation_requirements_vol,excluded.state_list,excluded.market_group_plan_id); 

    get diagnostics rc = row_count;

    return rc;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.sp_plan_info_upsert() owner to mj_admin;
go 

grant execute on function benefitpoint.sp_plan_info_upsert() to rl_benefitpoint_x;
go 
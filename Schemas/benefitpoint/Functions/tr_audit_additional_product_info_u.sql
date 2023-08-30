create or replace function benefitpoint.tr_audit_additional_product_info_u() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_additional_product_info (
         product_id 
        ,account_id 
        ,old_estimated_commission 
        ,new_estimated_commission 
        ,old_commission_period_type 
        ,new_commission_period_type 
        ,old_notes 
        ,new_notes 
        ,old_requires_5500 
        ,new_requires_5500 
        ,old_erisa_plan 
        ,new_erisa_plan 
        ,old_erisa_plan_year_end_month 
        ,new_erisa_plan_year_end_month 
        ,old_erisa_plan_year_end_day 
        ,new_erisa_plan_year_end_day 
        ,old_alternative_plan_id 
        ,new_alternative_plan_id 
        ,audit_action 
    )
    select   old.product_id 
            ,old.account_id 
            ,old.estimated_commission 
            ,new.estimated_commission 
            ,old.commission_period_type 
            ,new.commission_period_type 
            ,old.notes 
            ,new.notes 
            ,old.requires_5500 
            ,new.requires_5500 
            ,old.erisa_plan 
            ,new.erisa_plan 
            ,old.erisa_plan_year_end_month 
            ,new.erisa_plan_year_end_month 
            ,old.erisa_plan_year_end_day 
            ,new.erisa_plan_year_end_day 
            ,old.alternative_plan_id 
            ,new.alternative_plan_id 
            ,'U'; 
    return old;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_additional_product_info_u() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_additional_product_info_u() to rl_benefitpoint_x;
go 
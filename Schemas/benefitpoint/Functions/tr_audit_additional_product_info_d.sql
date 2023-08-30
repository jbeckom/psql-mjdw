create or replace function benefitpoint.tr_audit_additional_product_info_d() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_additional_product_info (
         product_id 
        ,account_id 
        ,old_estimated_commission 
        ,old_commission_period_type 
        ,old_notes 
        ,old_requires_5500 
        ,old_erisa_plan 
        ,old_erisa_plan_year_end_month 
        ,old_erisa_plan_year_end_day 
        ,old_alternative_plan_id 
        ,audit_action 
    )
    select   old.product_id 
            ,old.account_id 
            ,old.estimated_commission 
            ,old.commission_period_type 
            ,old.notes 
            ,old.requires_5500 
            ,old.erisa_plan 
            ,old.erisa_plan_year_end_month 
            ,old.erisa_plan_year_end_day 
            ,old.alternative_plan_id 
            ,'D'; 
    return old;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_additional_product_info_d() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_additional_product_info_d() to rl_benefitpoint_x;
go 
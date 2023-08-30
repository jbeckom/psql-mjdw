create or replace function benefitpoint.tr_audit_additional_product_info_i() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_additional_product_info (
         product_id 
        ,account_id 
        ,new_estimated_commission 
        ,new_commission_period_type 
        ,new_notes 
        ,new_requires_5500 
        ,new_erisa_plan 
        ,new_erisa_plan_year_end_month 
        ,new_erisa_plan_year_end_day 
        ,new_alternative_plan_id 
        ,audit_action 
    )
    select   new.product_id 
            ,new.account_id 
            ,new.estimated_commission 
            ,new.commission_period_type 
            ,new.notes 
            ,new.requires_5500 
            ,new.erisa_plan 
            ,new.erisa_plan_year_end_month 
            ,new.erisa_plan_year_end_day 
            ,new.alternative_plan_id 
            ,'I'; 
    return new;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_additional_product_info_i() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_additional_product_info_i() to rl_benefitpoint_x;
go 
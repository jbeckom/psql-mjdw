create or replace function benefitpoint.tr_audit_commission_u() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_commission(
         rate_id 
        ,commission_id 
        ,old_commission_type 
        ,new_commission_type 
        ,old_commission_paid_by 
        ,new_commission_paid_by 
        ,old_description 
        ,new_description 
        ,old_estimated_monthly_revenue 
        ,new_estimated_monthly_revenue 
        ,old_additional_info 
        ,new_additional_info 
        ,old_flat_percentage_of_premium 
        ,new_flat_percentage_of_premium 
        ,old_premium_override_amount 
        ,new_premium_override_amount 
        ,old_estimated_number_of_members 
        ,new_estimated_number_of_members 
        ,audit_action 
    )
    select   old.rate_id 
            ,old.commission_id 
            ,old.commission_type 
            ,new.commission_type 
            ,old.commission_paid_by 
            ,new.commission_paid_by 
            ,old.description 
            ,new.description 
            ,old.estimated_monthly_revenue 
            ,new.estimated_monthly_revenue 
            ,old.additional_info 
            ,new.additional_info 
            ,old.flat_percentage_of_premium 
            ,new.flat_percentage_of_premium 
            ,old.premium_override_amount 
            ,new.premium_override_amount 
            ,old.estimated_number_of_members 
            ,new.estimated_number_of_members 
            ,'U'; 
    return old; 
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_commission_u() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_commission_u() to rl_benefitpoint_x;
go 
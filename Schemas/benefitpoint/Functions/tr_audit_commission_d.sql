create or replace function benefitpoint.tr_audit_commission_d() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_commission(
         rate_id 
        ,commission_id 
        ,old_commission_type 
        ,old_commission_paid_by 
        ,old_description 
        ,old_estimated_monthly_revenue 
        ,old_additional_info 
        ,old_flat_percentage_of_premium 
        ,old_premium_override_amount 
        ,old_estimated_number_of_members 
        ,audit_action 
    )
    select   old.rate_id 
            ,old.commission_id 
            ,old.commission_type 
            ,old.commission_paid_by 
            ,old.description 
            ,old.estimated_monthly_revenue 
            ,old.additional_info 
            ,old.flat_percentage_of_premium 
            ,old.premium_override_amount 
            ,old.estimated_number_of_members 
            ,'D'; 
    return old; 
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_commission_d() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_commission_d() to rl_benefitpoint_x;
go 
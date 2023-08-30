create or replace function benefitpoint.tr_audit_commission_i() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_commission(
         rate_id 
        ,commission_id 
        ,new_commission_type 
        ,new_commission_paid_by 
        ,new_description 
        ,new_estimated_monthly_revenue 
        ,new_additional_info 
        ,new_flat_percentage_of_premium 
        ,new_premium_override_amount 
        ,new_estimated_number_of_members 
        ,audit_action 
    )
    select   new.rate_id 
            ,new.commission_id 
            ,new.commission_type 
            ,new.commission_paid_by 
            ,new.description 
            ,new.estimated_monthly_revenue 
            ,new.additional_info 
            ,new.flat_percentage_of_premium 
            ,new.premium_override_amount 
            ,new.estimated_number_of_members 
            ,'I'; 
    return new; 
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_commission_i() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_commission_i() to rl_benefitpoint_x;
go 
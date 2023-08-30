create or replace function benefitpoint.tr_audit_commission_info_d() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_commission_info (
         product_id 
        ,account_id 
        ,old_alternative_policy_number 
        ,old_new_business_until 
        ,old_commission_start_on 
        ,old_notes 
        ,audit_action 
    )
    select   old.product_id 
            ,old.account_id 
            ,old.alternative_policy_number 
            ,old.new_business_until 
            ,old.commission_start_on 
            ,old.notes 
            ,'D'; 
    return old;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_commission_info_d() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_commission_info_d() to rl_benefitpoint_x;
go 

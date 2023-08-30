create or replace function benefitpoint.tr_audit_commission_info_i() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_commission_info (
         product_id 
        ,account_id 
        ,new_alternative_policy_number 
        ,new_new_business_until 
        ,new_commission_start_on 
        ,new_notes 
        ,audit_action 
    )
    select   new.product_id 
            ,new.account_id 
            ,new.alternative_policy_number 
            ,new.new_business_until 
            ,new.commission_start_on 
            ,new.notes 
            ,'I'; 
    return new;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_commission_info_i() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_commission_info_i() to rl_benefitpoint_x;
go 

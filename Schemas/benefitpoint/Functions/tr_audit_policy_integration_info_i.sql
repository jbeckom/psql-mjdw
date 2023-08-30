create or replace function benefitpoint.tr_audit_policy_integration_info_i() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_policy_integration_info (
         product_id 
        ,account_id 
        ,new_sagitta_policy_id 
        ,new_ams_policy_id 
        ,new_tam_policy_id 
        ,new_vision_policy_id 
        ,audit_action 
    )
    select   new.product_id 
            ,new.account_id 
            ,new.sagitta_policy_id 
            ,new.ams_policy_id 
            ,new.tam_policy_id 
            ,new.vision_policy_id 
            ,'I'; 
    return new;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_policy_integration_info_i() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_policy_integration_info_i() to rl_benefitpoint_x;
go 
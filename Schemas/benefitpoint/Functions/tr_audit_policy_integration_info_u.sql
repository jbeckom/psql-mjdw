create or replace function benefitpoint.tr_audit_policy_integration_info_u() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_policy_integration_info (
         product_id 
        ,account_id 
        ,old_sagitta_policy_id 
        ,new_sagitta_policy_id 
        ,old_ams_policy_id 
        ,new_ams_policy_id 
        ,old_tam_policy_id 
        ,new_tam_policy_id 
        ,old_vision_policy_id 
        ,new_vision_policy_id 
        ,audit_action 
    )
    select   old.product_id 
            ,old.account_id 
            ,old.sagitta_policy_id 
            ,new.sagitta_policy_id 
            ,old.ams_policy_id 
            ,new.ams_policy_id 
            ,old.tam_policy_id 
            ,new.tam_policy_id 
            ,old.vision_policy_id 
            ,new.vision_policy_id 
            ,'U'; 
    return old;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_policy_integration_info_u() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_policy_integration_info_u() to rl_benefitpoint_x;
go 
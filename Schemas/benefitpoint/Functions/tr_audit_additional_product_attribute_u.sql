create or replace function benefitpoint.tr_audit_additional_product_attribute_u() 
returns trigger 
language plpgsql 
as $$

begin 
    insert into benefitpoint.audit_additional_product_attribute (
         product_id 
        ,account_id 
        ,attribute_id 
        ,old_name 
        ,new_name 
        ,old_field_value_type 
        ,new_field_value_type 
        ,old_value_num 
        ,new_value_num 
        ,old_value_text 
        ,new_value_text 
        ,old_value_date 
        ,new_value_date 
        ,old_option_value_id 
        ,new_option_value_id 
        ,audit_action 
    )
    select   old.product_id 
            ,old.account_id 
            ,old.attribute_id 
            ,old.name 
            ,new.name 
            ,old.field_value_type 
            ,new.field_value_type 
            ,old.value_num 
            ,new.value_num 
            ,old.value_text 
            ,new.value_text 
            ,old.value_date 
            ,new.value_date 
            ,old.option_value_id 
            ,new.option_value_id 
            ,'U'; 
    return old; 
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_additional_product_attribute_u() owner to mj_admin;
go

grant execute on function benefitpoint.tr_audit_additional_product_attribute_u() to rl_benefitpoint_x;
go 
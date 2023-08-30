create or replace function benefitpoint.tr_audit_additional_product_attribute_i() 
returns trigger 
language plpgsql 
as $$

begin 
    insert into benefitpoint.audit_additional_product_attribute (
         product_id 
        ,account_id 
        ,attribute_id 
        ,new_name 
        ,new_field_value_type 
        ,new_value_num 
        ,new_value_text 
        ,new_value_date 
        ,new_option_value_id 
        ,audit_action 
    )
    select   new.product_id 
            ,new.account_id 
            ,new.attribute_id 
            ,new.name 
            ,new.field_value_type 
            ,new.value_num 
            ,new.value_text 
            ,new.value_date 
            ,new.option_value_id 
            ,'I'; 
    return new; 
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_additional_product_attribute_i() owner to mj_admin;
go

grant execute on function benefitpoint.tr_audit_additional_product_attribute_i() to rl_benefitpoint_x;
go 
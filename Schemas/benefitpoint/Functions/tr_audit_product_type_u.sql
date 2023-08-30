create or replace function benefitpoint.tr_audit_product_type_u() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_product_type (
         product_type_id 
        ,old_short_description 
        ,new_short_description 
        ,old_long_description 
        ,new_long_description 
        ,old_line_of_coverage 
        ,new_line_of_coverage 
        ,old_rate_types 
        ,new_rate_types 
        ,audit_action 
    )
    select   old.product_type_id 
            ,old.short_description 
            ,new.short_description 
            ,old.long_description 
            ,new.long_description 
            ,old.line_of_coverage 
            ,new.line_of_coverage 
            ,old.rate_types 
            ,new.rate_types 
            ,'U'; 
    return old;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_product_type_u() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_product_type_u() to rl_benefitpoint_x;
go 

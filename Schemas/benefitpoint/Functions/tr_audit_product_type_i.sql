create or replace function benefitpoint.tr_audit_product_type_i() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_product_type (
         product_type_id 
        ,new_short_description 
        ,new_long_description 
        ,new_line_of_coverage 
        ,new_rate_types 
        ,audit_action 
    )
    select   new.product_type_id 
            ,new.short_description 
            ,new.long_description 
            ,new.line_of_coverage 
            ,new.rate_types 
            ,'I'; 
    return new;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_product_type_i() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_product_type_i() to rl_benefitpoint_x;
go 

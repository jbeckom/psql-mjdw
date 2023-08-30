create or replace function benefitpoint.tr_audit_product_type_d() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_product_type (
         product_type_id 
        ,old_short_description 
        ,old_long_description 
        ,old_line_of_coverage 
        ,old_rate_types 
        ,audit_action 
    )
    select   old.product_type_id 
            ,old.short_description 
            ,old.long_description 
            ,old.line_of_coverage 
            ,old.rate_types 
            ,'D'; 
    return old;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_product_type_d() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_product_type_d() to rl_benefitpoint_x;
go 

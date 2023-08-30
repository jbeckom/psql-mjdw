create or replace function benefitpoint.tr_audit_rate_field_i() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_rate_field (
         rate_field_id 
        ,new_label 
        ,new_field_type 
        ,new_field_value_type 
        ,new_rate_field_group 
        ,new_tiered 
        ,new_calculated 
        ,audit_action 
    )
    select   new.rate_field_id 
            ,new.label 
            ,new.field_type 
            ,new.field_value_type 
            ,new.rate_field_group 
            ,new.tiered 
            ,new.calculated 
            ,'I'; 
    return new;
end;
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_rate_field_i() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_rate_field_i() to rl_benefitpoint_x;
go 

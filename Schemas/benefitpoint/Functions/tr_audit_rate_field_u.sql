create or replace function benefitpoint.tr_audit_rate_field_u() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_rate_field (
         rate_field_id 
        ,old_label 
        ,new_label 
        ,old_field_type 
        ,new_field_type 
        ,old_field_value_type 
        ,new_field_value_type 
        ,old_rate_field_group 
        ,new_rate_field_group 
        ,old_tiered 
        ,new_tiered 
        ,old_calculated 
        ,new_calculated 
        ,audit_action 
    )
    select   old.rate_field_id 
            ,old.label 
            ,new.label 
            ,old.field_type 
            ,new.field_type 
            ,old.field_value_type 
            ,new.field_value_type 
            ,old.rate_field_group 
            ,new.rate_field_group 
            ,old.tiered 
            ,new.tiered 
            ,old.calculated 
            ,new.calculated 
            ,'U'; 
    return old;
end;
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_rate_field_u() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_rate_field_u() to rl_benefitpoint_x;
go 

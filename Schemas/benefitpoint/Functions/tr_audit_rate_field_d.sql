create or replace function benefitpoint.tr_audit_rate_field_d() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_rate_field (
         rate_field_id 
        ,old_label 
        ,old_field_type 
        ,old_field_value_type 
        ,old_rate_field_group 
        ,old_tiered 
        ,old_calculated 
        ,audit_action 
    )
    select   old.rate_field_id 
            ,old.label 
            ,old.field_type 
            ,old.field_value_type 
            ,old.rate_field_group 
            ,old.tiered 
            ,old.calculated 
            ,'D'; 
    return old;
end;
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_rate_field_d() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_rate_field_d() to rl_benefitpoint_x;
go 

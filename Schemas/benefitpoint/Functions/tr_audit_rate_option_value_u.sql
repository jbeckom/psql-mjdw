create or replace function benefitpoint.tr_audit_rate_option_value_u()
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_rate_option_value (
         rate_field_id 
        ,rate_option_value_id 
        ,old_description 
        ,new_description 
        ,audit_action 
    )
    select   old.rate_field_id 
            ,old.rate_option_value_id 
            ,old.description 
            ,new.description 
            ,'U'; 
    return old;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_rate_option_value_u() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_rate_option_value_u() to rl_benefitpoint_x;
go 

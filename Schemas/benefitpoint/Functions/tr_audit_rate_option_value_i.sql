create or replace function benefitpoint.tr_audit_rate_option_value_i()
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_rate_option_value (
         rate_field_id 
        ,rate_option_value_id 
        ,new_description 
        ,audit_action 
    )
    select   new.rate_field_id 
            ,new.rate_option_value_id 
            ,new.description 
            ,'I'; 
    return new;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_rate_option_value_i() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_rate_option_value_i() to rl_benefitpoint_x;
go 

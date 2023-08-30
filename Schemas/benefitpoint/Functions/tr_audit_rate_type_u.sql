create or replace function benefitpoint.tr_audit_rate_type_u() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_rate_type (
         rate_type_id 
        ,old_description 
        ,new_description 
        ,old_funding_type 
        ,new_funding_type 
        ,audit_action 
    )
    select   old.rate_type_id 
            ,old.description 
            ,new.description 
            ,old.funding_type 
            ,new.funding_type 
            ,'U'; 
    return old; 
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_rate_type_u() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_rate_type_u() to rl_benefitpoint_x;
go 

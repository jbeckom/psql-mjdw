create or replace function benefitpoint.tr_audit_rate_type_i() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_rate_type (
         rate_type_id 
        ,new_description 
        ,new_funding_type 
        ,audit_action 
    )
    select   new.rate_type_id 
            ,new.description 
            ,new.funding_type 
            ,'I'; 
    return new; 
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_rate_type_i() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_rate_type_i() to rl_benefitpoint_x;
go 

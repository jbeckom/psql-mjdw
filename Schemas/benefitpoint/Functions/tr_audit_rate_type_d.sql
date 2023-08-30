create or replace function benefitpoint.tr_audit_rate_type_d() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_rate_type (
         rate_type_id 
        ,old_description 
        ,old_funding_type 
        ,audit_action 
    )
    select   old.rate_type_id 
            ,old.description 
            ,old.funding_type 
            ,'D'; 
    return old; 
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_rate_type_d() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_rate_type_d() to rl_benefitpoint_x;
go 

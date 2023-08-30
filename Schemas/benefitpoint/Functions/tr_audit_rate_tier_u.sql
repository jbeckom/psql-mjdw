create or replace function benefitpoint.tr_audit_rate_tier_u() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_rate_tier (
         rate_field_id 
        ,rate_tier_id 
        ,old_description 
        ,new_description 
        ,old_allow_include_ee 
        ,new_allow_include_ee 
        ,audit_action 
    )
    select   old.rate_field_id 
            ,old.rate_tier_id 
            ,old.description 
            ,new.description 
            ,old.allow_include_ee 
            ,new.allow_include_ee 
            ,'U'; 
    return old; 
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_rate_tier_u() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_rate_tier_u() to rl_benefitpoint_x;
go 
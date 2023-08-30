create or replace function benefitpoint.tr_audit_rate_tier_d() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_rate_tier (
         rate_field_id 
        ,rate_tier_id 
        ,old_description 
        ,old_allow_include_ee 
        ,audit_action 
    )
    select   old.rate_field_id 
            ,old.rate_tier_id 
            ,old.description 
            ,old.allow_include_ee 
            ,'D'; 
    return old; 
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_rate_tier_d() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_rate_tier_d() to rl_benefitpoint_x;
go 
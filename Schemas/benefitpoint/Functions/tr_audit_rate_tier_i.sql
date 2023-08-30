create or replace function benefitpoint.tr_audit_rate_tier_i() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_rate_tier (
         rate_field_id 
        ,rate_tier_id 
        ,new_description 
        ,new_allow_include_ee 
        ,audit_action 
    )
    select   new.rate_field_id 
            ,new.rate_tier_id 
            ,new.description 
            ,new.allow_include_ee 
            ,'I'; 
    return new; 
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_rate_tier_i() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_rate_tier_i() to rl_benefitpoint_x;
go 
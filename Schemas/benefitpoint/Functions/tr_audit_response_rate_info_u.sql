create or replace function benefitpoint.tr_audit_response_rate_info_u() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_response_rate_info (
         rate_id 
        ,rate_version 
        ,old_rate_version_reasons 
        ,new_rate_version_reasons 
        ,old_parent_rate_id 
        ,new_parent_rate_id 
        ,old_selected 
        ,new_selected 
        ,old_created_by_broker 
        ,new_created_by_broker 
        ,old_quote_valid_through 
        ,new_quote_valid_through 
        ,audit_action 
    )
    select   old.rate_id 
            ,old.rate_version 
            ,old.rate_version_reasons 
            ,new.rate_version_reasons 
            ,old.parent_rate_id 
            ,new.parent_rate_id 
            ,old.selected 
            ,new.selected 
            ,old.created_by_broker 
            ,new.created_by_broker 
            ,old.quote_valid_through 
            ,new.quote_valid_through 
            ,'U'; 
    return old; 
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_response_rate_info_u() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_response_rate_info_u() to rl_benefitpoint_x;
go 
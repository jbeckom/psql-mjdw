create or replace function benefitpoint.tr_audit_response_rate_info_i() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_response_rate_info (
         rate_id 
        ,rate_version 
        ,new_rate_version_reasons 
        ,new_parent_rate_id 
        ,new_selected 
        ,new_created_by_broker 
        ,new_quote_valid_through 
        ,audit_action 
    )
    select   new.rate_id 
            ,new.rate_version 
            ,new.rate_version_reasons 
            ,new.parent_rate_id 
            ,new.selected 
            ,new.created_by_broker 
            ,new.quote_valid_through 
            ,'I'; 
    return new; 
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_response_rate_info_i() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_response_rate_info_i() to rl_benefitpoint_x;
go 
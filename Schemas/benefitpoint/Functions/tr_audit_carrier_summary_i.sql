create or replace function benefitpoint.tr_audit_carrier_summary_i() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_carrier_summary (
         carrier_id 
        ,new_carrier_name 
        ,new_carrier_alias 
        ,audit_action 
    )
    select   new.carrier_id 
            ,new.carrier_name 
            ,new.carrier_alias 
            ,'I';
    return new; 
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_carrier_summary_i() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_carrier_summary_i() to rl_benefitpoint_x;
go 

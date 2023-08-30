create or replace function benefitpoint.tr_audit_carrier_summary_d() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_carrier_summary (
         carrier_id 
        ,old_carrier_name 
        ,old_carrier_alias 
        ,audit_action 
    )
    select   old.carrier_id 
            ,old.carrier_name 
            ,old.carrier_alias 
            ,'D';
    return old; 
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_carrier_summary_d() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_carrier_summary_d() to rl_benefitpoint_x;
go 

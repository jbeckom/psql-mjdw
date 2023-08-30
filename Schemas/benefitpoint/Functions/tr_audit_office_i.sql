create or replace function benefitpoint.tr_audit_office_i()
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_office (
         office_id 
        ,new_office_name 
        ,new_region_name 
        ,audit_action 
    )
    select   new.office_id 
            ,new.office_name 
            ,new.region_name 
            ,'I'; 
    return new; 
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_office_i() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_office_i() to rl_benefitpoint_x;
go 
create or replace function benefitpoint.tr_audit_office_u()
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_office (
         office_id 
        ,old_office_name 
        ,new_office_name 
        ,old_region_name 
        ,new_region_name 
        ,audit_action 
    )
    select   old.office_id 
            ,old.office_name 
            ,new.office_name 
            ,old.region_name 
            ,new.region_name 
            ,'U'; 
    return old; 
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_office_u() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_office_u() to rl_benefitpoint_x;
go 
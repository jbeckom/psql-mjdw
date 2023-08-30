create or replace function benefitpoint.tr_audit_commission_range_d() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_commission_range (
         source_type 
        ,commission_id 
        ,old_value 
        ,old_value_unit_of_measure 
        ,old_from_range 
        ,old_to_range 
        ,sort_order 
        ,audit_action 
    )
    select   old.source_type 
            ,old.commission_id 
            ,old.value 
            ,old.value_unit_of_measure 
            ,old.from_range 
            ,old.to_range 
            ,old.sort_order 
            ,'D'; 
    return old;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_commission_range_d() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_commission_range_d() to rl_benefitpoint_x;
go 

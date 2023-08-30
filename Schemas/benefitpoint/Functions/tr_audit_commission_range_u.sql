create or replace function benefitpoint.tr_audit_commission_range_u() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_commission_range (
         source_type 
        ,commission_id 
        ,old_value 
        ,new_value 
        ,old_value_unit_of_measure 
        ,new_value_unit_of_measure 
        ,old_from_range 
        ,new_from_range 
        ,old_to_range 
        ,new_to_range 
        ,sort_order 
        ,audit_action 
    )
    select   old.source_type 
            ,old.commission_id 
            ,old.rate_commission_range_id 
            ,new.rate_commission_range_id 
            ,old.value 
            ,new.value 
            ,old.value_unit_of_measure 
            ,new.value_unit_of_measure 
            ,old.from_range 
            ,new.from_range 
            ,old.to_range 
            ,new.to_range 
            ,old.sort_order 
            ,'U'; 
    return old;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_commission_range_u() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_commission_range_u() to rl_benefitpoint_x;
go 

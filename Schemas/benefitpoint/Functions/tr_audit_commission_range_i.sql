create or replace function benefitpoint.tr_audit_commission_range_i() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_commission_range (
         source_type 
        ,commission_id 
        ,new_value 
        ,new_value_unit_of_measure 
        ,new_from_range 
        ,new_to_range 
        ,sort_order 
        ,audit_action 
    )
    select   new.source_type 
            ,new.commission_id 
            ,new.value 
            ,new.value_unit_of_measure 
            ,new.from_range 
            ,new.to_range 
            ,new.sort_order 
            ,'I'; 
    return new;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_commission_range_i() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_commission_range_i() to rl_benefitpoint_x;
go 

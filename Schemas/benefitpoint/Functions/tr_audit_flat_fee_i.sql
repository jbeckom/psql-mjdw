create or replace function benefitpoint.tr_audit_flat_fee_i()
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_flat_fee (
         commission_id 
        ,new_fee 
        ,new_estimated_number_of_claims 
        ,new_estimated_number_of_claims_interval_type 
        ,new_fee_interval_type 
        ,audit_action 
    )
    select   new.commission_id 
            ,new.fee 
            ,new.estimated_number_of_claims 
            ,new.estimated_number_of_claims_interval_type 
            ,new.fee_interval_type 
            ,'I'; 
    return new; 
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_flat_fee_i() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_flat_fee_i() to rl_benefitpoint_x;
go 
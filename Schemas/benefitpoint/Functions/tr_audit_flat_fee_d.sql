create or replace function benefitpoint.tr_audit_flat_fee_d()
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_flat_fee (
         commission_id 
        ,old_fee 
        ,old_estimated_number_of_claims 
        ,old_estimated_number_of_claims_interval_type 
        ,old_fee_interval_type 
        ,audit_action 
    )
    select   old.commission_id 
            ,old.fee 
            ,old.estimated_number_of_claims 
            ,old.estimated_number_of_claims_interval_type 
            ,old.fee_interval_type 
            ,'D'; 
    return old; 
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_flat_fee_d() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_flat_fee_d() to rl_benefitpoint_x;
go 
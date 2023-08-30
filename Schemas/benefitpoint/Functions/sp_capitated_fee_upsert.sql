create or replace function benefitpoint.sp_capitated_fee_upsert() 
returns int 
language plpgsql 
as $$

declare rc int;

begin 
	insert into benefitpoint.capitated_fee (
		 commission_id 
        ,fee 
        ,estimated_number_of_employees
        ,fee_lives_type 
        ,fee_interval_type 
	)
	select 	 commission_id 
			,fee 
			,estimated_number_of_employees::int 
			,fee_lives_type 
			,fee_interval_type 
	from 	benefitpoint.stg_capitated_fee 
	on conflict (commission_id) do update 
	set 	 fee 							= excluded.fee 
			,estimated_number_of_employees 	= excluded.estimated_number_of_employees 
			,fee_lives_type 				= excluded.fee_lives_type 
			,fee_interval_type 				= excluded.fee_interval_type 
	where 	(capitated_fee.fee,capitated_fee.estimated_number_of_employees,capitated_fee.fee_lives_type,capitated_fee.fee_interval_type) 
		is distinct from 	(excluded.fee,excluded.estimated_number_of_employees,excluded.fee_lives_type,excluded.fee_interval_type); 

	get diagnostics rc = row_count;

	return rc;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.sp_capitated_fee_upsert() owner to mj_admin;
go 

grant execute on function benefitpoint.sp_capitated_fee_upsert() to rl_benefitpoint_x;
go 

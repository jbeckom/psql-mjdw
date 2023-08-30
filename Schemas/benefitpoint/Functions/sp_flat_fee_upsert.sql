create or replace function benefitpoint.sp_flat_fee_upsert() 
returns int 
language plpgsql 
as $$ 

declare rc int;

begin 
	insert into benefitpoint.flat_fee (
		 commission_id 
		,fee 
        ,estimated_number_of_claims 
        ,estimated_number_of_claims_interval_type 
        ,fee_interval_type 
	)
	select 	 commission_id 
			,fee 
			,estimated_number_of_claims::int 
			,estimated_number_of_claims_interval_type 
			,fee_interval_type 
	from 	benefitpoint.stg_flat_fee 
	on conflict (commission_id) do update 
	set 	 fee 										= excluded.fee 
			,estimated_number_of_claims 				= excluded.estimated_number_of_claims 
			,estimated_number_of_claims_interval_type 	= excluded.estimated_number_of_claims_interval_type 
			,fee_interval_type 							= excluded.fee_interval_type 
	where 	(flat_fee.fee,flat_fee.estimated_number_of_claims,flat_fee.estimated_number_of_claims_interval_type,flat_fee.fee_interval_type) 
		is distinct from 	(excluded.fee,excluded.estimated_number_of_claims,excluded.estimated_number_of_claims_interval_type,excluded.fee_interval_type); 

	get diagnostics rc = row_count;

	return rc;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.sp_flat_fee_upsert() owner to mj_admin;
go 

grant execute on function benefitpoint.sp_flat_fee_upsert() to rl_benefitpoint_x;
go 
create or replace function benefitpoint.sp_commission_info_upsert() 
returns int 
language plpgsql 
as $$ 

declare rc int;

begin 
	insert into benefitpoint.commission_info (
		 product_id 
		,account_id 
		,alternative_policy_number 
		,new_business_until 
		,commission_start_on 
		,notes 
	)
	select 	 product_id 
			,account_id 
			,alternative_policy_number 
			,new_business_until::timestamp 
			,commission_start_on::timestamp 
			,notes 
	from 	benefitpoint.stg_commission_info 
	on conflict (product_id, account_id) do update 
	set  alternative_policy_number 	= excluded.alternative_policy_number 
		,new_business_until 		= excluded.new_business_until 
		,commission_start_on 		= excluded.commission_start_on 
		,notes 						= excluded.notes 
	where 	(commission_info.alternative_policy_number,commission_info.new_business_until,commission_info.commission_start_on,commission_info.notes) 
		is distinct from 	(excluded.alternative_policy_number,excluded.new_business_until,excluded.commission_start_on,excluded.notes); 
	
	get diagnostics rc = row_count;

	return rc;
end;
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.sp_commission_info_upsert() owner to mj_admin;
go 

grant execute on function benefitpoint.sp_commission_info_upsert() to rl_benefitpoint_x;
go 
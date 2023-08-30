create or replace function benefitpoint.sp_rate_field_group_upsert() 
returns int 
language plpgsql 
as $$ 

declare rc int; 

begin 
	insert into benefitpoint.rate_field_group (
		 rate_field_group_id 
		,description 
		,max_values_allowed 
		,rate_field_group_type 
	)
	select 	 rate_field_group_id 
			,description 
			,max_values_allowed::int 
			,rate_field_group_type 
	from 	benefitpoint.stg_rate_field_group
	on conflict (rate_field_group_id) do update 
	set 	 description 			= excluded.description 
			,max_values_allowed 	= excluded.max_values_allowed 
			,rate_field_group_type 	= excluded.rate_field_group_type 
	where 	(rate_field_group.description,rate_field_group.max_values_allowed,rate_field_group.rate_field_group_type) 
		is distinct from 	(excluded.description,excluded.max_values_allowed,excluded.rate_field_group_type); 

	get diagnostics rc = row_count;

	return rc;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.sp_rate_field_group_upsert() owner to mj_admin;
go 

grant execute on function benefitpoint.sp_rate_field_group_upsert() to rl_benefitpoint_x;
go 
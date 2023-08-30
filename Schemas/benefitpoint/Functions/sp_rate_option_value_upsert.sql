create or replace function benefitpoint.sp_rate_option_value_upsert() 
returns int 
language plpgsql 
as $$ 

declare rc int; 

begin 
	insert into benefitpoint.rate_option_value (
		 rate_field_id 
        ,rate_option_value_id 
        ,description 
	)
	select 	 rate_field_id 
			,rate_option_value_id 
			,description 
	from 	benefitpoint.stg_rate_option_value 
	on conflict (rate_field_id,rate_option_value_id) do update 
	set 	description 	= excluded.description 
	where 	(rate_option_value.description) 
		is distinct from 	(excluded.description); 

	get diagnostics rc = row_count;

	return rc;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.sp_rate_option_value_upsert() owner to mj_admin;
go 

grant execute on function benefitpoint.sp_rate_option_value_upsert() to rl_benefitpoint_x;
go 
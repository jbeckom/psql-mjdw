create or replace function benefitpoint.sp_rate_type_upsert() 
returns int 
language plpgsql 
as $$ 

declare rc int; 

begin 
	insert into benefitpoint.rate_type (
		 rate_type_id 
        ,description 
        ,funding_type 
	)
	select 	rate_type_id 
			,description 
			,funding_type 
	from 	benefitpoint.stg_rate_type 
	on conflict (rate_type_id) do update 
	set 	 description 	= excluded.description 
			,funding_type 	= excluded.funding_type 
	where 	(rate_type.description,rate_type.funding_type) 
		is distinct from 	(excluded.description,excluded.funding_type); 

	get diagnostics rc = row_count;

	return rc;	
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.sp_rate_type_upsert() owner to mj_admin;
go 

grant execute on function benefitpoint.sp_rate_type_upsert() to rl_benefitpoint_x;
go 
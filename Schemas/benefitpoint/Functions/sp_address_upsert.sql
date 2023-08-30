create or replace function benefitpoint.sp_address_upsert() 
returns int 
language plpgsql 
as $$ 

declare rc int; 

begin 
	insert into benefitpoint.address (
		 address_source
		,source_type 
		,source_key 
		,street_1 
		,street_2 
		,city 
		,state 
		,zip 
		,country
	)
	select   address_source
			,source_type 
			,source_key 
			,street_1 
			,street_2 
			,city 
			,state 
			,zip 
			,country
	from 	benefitpoint.stg_address 
	on conflict (address_source, source_type, source_key) do update 
	set 	 street_1 	= excluded.street_1 
			,street_2 	= excluded.street_2 
			,city 		= excluded.city 
			,state 		= excluded.state 
			,zip 		= excluded.zip 
			,country	= excluded.country
	where 	(address.street_1,address.street_2,address.city,address.state,address.zip,address.country) 
		is distinct from 	(excluded.street_1,excluded.street_2,excluded.city,excluded.state,excluded.zip,excluded.country); 
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.sp_address_upsert() owner to mj_admin;
go 

grant execute on function benefitpoint.sp_address_upsert() to rl_benefitpoint_x;
go 
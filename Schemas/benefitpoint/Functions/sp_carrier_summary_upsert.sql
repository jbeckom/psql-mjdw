create or replace function benefitpoint.sp_carrier_summary_upsert() 
returns int 
language plpgsql 
as $$ 

declare rc int;

begin 
	insert into benefitpoint.carrier_summary (
		 carrier_id 
        ,carrier_name 
        ,carrier_alias 
	)
	select 	 carrier_id 
			,carrier_name 
			,carrier_alias 
	from 	benefitpoint.stg_carrier_summary 
	on conflict (carrier_id) do update 
	set 	 carrier_name 	= excluded.carrier_name 
			,carrier_alias 	= excluded.carrier_alias 
	where 	(carrier_summary.carrier_name,carrier_summary.carrier_alias) 
		is distinct from 	(excluded.carrier_name,excluded.carrier_alias); 

	get diagnostics rc = row_count;

	return rc;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.sp_carrier_summary_upsert() owner to mj_admin;
go 

grant execute on function benefitpoint.sp_carrier_summary_upsert() to rl_benefitpoint_x;
go 
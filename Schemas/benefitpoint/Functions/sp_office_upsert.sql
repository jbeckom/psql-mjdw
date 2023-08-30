create or replace function benefitpoint.sp_office_upsert() 
returns int 
language plpgsql 
as $$ 

declare rc int;

begin 
	insert into benefitpoint.office (
		 office_id 
        ,office_name 
        ,region_name 
	)
	select 	 office_id 
			,office_name 
			,region_name 
	from 	benefitpoint.stg_office 
	on conflict (office_id) do update 
	set 	 office_name 	= excluded.office_name 
			,region_name 	= excluded.region_name 
	where 	(office.office_name,office.region_name) 
		is distinct from 	(excluded.office_name,excluded.region_name); 

	get diagnostics rc = row_count;

	return rc;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.sp_office_upsert() owner to mj_admin;
go 

grant execute on function benefitpoint.sp_office_upsert() to rl_benefitpoint_x;
go 
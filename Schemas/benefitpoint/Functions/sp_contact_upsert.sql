create or replace function benefitpoint.sp_contact_upsert() 
returns int 
language plpgsql 
as $$ 

declare rc int;

begin 
	insert into benefitpoint.contact (
		 contact_source 
		,source_key 
		,contact_id 
		,first_name 
		,last_name 
		,email 
	)
	select 	 contact_source 
			,source_key 
			,contact_id 
			,first_name 
			,last_name 
			,email 
	from 	benefitpoint.stg_contact 
	on conflict (contact_source, source_key, contact_id) do update 
	set 	 first_name 	= excluded.first_name 
			,last_name 		= excluded.last_name 
			,email 			= excluded.email 
	where 	(contact.first_name,contact.last_name,contact.email) 
		is distinct from 	(excluded.first_name,excluded.last_name,excluded.email); 

	get diagnostics rc = row_count;

	return rc;
end;
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.sp_contact_upsert() owner to mj_admin;
go 

grant execute on function benefitpoint.sp_contact_upsert()	to rl_benefitpoint_x;
go 

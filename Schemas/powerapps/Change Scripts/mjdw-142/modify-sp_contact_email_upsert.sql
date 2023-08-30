create or replace function powerapps.sp_contact_email_upsert() 
returns int 
language plpgsql 
as $$

declare rc int;

begin 
	insert into powerapps.contact_email (
		 contact_guid 
		,email_guid 
		,email_type 
		,modify_dt 
	)
	select 	 contact_guid::uuid 
			,email_guid::uuid 
			,email_type  
			,modify_dt 
	from 	powerapps.stg_contact_email 
	on conflict (contact_guid, email_guid, email_type) do update
	set 	 modify_dt 	= excluded.modify_dt 
	where 	(contact_email.modify_dt)
		is distinct from 	(excluded.modify_dt);

	get diagnostics rc = row_count;

	return rc;
end;
$$;
go 

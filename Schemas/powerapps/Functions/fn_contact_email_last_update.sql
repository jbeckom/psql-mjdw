create or replace function powerapps.fn_contact_email_last_update() 
returns timestamp 
language plpgsql 
as $$

begin 
	return 	(
		select 	max(modify_dt)
		from 	powerapps.contact_email
	);
end;
$$;
go 

/*** PERMISSIONS ***/
alter function powerapps.fn_contact_email_last_update() owner to mj_admin;
go 

grant execute on function powerapps.fn_contact_email_last_update() to rl_powerapps_x;
go 


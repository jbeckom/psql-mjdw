create or replace function benefitpoint.sp_rate_field_value_delete_staged()
returns int 
language plpgsql 
as $$ 

declare rc int;

begin 
	delete from benefitpoint.rate_field_value 
	where rate_id in (
		select distinct rate_id 
		from benefitpoint.stg_rate_field_value
	);

    get diagnostics rc = row_count;

    return rc;
end;
$$;
go 

/*** PERMISSIONS ***/
alter function benefitpoint.sp_rate_field_value_delete_staged() owner to mj_admin;
go 

grant execute on function benefitpoint.sp_rate_field_value_delete_staged() to rl_benefitpoint_x;
go 
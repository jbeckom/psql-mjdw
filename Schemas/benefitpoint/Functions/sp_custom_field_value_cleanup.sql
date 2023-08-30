create or replace function benefitpoint.sp_custom_field_value_cleanup()
returns int 
language plpgsql 
as $$

declare rc int;

begin
	DELETE FROM 	benefitpoint.custom_field_value 	AS cfv
	WHERE 	EXISTS (
		SELECT 	1
		FROM 	benefitpoint.stg_custom_field_value  
		WHERE 	cfv_source = cfv.cfv_source 
			AND source_key = cfv.source_key 
	)
		AND NOT EXISTS (
			SELECT 	1
			FROM 	benefitpoint.stg_custom_field_value 
			WHERE 	custom_field_value_id = cfv.custom_field_value_id 
				AND custom_field_id = cfv.custom_field_id
		);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
end;
$$;
go 

/*** PERMISSIONS ***/
alter function benefitpoint.sp_custom_field_value_cleanup() owner to mj_admin;
go 

grant execute on function benefitpoint.sp_custom_field_value_cleanup() to rl_benefitpoint_x;
go 
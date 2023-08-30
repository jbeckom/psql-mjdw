create or replace function benefitpoint.sp_rate_field_upsert()
returns int 
language plpgsql 
as $$ 

declare rc int;

begin 
	insert into benefitpoint.rate_field (
		 rate_field_id 
        ,label 
        ,field_type 
        ,field_value_type 
        ,rate_field_group 
        ,tiered 
        ,calculated 
	)
	select 	 rate_field_id 
			,label 
			,field_type 
			,field_value_type 
			,rate_field_group::int 
			,tiered::bool 
			,calculated::bool 
	from 	benefitpoint.stg_rate_field 
	on conflict (rate_field_id) do update 
	set 	 label 				= excluded.label 
			,field_type 		= excluded.field_type 
			,field_value_type 	= excluded.field_value_type 
			,rate_field_group 	= excluded.rate_field_group 
			,tiered 			= excluded.tiered 
			,calculated 		= excluded.calculated 
	where 	(rate_field.label,rate_field.field_type,rate_field.field_value_type,rate_field.rate_field_group,rate_field.tiered,rate_field.calculated) 
		is distinct from 	(excluded.label,excluded.field_type,excluded.field_value_type,excluded.rate_field_group,excluded.tiered,excluded.calculated); 

	get diagnostics rc = row_count;

	return rc;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.sp_rate_field_upsert() owner to mj_admin;
go 

grant execute on function benefitpoint.sp_rate_field_upsert() to rl_benefitpoint_x;
go 
create or replace function benefitpoint.sp_product_type_upsert ()
returns int 
language plpgsql 
as $$ 

declare rc int;

begin 
	insert into benefitpoint.product_type (
		 product_type_id 
        ,short_description 
        ,long_description 
        ,line_of_coverage 
        ,rate_types 
	)
	select 	 product_type_id 
			,short_description 
			,long_description 
			,line_of_coverage 
			,rate_types 
	from 	benefitpoint.stg_product_type 
	on conflict (product_type_id) do update 
	set 	 short_description 	= excluded.short_description 
			,long_description 	= excluded.long_description 
			,line_of_coverage 	= excluded.line_of_coverage 
			,rate_types 		= excluded.rate_types 
	where (product_type.short_description,product_type.long_description,product_type.line_of_coverage,product_type.rate_types) 
		is distinct from 	(excluded.short_description,excluded.long_description,excluded.line_of_coverage,excluded.rate_types); 

	get diagnostics rc = row_count;

	return rc;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.sp_product_type_upsert() owner to mj_admin;
go 

grant execute on function benefitpoint.sp_product_type_upsert() to rl_benefitpoint_x;
go 
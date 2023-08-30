create or replace function benefitpoint.sp_commission_range_upsert() 
returns int 
language plpgsql 
as $$ 

declare rc int;

begin 
	insert into benefitpoint.commission_range (
		 source_type 
        ,commission_id 
        ,value 
        ,value_unit_of_measure 
        ,from_range 
        ,to_range 
        ,sort_order 
	)
	select 	 source_type 
			,commission_id 
			,value 
			,value_unit_of_measure 
			,from_range::double precision 
			,to_range::double precision 
			,sort_order 
	from 	benefitpoint.stg_commission_range 
	on conflict (source_type,commission_id,sort_order) do update 
	set 	 value 					= excluded.value 
			,value_unit_of_measure 	= excluded.value_unit_of_measure 
			,from_range 			= excluded.from_range 
			,to_range 				= excluded.to_range 
	where 	(commission_range.value,commission_range.value_unit_of_measure,commission_range.from_range,commission_range.to_range) 
		is distinct from 	(excluded.value,excluded.value_unit_of_measure,excluded.from_range,excluded.to_range); 

	get diagnostics rc = row_count; 
	
	return rc; 
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.sp_commission_range_upsert() owner to mj_admin;
go 

grant execute on function benefitpoint.sp_commission_range_upsert() to rl_benefitpoint_x;
go 

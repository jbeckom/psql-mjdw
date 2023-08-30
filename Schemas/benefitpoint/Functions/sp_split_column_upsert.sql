create or replace function benefitpoint.sp_split_column_upsert() 
returns int 
language plpgsql 
as $$ 

declare rc int; 

begin 
	insert into benefitpoint.split_column (
		 split_id 
        ,split_column_id 
        ,split_basis_type 
        ,split_column_type 
	)
	select 	 split_id 
			,split_column_id 
			,split_basis_type 
			,split_column_type 
	from 	benefitpoint.stg_split_column 
	on conflict (split_id, split_column_id) do update 
	set 	 split_basis_type 	= excluded.split_basis_type 
        	,split_column_type 	= excluded.split_column_type 
	where 	(split_column.split_basis_type,split_column.split_column_type) 
		is distinct from 	(excluded.split_basis_type, excluded.split_column_type);

	get diagnostics rc = row_count;

	return rc;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.sp_split_column_upsert() owner to mj_admin;
go 

grant execute on function benefitpoint.sp_split_column_upsert() to rl_benefitpoint_x;
go 


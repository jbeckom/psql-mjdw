create or replace function benefitpoint.sp_split_upsert() 
returns int 
language plpgsql 
as $$ 

declare rc int;

begin 
	insert into benefitpoint.split (
		 split_id 
        ,product_ids 
        ,effective_as_of 
        ,notes 
        ,last_modified_on 
        ,created_on 
	)
	select 	 split_id 
			,product_ids 
			,effective_as_of 
			,notes 
			,last_modified_on 
			,created_on 
	from 	benefitpoint.stg_split 
	on conflict (split_id) do update 
	set  product_ids 		= excluded.product_ids 
        ,effective_as_of 	= excluded.effective_as_of 
        ,notes 				= excluded.notes 
        ,last_modified_on 	= excluded.last_modified_on 
        ,created_on 		= excluded.created_on 
	where 	(split.product_ids,split.effective_as_of,split.notes,split.last_modified_on,split.created_on) 
		is distinct from 	(excluded.product_ids,excluded.effective_as_of,excluded.notes,excluded.last_modified_on,excluded.created_on); 

	get diagnostics rc = row_count;

	return rc;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.sp_split_upsert() owner to mj_admin;
go 

grant execute on function benefitpoint.sp_split_upsert() to rl_benefitpoint_x;
go 
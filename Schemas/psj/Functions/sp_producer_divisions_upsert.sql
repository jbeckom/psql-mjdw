create or replace function psj.sp_producer_divisions_upsert() 
returns int 
language plpgsql 
as $$ 

declare rc int;

begin 
	insert into psj.producer_divisions (
		 "number" 
		,name 
		,segment 
		,"group" 
	) 
	select 	 "number" 
			,name 
			,segment 
			,"group" 
	from 	psj.stg_producer_divisions 
	on conflict ("number") 	do update 
	set 	 name 		= excluded.name 
			,segment 	= excluded.segment 
			,"group" 	= excluded."group" 
	where 	(producer_divisions.name,producer_divisions.segment,producer_divisions."group") 
		is distinct from 	(excluded.name,excluded.segment,excluded."group"); 

	get diagnostics rc = row_count;

	return rc;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function psj.sp_producer_divisions_upsert() owner to mj_admin;
go 

grant execute on function psj.sp_producer_divisions_upsert() to rl_psj_x;
go 
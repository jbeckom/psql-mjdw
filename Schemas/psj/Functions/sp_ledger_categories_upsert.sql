create or replace function psj.sp_ledger_categories_upsert() 
returns int 
language plpgsql 
as $$

declare rc int;

begin 
	insert into psj.ledger_categories (
		 "number" 
		,name 
		,category 
		,allocation 
	)
	select 	 "number" 
			,name 
			,category 
			,allocation 
	from 	psj.stg_ledger_categories
	on conflict ("number") 	do update 
	set 	 name 			= excluded.name 
			,category 		= excluded.category 
			,allocation 	= excluded.allocation 
	where 	(ledger_categories.name,ledger_categories.category,ledger_categories.allocation) 
		is distinct from 	(excluded.name,excluded.category,excluded.allocation); 

	get diagnostics rc = row_count;

	return rc;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function psj.sp_ledger_categories_upsert() owner to mj_admin;
go 

grant execute on function psj.sp_ledger_categories_upsert() to rl_psj_x;
go 
create or replace function psj.sp_retention_upsert() 
returns int 
language plpgsql 
as $$

declare rc int;

begin
	insert into psj.retention (
		 month
		,"group" 
		,expiring_accts 
		,renewed_accts 
	)
	select 	 month
			,"group" 
			,expiring_accts 
			,renewed_accts 
	from 	psj.stg_retention 
	on conflict (month,"group")	do update 
	set 	 expiring_accts 	= excluded.expiring_accts 
			,renewed_accts 		= excluded.renewed_accts 
	where 	(retention.expiring_accts,retention.renewed_accts) 
		is distinct from 	(excluded.expiring_accts,excluded.renewed_accts); 
	
	get diagnostics rc = row_count;
	
	return rc;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function psj.sp_retention_upsert() owner to mj_admin;
go 

grant execute on function psj.sp_retention_upsert() to rl_psj_x;
go 
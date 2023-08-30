create or replace function psj.sp_new_written_upsert() 
returns int 
language plpgsql 
as $$ 

declare rc int;

begin 
	insert into psj.new_written (
		 fiscal_year 
		,producer 
		,construction 
		,transportation 
		,manufacturing 
		,small_commercial 
		,indiana_eb 
		,surety 
		,arizona_eb 
		,arizona_pc 
		,energy 
		,indy_pl 
		,az_pl 
		,co_eb 
		,co_pc 
		,procourse 
	)
	select 	 fiscal_year 
			,producer 
			,construction 
			,transportation 
			,manufacturing 
			,small_commercial 
			,indiana_eb 
			,surety 
			,arizona_eb 
			,arizona_pc 
			,energy 
			,indy_pl 
			,az_pl 
			,co_eb 
			,co_pc 
			,procourse 
	from 	psj.stg_new_written 
	on conflict (fiscal_year,producer) do update 
	set 	 construction 		= excluded.construction 
			,transportation 	= excluded.transportation 
			,manufacturing 		= excluded.manufacturing 
			,small_commercial 	= excluded.small_commercial 
			,indiana_eb 		= excluded.indiana_eb 
			,surety 			= excluded.surety 
			,arizona_eb 		= excluded.arizona_eb 
			,arizona_pc 		= excluded.arizona_pc 
			,energy 			= excluded.energy 
			,indy_pl 			= excluded.indy_pl 
			,az_pl 				= excluded.az_pl 
			,co_eb 				= excluded.co_eb 
			,co_pc 				= excluded.co_pc 
			,procourse 			= excluded.procourse 
	where 	(new_written.construction,new_written.transportation,new_written.manufacturing,new_written.small_commercial,new_written.indiana_eb,new_written.surety,new_written.arizona_eb,new_written.arizona_pc,new_written.energy,new_written.indy_pl,new_written.az_pl,new_written.co_eb,new_written.co_pc,new_written.procourse) 
		is distinct from 	(excluded.construction,excluded.transportation,excluded.manufacturing,excluded.small_commercial,excluded.indiana_eb,excluded.surety,excluded.arizona_eb,excluded.arizona_pc,excluded.energy,excluded.indy_pl,excluded.az_pl,excluded.co_eb,excluded.co_pc,excluded.procourse); 

	get diagnostics rc = row_count;
	
	return rc;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function psj.sp_new_written_upsert() owner to mj_admin;
go 

grant execute on function psj.sp_new_written_upsert() to rl_psj_x;
go 
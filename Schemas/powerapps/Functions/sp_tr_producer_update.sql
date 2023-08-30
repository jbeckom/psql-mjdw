create or replace function powerapps.sp_tr_producer_update() 
returns int 
language plpgsql 
as $$

declare rc int;

begin 
	update powerapps.account 
	set total_rewards_producer = stg.producer 
	from powerapps.stg_current_producers as stg
	where stg.pol_type = 'TR'
		and account.source_key::text = stg.client_cd::text
		and (account.total_rewards_producer is null or account.total_rewards_producer != stg.producer);

	get diagnostics rc = row_count;

	return rc;
end;
$$;
go 

/*** PERMISSIONS ***/
alter function powerapps.sp_tr_producer_update() owner to mj_admin;
go 

grant execute on function powerapps.sp_tr_producer_update() to rl_powerapps_x;
go 
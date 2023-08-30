create or replace function benefitpoint.sp_payee_team_member_upsert() 
returns int 
language plpgsql 
as $$

declare rc int; 

begin 
	insert into benefitpoint.payee_team_member (
		 payee_id 
        ,team_member_id 
        ,commission 
	) 
	select 	 payee_id 
			,team_member_id 
			,commission 
	from 	benefitpoint.stg_payee_team_member 
	on conflict (payee_id, team_member_id) do update 
	set commission = excluded.commission 
	where 	(payee_team_member.commission) 
		is distinct from 	(excluded.comission); 

	get diagnostics rc = row_count;

	return rc;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.sp_payee_team_member_upsert() owner to mj_admin;
go 

grant execute on function benefitpoint.sp_payee_team_member_upsert() to rl_benefitpoint_x;
go
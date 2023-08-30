create or replace function sagitta.sp_ledger_type_codes_upsert()
returns int 
language plpgsql 
as $$

declare rc int; 

begin 
	insert into sagitta.ledger_type_codes (
		 sagitem 
		,description 
		,audit_staff_cd 
		,audit_entry_dt 
		,audit_time 
		,audit_cd 
		,audit_history_record_number 
		,audit_program 
	)
	select 	 sagitem 
			,description 
			,audit_staff_cd 
			,audit_entry_dt 
			,audit_time 
			,audit_cd 
			,audit_history_record_number 
			,audit_program 
	from 	sagitta.stg_ledger_type_codes 
	on conflict (sagitem) 	do update 
	set 	 description 					= excluded.description 
			,audit_staff_cd 				= excluded.audit_staff_cd 
			,audit_entry_dt 				= excluded.audit_entry_dt 
			,audit_time 					= excluded.audit_time 
			,audit_cd 						= excluded.audit_cd 
			,audit_history_record_number 	= excluded.audit_history_record_number 
			,audit_program 					= excluded.audit_program 
	where 	(ledger_type_codes.description,ledger_type_codes.audit_staff_cd,ledger_type_codes.audit_entry_dt,ledger_type_codes.audit_time,ledger_type_codes.audit_cd,ledger_type_codes.audit_history_record_number,ledger_type_codes.audit_program) 
		is distinct from 	(excluded.description,excluded.audit_staff_cd,excluded.audit_entry_dt,excluded.audit_time,excluded.audit_cd,excluded.audit_history_record_number,excluded.audit_program); 

	get diagnostics rc = row_count;

	return rc;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function sagitta.sp_ledger_type_codes_upsert() owner to mj_admin;
go 

grant execute on function sagitta.sp_ledger_type_codes_upsert() to rl_sagitta_x;
go 
create or replace function sagitta.sp_chart_of_accounts_master_upsert() 
returns int 
language plpgsql 
as $$

declare rc int;

begin 
	insert into sagitta.chart_of_accounts_master (
		 sagitem 
        ,audit_staff_cd 
        ,audit_entry_dt 
        ,audit_time 
        ,audit_cd 
        ,audit_history_record_number 
        ,audit_program 
        ,audit_effective_dt 
        ,audit_change_agency_id 
        ,description 
        ,normal_balance_amt 
        ,ledger_type_cd 
        ,period_end_dt 
        ,close_to_account 
        ,report_cd 
        ,base_pct 
        ,allocated_by 
        ,gl_account_number 
	)
    select   sagitem 
            ,audit_staff_cd 
            ,audit_entry_dt 
            ,audit_time 
            ,audit_cd 
            ,audit_history_record_number 
            ,audit_program 
            ,audit_effective_dt 
            ,audit_change_agency_id 
            ,description 
            ,normal_balance_amt 
            ,ledger_type_cd 
            ,period_end_dt 
            ,close_to_account 
            ,report_cd 
            ,base_pct 
            ,allocated_by 
            ,gl_account_number 
	from 	sagitta.stg_chart_of_accounts_master 
	on conflict (sagitem) do update 
	set 	 audit_staff_cd 				= excluded.audit_staff_cd 
			,audit_entry_dt 				= excluded.audit_entry_dt 
			,audit_time 					= excluded.audit_time 
			,audit_cd 						= excluded.audit_cd 
			,audit_history_record_number 	= excluded.audit_history_record_number 
			,audit_program 					= excluded.audit_program 
			,audit_effective_dt 			= excluded.audit_effective_dt 
			,audit_change_agency_id 		= excluded.audit_change_agency_id 
			,description 					= excluded.description 
			,normal_balance_amt 			= excluded.normal_balance_amt 
			,ledger_type_cd 				= excluded.ledger_type_cd 
			,period_end_dt 					= excluded.period_end_dt 
			,close_to_account 				= excluded.close_to_account 
			,report_cd 						= excluded.report_cd 
			,base_pct 						= excluded.base_pct 
			,allocated_by 					= excluded.allocated_by 
			,gl_account_number 				= excluded.gl_account_number 
	where 	(chart_of_accounts_master.audit_staff_cd,chart_of_accounts_master.audit_entry_dt,chart_of_accounts_master.audit_time,chart_of_accounts_master.audit_cd,chart_of_accounts_master.audit_history_record_number,chart_of_accounts_master.audit_program,chart_of_accounts_master.audit_effective_dt,chart_of_accounts_master.audit_change_agency_id,chart_of_accounts_master.description,chart_of_accounts_master.normal_balance_amt,chart_of_accounts_master.ledger_type_cd,chart_of_accounts_master.period_end_dt,chart_of_accounts_master.close_to_account,chart_of_accounts_master.report_cd,chart_of_accounts_master.base_pct,chart_of_accounts_master.allocated_by,chart_of_accounts_master.gl_account_number) 
		is distinct from 	(excluded.audit_staff_cd,excluded.audit_entry_dt,excluded.audit_time,excluded.audit_cd,excluded.audit_history_record_number,excluded.audit_program,excluded.audit_effective_dt,excluded.audit_change_agency_id,excluded.description,excluded.normal_balance_amt,excluded.ledger_type_cd,excluded.period_end_dt,excluded.close_to_account,excluded.report_cd,excluded.base_pct,excluded.allocated_by,excluded.gl_account_number); 

	get diagnostics rc = row_count;

	return rc;
end;
$$;
go 

/*** PERMISSIONS ***/
alter function sagitta.sp_chart_of_accounts_master_upsert() owner to mj_admin;
go 

grant execute on function sagitta.sp_chart_of_accounts_master_upsert() to rl_sagitta_x;
go 
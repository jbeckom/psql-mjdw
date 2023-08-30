create or replace function sagitta.sp_premiums_transaction_cd_info_upsert()
returns int 
language plpgsql 
as $$ 

declare rc int;

begin
	insert into sagitta.premiums_transaction_cd_info (
		 sagitem 
		,lis 
		,transaction_cd 
		,transaction_effective_dt 
		,transaction_entry_dt 
		,transaction_amt 
		,agency_pct 
		,agency_amt 
		,producer_cd 
		,producer_pct 
		,producer_amt 
		,annualize_dt 
		,invoice_number 
		,sales_id 
		,ar_id 
		,previous_posted_ind 
		,staff_cd 
		,department_cd 
		,bill_to_cd 
		,payee_cd 
		,coverage_cd 
		,insurer_cd 
	)
	select 	 sagitem 
			,lis 
			,transaction_cd 
			,transaction_effective_dt 
			,transaction_entry_dt 
			,transaction_amt 
			,agency_pct 
			,agency_amt 
			,producer_cd 
			,producer_pct 
			,producer_amt 
			,annualize_dt 
			,invoice_number 
			,sales_id 
			,ar_id 
			,previous_posted_ind 
			,staff_cd 
			,department_cd 
			,bill_to_cd 
			,payee_cd 
			,coverage_cd 
			,insurer_cd 
	from 	sagitta.stg_premiums_transaction_cd_info 
	on conflict (sagitem,lis) do update 
	set 	 transaction_cd 			= excluded.transaction_cd 
			,transaction_effective_dt 	= excluded.transaction_effective_dt 
			,transaction_entry_dt 		= excluded.transaction_entry_dt 
			,transaction_amt 			= excluded.transaction_amt 
			,agency_pct 				= excluded.agency_pct 
			,agency_amt 				= excluded.agency_amt 
			,producer_cd 				= excluded.producer_cd 
			,producer_pct 				= excluded.producer_pct 
			,producer_amt 				= excluded.producer_amt 
			,annualize_dt 				= excluded.annualize_dt 
			,invoice_number 			= excluded.invoice_number 
			,sales_id 					= excluded.sales_id 
			,ar_id 						= excluded.ar_id 
			,previous_posted_ind 		= excluded.previous_posted_ind 
			,staff_cd 					= excluded.staff_cd 
			,department_cd 				= excluded.department_cd 
			,bill_to_cd 				= excluded.bill_to_cd 
			,payee_cd 					= excluded.payee_cd 
			,coverage_cd 				= excluded.coverage_cd 
			,insurer_cd 				= excluded.insurer_cd 
	where 	(premiums_transaction_cd_info.transaction_cd,premiums_transaction_cd_info.transaction_effective_dt,premiums_transaction_cd_info.transaction_entry_dt,premiums_transaction_cd_info.transaction_amt,premiums_transaction_cd_info.agency_pct,premiums_transaction_cd_info.agency_amt,premiums_transaction_cd_info.producer_cd,premiums_transaction_cd_info.producer_pct,premiums_transaction_cd_info.producer_amt,premiums_transaction_cd_info.annualize_dt,premiums_transaction_cd_info.invoice_number,premiums_transaction_cd_info.sales_id,premiums_transaction_cd_info.ar_id,premiums_transaction_cd_info.previous_posted_ind,premiums_transaction_cd_info.staff_cd,premiums_transaction_cd_info.department_cd,premiums_transaction_cd_info.bill_to_cd,premiums_transaction_cd_info.payee_cd,premiums_transaction_cd_info.coverage_cd,premiums_transaction_cd_info.insurer_cd) 
		is distinct from 	(excluded.transaction_cd,excluded.transaction_effective_dt,excluded.transaction_entry_dt,excluded.transaction_amt,excluded.agency_pct,excluded.agency_amt,excluded.producer_cd,excluded.producer_pct,excluded.producer_amt,excluded.annualize_dt,excluded.invoice_number,excluded.sales_id,excluded.ar_id,excluded.previous_posted_ind,excluded.staff_cd,excluded.department_cd,excluded.bill_to_cd,excluded.payee_cd,excluded.coverage_cd,excluded.insurer_cd); 

	get diagnostics rc = row_count;

	return rc;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function sagitta.sp_premiums_transaction_cd_info_upsert() owner to mj_admin;
go

grant execute on function sagitta.sp_premiums_transaction_cd_info_upsert() to rl_sagitta_x;
go 
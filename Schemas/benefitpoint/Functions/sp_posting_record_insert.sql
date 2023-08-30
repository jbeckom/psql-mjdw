create or replace function benefitpoint.sp_posting_record_insert() 
returns int 
language plpgsql 
as $$ 

declare rc int;

begin 
	insert into benefitpoint.posting_record (
		 posting_record_id 
		,statement_id 
		,effective_as_of 
		,posted_on 
		,posted_amount 
		,voided_record 
		,voided_posting_record_id 
		,split_column_type 
		,split_basis_type 
		,accept_tolerance 
		,statement_split 
		,statement_entry_id 
		,accounting_month 
	)
	select 	 posting_record_id 
			,statement_id 
			,effective_as_of 
			,posted_on 
			,posted_amount 
			,voided_record::bool 
			,voided_posting_record_id::int 
			,split_column_type 
			,split_basis_type 
			,accept_tolerance::bool 
			,statement_split::bool 
			,statement_entry_id::bigint 
			,accounting_month::date
	from 	benefitpoint.stg_posting_record; 

	get diagnostics rc = row_count;

	return rc;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.sp_posting_record_insert() owner to mj_admin;
go 

grant execute on function benefitpoint.sp_posting_record_insert() to rl_benefitpoint_x;
go 
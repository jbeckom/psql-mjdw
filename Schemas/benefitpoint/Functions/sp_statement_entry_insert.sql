create or replace function benefitpoint.sp_statement_entry_insert()
returns int 
language plpgsql 
as $$ 

declare rc int;

begin 
	insert into benefitpoint.statement_entry (
		 statement_id 
		,statement_entry_id 
		,product_id 
		,activity_log_record_id 
		,statement_split_id 
		,revenue_amount 
		,premium_amount 
		,apply_to_date 
		,posted 
		,num_of_lives 
		,split_column_type 
		,override 
		,sagitta_transaction_code 
	)
	select 	 statement_id 
			,statement_entry_id 
			,product_id 
			,activity_log_record_id::int 
			,statement_split_id::int 
			,revenue_amount::decimal 
			,premium_amount::decimal 
			,apply_to_date 
			,posted::bool 
			,num_of_lives::bigint 
			,split_column_type 
			,override::bool 
			,sagitta_transaction_code
	from 	benefitpoint.stg_statement_entry; 

    get diagnostics rc = row_count;

    return rc;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.sp_statement_entry_insert() owner to mj_admin;
go 

grant execute on function benefitpoint.sp_statement_entry_insert() to rl_benefitpoint_x;
go 

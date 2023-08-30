create or replace function benefitpoint.sp_payee_upsert() 
returns int 
language plpgsql 
as $$ 

declare rc int;

begin 
	insert into benefitpoint.payee (
		 payee_id 
		,payee_type 
		,payee_code 
		,house_account 
		,tax_payer_id_number 
		,revenue_goal 
		,commission_goal 
		,renewal_revenue_goal 
		,renewal_commission_goal 
		,replacement_revenue_goal 
		,replacement_commission_goal 
		,notes 
		,include_in_book_of_business 
		,over_payement_payee 
		,internal_payee 
		,last_modified_on 
		,created_on 
	)
	select 	 payee_id 
			,payee_type 
			,payee_code 
			,house_account::bool 
			,tax_payer_id_number 
			,revenue_goal::double precision
			,commission_goal::double precision 
			,renewal_revenue_goal::double precision
			,renewal_commission_goal::double precision 
			,replacement_revenue_goal::double precision 
			,replacement_commission_goal::double precision
			,notes 
			,include_in_book_of_business::bool 
			,over_payement_payee::bool 
			,internal_payee::bool 
			,last_modified_on::timestamp 
			,created_on::timestamp 
	from 	benefitpoint.stg_payee 
	on conflict (payee_id) do update 
	set 	 payee_type 					= excluded.payee_type 
			,payee_code 					= excluded.payee_code 
			,house_account 					= excluded.house_account 
			,tax_payer_id_number 			= excluded.tax_payer_id_number 
			,revenue_goal 					= excluded.revenue_goal 
			,commission_goal 				= excluded.commission_goal 
			,renewal_revenue_goal 			= excluded.renewal_revenue_goal 
			,renewal_commission_goal 		= excluded.renewal_commission_goal 
			,replacement_revenue_goal 		= excluded.replacement_revenue_goal 
			,replacement_commission_goal 	= excluded.replacement_commission_goal 
			,notes 							= excluded.notes 
			,include_in_book_of_business 	= excluded.include_in_book_of_business 
			,over_payement_payee 			= excluded.over_payement_payee 
			,internal_payee 				= excluded.internal_payee 
			,last_modified_on 				= excluded.last_modified_on 
			,created_on 					= excluded.created_on 
	where 	(payee.payee_type,payee.payee_code,payee.house_account,payee.tax_payer_id_number,payee.revenue_goal,payee.commission_goal,payee.renewal_revenue_goal,payee.renewal_commission_goal,payee.replacement_revenue_goal,payee.replacement_commission_goal,payee.notes,payee.include_in_book_of_business,payee.over_payement_payee,payee.internal_payee,payee.last_modified_on,payee.created_on) 
		is distinct from 	(excluded.payee_type,excluded.payee_code,excluded.house_account,excluded.tax_payer_id_number,excluded.revenue_goal,excluded.commission_goal,excluded.renewal_revenue_goal,excluded.renewal_commission_goal,excluded.replacement_revenue_goal,excluded.replacement_commission_goal,excluded.notes,excluded.include_in_book_of_business,excluded.over_payement_payee,excluded.internal_payee,excluded.last_modified_on,excluded.created_on); 

	get diagnostics rc = row_count;

	return rc;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.sp_payee_upsert() owner to mj_admin;
go 

grant execute on function benefitpoint.sp_payee_upsert() to rl_benefitpoint_x;
go 
create or replace function sagitta.sp_payees_upsert() 
returns int 
language plpgsql 
as $$

declare rc int;

begin
	insert into sagitta.payees (
		 sagitem 
		,audit_staff_cd
		,audit_entry_dt
		,audit_time
		,audit_cd
		,audit_history_record_number
		,audit_program
		,audit_effective_dt
		,payee_name
		,initial_dt
		,contact_name
		,addr_1
		,addr_2
		,postal_code
		,postal_extension_code
		,city
		,state_prov_cd
		,phone_1_number
		,phone_2_number
		,agency_cd
		,pay_method_cd
		,num_days
		,fax_number
		,phone_1_extention_number
		,phone_2_extention_number
		,off_dt
		,direct_bill_ind
		,release_ind
		,email_addr
		,description
		,mga
		,global
		,payee_responsible_for_filing
		,tax_fee_payee
	)
	select 	 sagitem 
			,audit_staff_cd
			,audit_entry_dt
			,audit_time
			,audit_cd
			,audit_history_record_number
			,audit_program
			,audit_effective_dt
			,payee_name
			,initial_dt
			,contact_name
			,addr_1
			,addr_2
			,postal_code
			,postal_extension_code
			,city
			,state_prov_cd
			,phone_1_number
			,phone_2_number
			,agency_cd
			,pay_method_cd
			,num_days
			,fax_number
			,phone_1_extention_number
			,phone_2_extention_number
			,off_dt
			,direct_bill_ind
			,release_ind
			,email_addr
			,description
			,mga
			,global
			,payee_responsible_for_filing
			,tax_fee_payee
	from sagitta.stg_payees 
	on conflict (sagitem) do update 
	set 	 audit_staff_cd 				= excluded.audit_staff_cd
			,audit_entry_dt 				= excluded.audit_entry_dt
			,audit_time 					= excluded.audit_time
			,audit_cd 						= excluded.audit_cd
			,audit_history_record_number 	= excluded.audit_history_record_number
			,audit_program 					= excluded.audit_program
			,audit_effective_dt 			= excluded.audit_effective_dt
			,payee_name 					= excluded.payee_name
			,initial_dt 					= excluded.initial_dt
			,contact_name 					= excluded.contact_name
			,addr_1 						= excluded.addr_1
			,addr_2 						= excluded.addr_2
			,postal_code 					= excluded.postal_code
			,postal_extension_code 			= excluded.postal_extension_code
			,city 							= excluded.city
			,state_prov_cd 					= excluded.state_prov_cd
			,phone_1_number 				= excluded.phone_1_number
			,phone_2_number 				= excluded.phone_2_number
			,agency_cd 						= excluded.agency_cd
			,pay_method_cd 					= excluded.pay_method_cd
			,num_days 						= excluded.num_days
			,fax_number 					= excluded.fax_number
			,phone_1_extention_number 		= excluded.phone_1_extention_number
			,phone_2_extention_number 		= excluded.phone_2_extention_number
			,off_dt 						= excluded.off_dt
			,direct_bill_ind 				= excluded.direct_bill_ind
			,release_ind 					= excluded.release_ind
			,email_addr 					= excluded.email_addr
			,description 					= excluded.description
			,mga 							= excluded.mga
			,global 						= excluded.global
			,payee_responsible_for_filing 	= excluded.payee_responsible_for_filing
			,tax_fee_payee 					= excluded.tax_fee_payee
	where 	(payees.audit_staff_cd,payees.audit_entry_dt,payees.audit_time,payees.audit_cd,payees.audit_history_record_number,payees.audit_program,payees.audit_effective_dt,payees.payee_name,payees.initial_dt,payees.contact_name,payees.addr_1,payees.addr_2,payees.postal_code,payees.postal_extension_code,payees.city,payees.state_prov_cd,payees.phone_1_number,payees.phone_2_number,payees.agency_cd,payees.pay_method_cd,payees.num_days,payees.fax_number,payees.phone_1_extention_number,payees.phone_2_extention_number,payees.off_dt,payees.direct_bill_ind,payees.release_ind,payees.email_addr,payees.description,payees.mga,payees.global,payees.payee_responsible_for_filing,payees.tax_fee_payee) 
		is distinct from 	(excluded.audit_staff_cd,excluded.audit_entry_dt,excluded.audit_time,excluded.audit_cd,excluded.audit_history_record_number,excluded.audit_program,excluded.audit_effective_dt,excluded.payee_name,excluded.initial_dt,excluded.contact_name,excluded.addr_1,excluded.addr_2,excluded.postal_code,excluded.postal_extension_code,excluded.city,excluded.state_prov_cd,excluded.phone_1_number,excluded.phone_2_number,excluded.agency_cd,excluded.pay_method_cd,excluded.num_days,excluded.fax_number,excluded.phone_1_extention_number,excluded.phone_2_extention_number,excluded.off_dt,excluded.direct_bill_ind,excluded.release_ind,excluded.email_addr,excluded.description,excluded.mga,excluded.global,excluded.payee_responsible_for_filing,excluded.tax_fee_payee); 

	get diagnostics rc = row_count;

	return rc;
end;
$$;
go 

/*** PERMISSIONS ***/
alter function sagitta.sp_payees_upsert() owner to mj_admin;
go 

grant execute on function sagitta.sp_payees_upsert() to rl_sagitta_x;
go 

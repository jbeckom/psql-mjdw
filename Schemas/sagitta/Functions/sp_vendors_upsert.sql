create or replace function sagitta.sp_vendors_upsert() 
returns int 
language plpgsql 
as $$

declare rc int;

begin 
	insert into sagitta.vendors (
		 sagitem 
        ,audit_staff_cd 
        ,audit_entry_dt 
        ,audit_time 
        ,audit_cd 
        ,audit_history_record_number 
        ,audit_program 
        ,vendor_name_1 
        ,vendor_name_2 
        ,vendor_addr_1 
        ,vendor_addr_2 
        ,postal_code 
        ,postal_extension_code 
        ,vendor_city 
        ,vendor_state 
        ,vendor_phone_number 
        ,vendor_fax_number 
        ,vendor_tax_id 
        ,vendor_require_1099_ind 
        ,vendor_credit_term 
        ,vendor_status 
        ,vendor_contact_name 
        ,bank_cd 
        ,vendor_type_cd 
        ,voucher_print_ind 
        ,insurer_ap_void_ind 
        ,vendor_off_dt 
        ,vendor_off_dt_remark_text 
        ,insurer_db_rec_ind 
        ,producer_db_pay_ind 
        ,vendor_print_gl_number 
        ,ins_db_method 
        ,vendor_igl_ind 
        ,producer_ab_pay_ind 
        ,broker 
	)
	select 	 sagitem 
			,audit_staff_cd 
			,audit_entry_dt 
			,audit_time 
			,audit_cd 
			,audit_history_record_number 
			,audit_program 
			,vendor_name_1 
			,vendor_name_2 
			,vendor_addr_1 
			,vendor_addr_2 
			,postal_code 
			,postal_extension_code 
			,vendor_city 
			,vendor_state 
			,vendor_phone_number 
			,vendor_fax_number 
			,vendor_tax_id 
			,vendor_require_1099_ind 
			,vendor_credit_term 
			,vendor_status 
			,vendor_contact_name 
			,bank_cd 
			,vendor_type_cd 
			,voucher_print_ind 
			,insurer_ap_void_ind 
			,vendor_off_dt 
			,vendor_off_dt_remark_text 
			,insurer_db_rec_ind 
			,producer_db_pay_ind 
			,vendor_print_gl_number 
			,ins_db_method 
			,vendor_igl_ind 
			,producer_ab_pay_ind 
			,broker 
	from 	sagitta.stg_vendors 
	on conflict (sagitem) do update 
	set 	 audit_staff_cd 				= excluded.audit_staff_cd 
			,audit_entry_dt 				= excluded.audit_entry_dt 
			,audit_time 					= excluded.audit_time 
			,audit_cd 						= excluded.audit_cd 
			,audit_history_record_number 	= excluded.audit_history_record_number 
			,audit_program 					= excluded.audit_program 
			,vendor_name_1 					= excluded.vendor_name_1 
			,vendor_name_2 					= excluded.vendor_name_2 
			,vendor_addr_1 					= excluded.vendor_addr_1 
			,vendor_addr_2 					= excluded.vendor_addr_2 
			,postal_code 					= excluded.postal_code 
			,postal_extension_code 			= excluded.postal_extension_code 
			,vendor_city 					= excluded.vendor_city 
			,vendor_state 					= excluded.vendor_state 
			,vendor_phone_number 			= excluded.vendor_phone_number 
			,vendor_fax_number 				= excluded.vendor_fax_number 
			,vendor_tax_id 					= excluded.vendor_tax_id 
			,vendor_require_1099_ind 		= excluded.vendor_require_1099_ind 
			,vendor_credit_term 			= excluded.vendor_credit_term 
			,vendor_status 					= excluded.vendor_status 
			,vendor_contact_name 			= excluded.vendor_contact_name 
			,bank_cd 						= excluded.bank_cd 
			,vendor_type_cd 				= excluded.vendor_type_cd 
			,voucher_print_ind 				= excluded.voucher_print_ind 
			,insurer_ap_void_ind 			= excluded.insurer_ap_void_ind 
			,vendor_off_dt 					= excluded.vendor_off_dt 
			,vendor_off_dt_remark_text 		= excluded.vendor_off_dt_remark_text 
			,insurer_db_rec_ind 			= excluded.insurer_db_rec_ind 
			,producer_db_pay_ind 			= excluded.producer_db_pay_ind 
			,vendor_print_gl_number 		= excluded.vendor_print_gl_number 
			,ins_db_method 					= excluded.ins_db_method 
			,vendor_igl_ind 				= excluded.vendor_igl_ind 
			,producer_ab_pay_ind 			= excluded.producer_ab_pay_ind 
			,broker 						= excluded.broker 
	where 	(vendors.audit_staff_cd,vendors.audit_entry_dt,vendors.audit_time,vendors.audit_cd,vendors.audit_history_record_number,vendors.audit_program,vendors.vendor_name_1,vendors.vendor_name_2,vendors.vendor_addr_1,vendors.vendor_addr_2,vendors.postal_code,vendors.postal_extension_code,vendors.vendor_city,vendors.vendor_state,vendors.vendor_phone_number,vendors.vendor_fax_number,vendors.vendor_tax_id,vendors.vendor_require_1099_ind,vendors.vendor_credit_term,vendors.vendor_status,vendors.vendor_contact_name,vendors.bank_cd,vendors.vendor_type_cd,vendors.voucher_print_ind,vendors.insurer_ap_void_ind,vendors.vendor_off_dt,vendors.vendor_off_dt_remark_text,vendors.insurer_db_rec_ind,vendors.producer_db_pay_ind,vendors.vendor_print_gl_number,vendors.ins_db_method,vendors.vendor_igl_ind,vendors.producer_ab_pay_ind,vendors.broker) 
		is distinct from 	(excluded.audit_staff_cd,excluded.audit_entry_dt,excluded.audit_time,excluded.audit_cd,excluded.audit_history_record_number,excluded.audit_program,excluded.vendor_name_1,excluded.vendor_name_2,excluded.vendor_addr_1,excluded.vendor_addr_2,excluded.postal_code,excluded.postal_extension_code,excluded.vendor_city,excluded.vendor_state,excluded.vendor_phone_number,excluded.vendor_fax_number,excluded.vendor_tax_id,excluded.vendor_require_1099_ind,excluded.vendor_credit_term,excluded.vendor_status,excluded.vendor_contact_name,excluded.bank_cd,excluded.vendor_type_cd,excluded.voucher_print_ind,excluded.insurer_ap_void_ind,excluded.vendor_off_dt,excluded.vendor_off_dt_remark_text,excluded.insurer_db_rec_ind,excluded.producer_db_pay_ind,excluded.vendor_print_gl_number,excluded.ins_db_method,excluded.vendor_igl_ind,excluded.producer_ab_pay_ind,excluded.broker); 

	get diagnostics rc = row_count;

	return rc;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function sagitta.sp_vendors_upsert() owner to mj_admin;
go 

grant execute on function sagitta.sp_vendors_upsert() to rl_sagitta_x;
go 
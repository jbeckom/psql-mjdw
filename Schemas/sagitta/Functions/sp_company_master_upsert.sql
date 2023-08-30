create or replace function sagitta.sp_company_master_upsert() 
returns int 
language plpgsql 
as $$

declare rc int; 

begin 
	insert into sagitta.company_master (
		 sagitem 
        ,audit_staff_cd 
        ,audit_entry_dt 
        ,audit_time 
        ,audit_cd 
        ,audit_history_record_number 
        ,audit_program 
        ,division_name 
        ,addr_1 
        ,addr_2 
        ,postal_code 
        ,postal_extension_code 
        ,phone_1_number 
        ,phone_2_number 
        ,gl_format 
        ,division_gl_suspense_acct 
        ,prefill_acord_forms_yn_cd 
        ,fax_number 
        ,ny_license_code 
	)
	select 	 sagitem 
			,audit_staff_cd 
			,audit_entry_dt 
			,audit_time 
			,audit_cd 
			,audit_history_record_number 
			,audit_program 
			,division_name 
			,addr_1 
			,addr_2 
			,postal_code 
			,postal_extension_code 
			,phone_1_number 
			,phone_2_number 
			,gl_format 
			,division_gl_suspense_acct 
			,prefill_acord_forms_yn_cd 
			,fax_number 
			,ny_license_code 
    from    sagitta.stg_company_master
	on conflict (sagitem) do update 
	set 	 audit_staff_cd 				= excluded.audit_staff_cd 
			,audit_entry_dt 				= excluded.audit_entry_dt 
			,audit_time 					= excluded.audit_time 
			,audit_cd 						= excluded.audit_cd 
			,audit_history_record_number 	= excluded.audit_history_record_number 
			,audit_program 					= excluded.audit_program 
			,division_name 					= excluded.division_name 
			,addr_1 						= excluded.addr_1 
			,addr_2 						= excluded.addr_2 
			,postal_code 					= excluded.postal_code 
			,postal_extension_code 			= excluded.postal_extension_code 
			,phone_1_number 				= excluded.phone_1_number 
			,phone_2_number 				= excluded.phone_2_number 
			,gl_format 						= excluded.gl_format 
			,division_gl_suspense_acct 		= excluded.division_gl_suspense_acct 
			,prefill_acord_forms_yn_cd 		= excluded.prefill_acord_forms_yn_cd 
			,fax_number 					= excluded.fax_number 
			,ny_license_code 				= excluded.ny_license_code 
	where 	(company_master.audit_staff_cd,company_master.audit_entry_dt,company_master.audit_time,company_master.audit_cd,company_master.audit_history_record_number,company_master.audit_program,company_master.division_name,company_master.addr_1,company_master.addr_2,company_master.postal_code,company_master.postal_extension_code,company_master.phone_1_number,company_master.phone_2_number,company_master.gl_format,company_master.division_gl_suspense_acct,company_master.prefill_acord_forms_yn_cd,company_master.fax_number,company_master.ny_license_code) 
		is distinct from 	(excluded.audit_staff_cd,excluded.audit_entry_dt,excluded.audit_time,excluded.audit_cd,excluded.audit_history_record_number,excluded.audit_program,excluded.division_name,excluded.addr_1,excluded.addr_2,excluded.postal_code,excluded.postal_extension_code,excluded.phone_1_number,excluded.phone_2_number,excluded.gl_format,excluded.division_gl_suspense_acct,excluded.prefill_acord_forms_yn_cd,excluded.fax_number,excluded.ny_license_code); 

	get diagnostics rc = row_count;

	return rc;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function sagitta.sp_company_master_upsert() owner to mj_admin;
go 

grant execute on function sagitta.sp_company_master_upsert() to rl_sagitta_x;
go 
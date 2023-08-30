create or replace function sagitta.sp_company_master_department_upsert() 
returns int 
language plpgsql 
as $$ 

declare rc int;

begin 
	insert into sagitta.company_master_department (
		 sagitem 
        ,lis 
        ,dept_cd 
        ,dept_name 
        ,phone_number 
        ,addr_1 
        ,addr_2 
        ,postal_code 
        ,postal_extension_code 
        ,city 
        ,state_prov_cd 
        ,cb_acct_meth 
        ,create_ins_rec_yn_cd 
	)
	select 	 sagitem 
			,lis 
			,dept_cd 
			,dept_name 
			,phone_number 
			,addr_1 
			,addr_2 
			,postal_code 
			,postal_extension_code 
			,city 
			,state_prov_cd 
			,cb_acct_meth 
			,create_ins_rec_yn_cd 
	from 	sagitta.stg_company_master_department
	on conflict (sagitem,lis) do update 
	set 	 dept_cd 				= excluded.dept_cd 
			,dept_name 				= excluded.dept_name 
			,phone_number 			= excluded.phone_number 
			,addr_1 				= excluded.addr_1 
			,addr_2 				= excluded.addr_2 
			,postal_code 			= excluded.postal_code 
			,postal_extension_code 	= excluded.postal_extension_code 
			,city 					= excluded.city 
			,state_prov_cd 			= excluded.state_prov_cd 
			,cb_acct_meth 			= excluded.cb_acct_meth 
			,create_ins_rec_yn_cd 	= excluded.create_ins_rec_yn_cd 
	where 	(company_master_department.dept_cd,company_master_department.dept_name,company_master_department.phone_number,company_master_department.addr_1,company_master_department.addr_2,company_master_department.postal_code,company_master_department.postal_extension_code,company_master_department.city,company_master_department.state_prov_cd,company_master_department.cb_acct_meth,company_master_department.create_ins_rec_yn_cd) 
		is distinct from 	(excluded.dept_cd,excluded.dept_name,excluded.phone_number,excluded.addr_1,excluded.addr_2,excluded.postal_code,excluded.postal_extension_code,excluded.city,excluded.state_prov_cd,excluded.cb_acct_meth,excluded.create_ins_rec_yn_cd); 

	get diagnostics rc = row_count;

	return rc;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function sagitta.sp_company_master_department_upsert() owner to mj_admin;
go 

grant execute on function sagitta.sp_company_master_department_upsert() to rl_sagitta_x;
go 
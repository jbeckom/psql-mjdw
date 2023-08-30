create or replace function sagitta.tr_audit_company_master_department_d()
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_company_master_department (
         sagitem 
        ,lis 
        ,old_dept_cd 
        ,old_dept_name 
        ,old_phone_number 
        ,old_addr_1 
        ,old_addr_2 
        ,old_postal_code 
        ,old_postal_extension_code 
        ,old_city 
        ,old_state_prov_cd 
        ,old_cb_acct_meth 
        ,old_create_ins_rec_yn_cd 
        ,audit_action 
    )
    select   old.sagitem 
            ,old.lis 
            ,old.dept_cd 
            ,old.dept_name 
            ,old.phone_number 
            ,old.addr_1 
            ,old.addr_2 
            ,old.postal_code 
            ,old.postal_extension_code 
            ,old.city 
            ,old.state_prov_cd 
            ,old.cb_acct_meth 
            ,old.create_ins_rec_yn_cd 
            ,'D'; 
    return old;
end; 
$$ 
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_company_master_department_d() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_company_master_department_d() to rl_sagitta_x;
go 
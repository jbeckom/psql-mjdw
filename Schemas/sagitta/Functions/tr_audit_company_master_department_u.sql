create or replace function sagitta.tr_audit_company_master_department_u()
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_company_master_department (
         sagitem 
        ,lis 
        ,old_dept_cd 
        ,new_dept_cd 
        ,old_dept_name 
        ,new_dept_name 
        ,old_phone_number 
        ,new_phone_number 
        ,old_addr_1 
        ,new_addr_1 
        ,old_addr_2 
        ,new_addr_2 
        ,old_postal_code 
        ,new_postal_code 
        ,old_postal_extension_code 
        ,new_postal_extension_code 
        ,old_city 
        ,new_city 
        ,old_state_prov_cd 
        ,new_state_prov_cd 
        ,old_cb_acct_meth 
        ,new_cb_acct_meth 
        ,old_create_ins_rec_yn_cd 
        ,new_create_ins_rec_yn_cd 
        ,audit_action 
    )
    select   old.sagitem 
            ,old.lis 
            ,old.dept_cd 
            ,new.dept_cd 
            ,old.dept_name 
            ,new.dept_name 
            ,old.phone_number 
            ,new.phone_number 
            ,old.addr_1 
            ,new.addr_1 
            ,old.addr_2 
            ,new.addr_2 
            ,old.postal_code 
            ,new.postal_code 
            ,old.postal_extension_code 
            ,new.postal_extension_code 
            ,old.city 
            ,new.city 
            ,old.state_prov_cd 
            ,new.state_prov_cd 
            ,old.cb_acct_meth 
            ,new.cb_acct_meth 
            ,old.create_ins_rec_yn_cd 
            ,new.create_ins_rec_yn_cd 
            ,'U'; 
    return old;
end; 
$$ 
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_company_master_department_u() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_company_master_department_u() to rl_sagitta_x;
go 
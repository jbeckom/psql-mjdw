create or replace function sagitta.tr_audit_company_master_department_i()
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_company_master_department (
         sagitem 
        ,lis 
        ,new_dept_cd 
        ,new_dept_name 
        ,new_phone_number 
        ,new_addr_1 
        ,new_addr_2 
        ,new_postal_code 
        ,new_postal_extension_code 
        ,new_city 
        ,new_state_prov_cd 
        ,new_cb_acct_meth 
        ,new_create_ins_rec_yn_cd 
        ,audit_action 
    )
    select   new.sagitem 
            ,new.lis 
            ,new.dept_cd 
            ,new.dept_name 
            ,new.phone_number 
            ,new.addr_1 
            ,new.addr_2 
            ,new.postal_code 
            ,new.postal_extension_code 
            ,new.city 
            ,new.state_prov_cd 
            ,new.cb_acct_meth 
            ,new.create_ins_rec_yn_cd 
            ,'I'; 
    return new;
end; 
$$ 
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_company_master_department_i() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_company_master_department_i() to rl_sagitta_x;
go 
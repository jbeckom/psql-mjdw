create or replace function sagitta.tr_audit_vendors_apgl_account_info_d() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_vendors_apgl_account_info (
         sagitem 
        ,lis 
        ,old_vendor_apgl_acct_number 
        ,old_vendor_ap_dept_ind 
        ,audit_action 
    )
    select   old.sagitem 
            ,old.lis 
            ,old.vendor_apgl_acct_number 
            ,old.vendor_ap_dept_ind 
            ,'D';
    return old;
end; 
$$; 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_vendors_apgl_account_info_d() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_vendors_apgl_account_info_d() to rl_sagitta_x;
go 
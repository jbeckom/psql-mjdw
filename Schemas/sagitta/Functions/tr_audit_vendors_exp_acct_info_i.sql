create or replace function sagitta.tr_audit_vendors_exp_acct_info_i() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_vendors_exp_acct_info (
         sagitem 
        ,lis 
        ,new_vendor_exp_acct_number 
        ,new_vendor_exp_dept_ind 
        ,audit_action 
    )
    select   new.sagitem 
            ,new.lis 
            ,new.vendor_exp_acct_number 
            ,new.vendor_exp_dept_ind 
            ,'I';
    return new; 
end;
$$;
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_vendors_exp_acct_info_i() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_vendors_exp_acct_info_i() to rl_sagitta_x;
go 
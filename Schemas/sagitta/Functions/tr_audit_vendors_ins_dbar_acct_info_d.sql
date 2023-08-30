create or replace function sagitta.tr_audit_vendors_ins_dbar_acct_info_d() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_vendors_ins_dbar_acct_info (
         sagitem 
        ,lis 
        ,old_ins_dbar_acct_number 
        ,old_ins_dbar_dept_ind 
        ,audit_action 
    )
    select   old.sagitem 
            ,old.lis 
            ,old.ins_dbar_acct_number 
            ,old.ins_dbar_dept_ind 
            ,'D'; 
    return old;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_vendors_ins_dbar_acct_info_d() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_vendors_ins_dbar_acct_info_d() to rl_sagitta_x;
go 
create or replace function sagitta.tr_audit_vendors_producer_dbap_acct_info_d() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_vendors_producer_dbap_acct_info(
         sagitem 
        ,lis 
        ,old_producer_dbap_acct_number 
        ,old_producer_dbap_dept_ind 
        ,audit_action 
    )
    select   old.sagitem 
            ,old.lis 
            ,old.producer_dbap_acct_number 
            ,old.producer_dbap_dept_ind 
            ,'D';
    return old; 
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_vendors_producer_dbap_acct_info_d() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_vendors_producer_dbap_acct_info_d() to rl_sagitta_x;
go
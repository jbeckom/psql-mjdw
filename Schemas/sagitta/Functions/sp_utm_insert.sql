create or replace function sagitta.sp_utm_insert ()
returns int 
language plpgsql 
as $$

declare rc int;

begin 
    insert into sagitta.utm (
         sagitem 
        ,source_code 
        ,posting_date 
        ,period_end_date 
        ,gl_acct_no 
        ,debit_amount 
        ,credit_amount 
        ,div 
        ,document_ref 
        ,vendor_code 
        ,client_code 
        ,transfer_journal 
        ,transfer_date 
        ,audit_info 
        ,tracking_client 
        ,ins 
        ,tracking_vendor 
        ,emp 
        ,program 
    )
    select   sagitem 
            ,source_code 
            ,posting_date 
            ,period_end_date 
            ,gl_acct_no 
            ,debit_amount 
            ,credit_amount 
            ,div 
            ,document_ref 
            ,vendor_code 
            ,client_code 
            ,transfer_journal 
            ,transfer_date 
            ,audit_info 
            ,tracking_client 
            ,ins 
            ,tracking_vendor 
            ,emp 
            ,program 
    from    sagitta.stg_utm
    on conflict (sagitem) do nothing;

    get diagnostics rc = row_count;

    return rc;
end;
$$;
go 

/*** PERMISSIONS ***/
alter function sagitta.sp_utm_insert() owner to mj_admin;
go 

grant execute on function sagitta.sp_utm_insert() to rl_sagitta_x;
go 

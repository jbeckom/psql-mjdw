create or replace function sagitta.sp_vendors_producer_b_exp_acct_info_upsert() 
returns int 
language plpgsql 
as $$

declare rc int;

begin 
    insert into sagitta.vendors_producer_b_exp_acct_info (
         sagitem 
        ,lis 
        ,producer_b_exp_acct_number 
        ,producer_db_exp_dept_ind 
    )
    select   sagitem 
            ,lis 
            ,producer_b_exp_acct_number 
            ,producer_db_exp_dept_ind 
    from    sagitta.stg_vendors_producer_b_exp_acct_info
    on conflict (sagitem,lis) do update 
    set      producer_b_exp_acct_number     = excluded.producer_b_exp_acct_number 
            ,producer_db_exp_dept_ind       = excluded.producer_db_exp_dept_ind 
    where   (vendors_producer_b_exp_acct_info.producer_b_exp_acct_number,vendors_producer_b_exp_acct_info.producer_db_exp_dept_ind) 
        is distinct from    (excluded.producer_b_exp_acct_number,excluded.producer_db_exp_dept_ind); 

    get diagnostics rc = row_count;

    return rc;
end; 
$$;
go 

/*** PERMISSIONS ***/
alter function sagitta.sp_vendors_producer_b_exp_acct_info_upsert() owner to mj_admin;
go

grant execute on function sagitta.sp_vendors_producer_b_exp_acct_info_upsert() to rl_sagitta_x;
go

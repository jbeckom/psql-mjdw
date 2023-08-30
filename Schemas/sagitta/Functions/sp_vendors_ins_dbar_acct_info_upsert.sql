create or replace function sagitta.sp_vendors_ins_dbar_acct_info_upsert()
returns int 
language plpgsql 
as $$ 

declare rc int;

begin 
    insert into sagitta.vendors_ins_dbar_acct_info (
         sagitem 
        ,lis 
        ,ins_dbar_acct_number 
        ,ins_dbar_dept_ind 
    )
    select   sagitem 
            ,lis 
            ,ins_dbar_acct_number 
            ,ins_dbar_dept_ind 
    from    sagitta.stg_vendors_ins_dbar_acct_info 
    on conflict (sagitem,lis) do update 
    set      ins_dbar_acct_number   = excluded.ins_dbar_acct_number 
            ,ins_dbar_dept_ind      = excluded.ins_dbar_dept_ind 
    where   (vendors_ins_dbar_acct_info.ins_dbar_acct_number,vendors_ins_dbar_acct_info.ins_dbar_dept_ind) 
        is distinct from    (excluded.ins_dbar_acct_number,excluded.ins_dbar_dept_ind); 

    get diagnostics rc = row_count;

    return rc;
end; 
$$;
go 

/*** PERMISSIONS ***/
alter function sagitta.sp_vendors_ins_dbar_acct_info_upsert() owner to mj_admin;
go 

grant execute on function sagitta.sp_vendors_ins_dbar_acct_info_upsert() to rl_sagitta_x;
go 
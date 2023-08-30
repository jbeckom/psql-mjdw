create or replace function sagitta.tr_audit_ol_coverages_discount_surcharge_info_d()
returns trigger 
language plpgsql 
as $$ 

begin
    insert into sagitta.audit_ol_coverages_discount_surcharge_info (
         sagitem 
        ,lis 
        ,old_discount_surcharge_code
        ,old_discount_surcharge_desc
        ,old_discount_surcharge_rate
        ,old_discount_surcharge_pct
        ,old_discount_surcharge_premium
        ,old_discount_surcharge_remarks
        ,audit_action 
    )
    select   old.sagitem 
            ,old.lis 
            ,old.discount_surcharge_code
            ,old.discount_surcharge_desc
            ,old.discount_surcharge_rate
            ,old.discount_surcharge_pct
            ,old.discount_surcharge_premium
            ,old.discount_surcharge_remarks
            ,'D';
    return old;
end;
$$;
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_ol_coverages_discount_surcharge_info_d() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_ol_coverages_discount_surcharge_info_d() to rl_sagitta_x;
go 
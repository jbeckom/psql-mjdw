create or replace function sagitta.tr_audit_ol_coverages_discount_surcharge_info_i()
returns trigger 
language plpgsql 
as $$ 

begin
    insert into sagitta.audit_ol_coverages_discount_surcharge_info (
         sagitem 
        ,lis 
        ,new_discount_surcharge_code
        ,new_discount_surcharge_desc
        ,new_discount_surcharge_rate
        ,new_discount_surcharge_pct
        ,new_discount_surcharge_premium
        ,new_discount_surcharge_remarks
        ,audit_action 
    )
    select   new.sagitem 
            ,new.lis 
            ,new.discount_surcharge_code
            ,new.discount_surcharge_desc
            ,new.discount_surcharge_rate
            ,new.discount_surcharge_pct
            ,new.discount_surcharge_premium
            ,new.discount_surcharge_remarks
            ,'I';
    return new;
end;
$$;
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_ol_coverages_discount_surcharge_info_i() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_ol_coverages_discount_surcharge_info_i() to rl_sagitta_x;
go 
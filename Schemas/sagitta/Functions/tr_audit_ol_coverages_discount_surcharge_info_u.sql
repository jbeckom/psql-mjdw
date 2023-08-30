create or replace function sagitta.tr_audit_ol_coverages_discount_surcharge_info_u()
returns trigger 
language plpgsql 
as $$ 

begin
    insert into sagitta.audit_ol_coverages_discount_surcharge_info (
         sagitem 
        ,lis 
        ,old_discount_surcharge_code
        ,new_discount_surcharge_code
        ,old_discount_surcharge_desc
        ,new_discount_surcharge_desc
        ,old_discount_surcharge_rate
        ,new_discount_surcharge_rate
        ,old_discount_surcharge_pct
        ,new_discount_surcharge_pct
        ,old_discount_surcharge_premium
        ,new_discount_surcharge_premium
        ,old_discount_surcharge_remarks
        ,new_discount_surcharge_remarks
        ,audit_action 
    )
    select   old.sagitem 
            ,old.lis 
            ,old.discount_surcharge_code 
            ,new.discount_surcharge_code
            ,old.discount_surcharge_desc 
            ,new.discount_surcharge_desc
            ,old.discount_surcharge_rate 
            ,new.discount_surcharge_rate
            ,old.discount_surcharge_pct 
            ,new.discount_surcharge_pct
            ,old.discount_surcharge_premium 
            ,new.discount_surcharge_premium
            ,old.discount_surcharge_remarks 
            ,new.discount_surcharge_remarks
            ,'U';
    return old;
end;
$$;
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_ol_coverages_discount_surcharge_info_u() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_ol_coverages_discount_surcharge_info_u() to rl_sagitta_x;
go 
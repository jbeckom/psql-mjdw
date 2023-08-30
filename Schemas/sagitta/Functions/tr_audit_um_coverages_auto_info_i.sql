create or replace function sagitta.tr_audit_um_coverages_auto_info_i() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_um_coverages_auto_info(
         sagitem 
        ,lis 
        ,new_auto_pol_seq
        ,new_auto_pol_number
        ,new_auto_insurer
        ,new_auto_insurer_name
        ,new_auto_effective_date
        ,new_auto_exp_date
        ,new_auto_any_auto_symbol
        ,new_auto_rating_mod
        ,new_auto_csl_limit
        ,new_auto_bi_limit
        ,new_auto_pd_limit
        ,new_auto_csl_ann_prem
        ,new_auto_bi_ann_prem
        ,new_pd_ann_prem 
        ,audit_action 
    )
    select   new.sagitem 
            ,new.lis 
            ,new.auto_pol_seq
            ,new.auto_pol_number
            ,new.auto_insurer
            ,new.auto_insurer_name
            ,new.auto_effective_date
            ,new.auto_exp_date
            ,new.auto_any_auto_symbol
            ,new.auto_rating_mod
            ,new.auto_csl_limit
            ,new.auto_bi_limit
            ,new.auto_pd_limit
            ,new.auto_csl_ann_prem
            ,new.auto_bi_ann_prem
            ,new.pd_ann_prem 
            ,'I';
    return new;
end;
$$;
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_um_coverages_auto_info_i() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_um_coverages_auto_info_i() to rl_sagitta_x;
go 

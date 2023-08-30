create or replace function sagitta.tr_audit_um_coverages_auto_info_d() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_um_coverages_auto_info(
         sagitem 
        ,lis 
        ,old_auto_pol_seq
        ,old_auto_pol_number
        ,old_auto_insurer
        ,old_auto_insurer_name
        ,old_auto_effective_date
        ,old_auto_exp_date
        ,old_auto_any_auto_symbol
        ,old_auto_rating_mod
        ,old_auto_csl_limit
        ,old_auto_bi_limit
        ,old_auto_pd_limit
        ,old_auto_csl_ann_prem
        ,old_auto_bi_ann_prem
        ,old_pd_ann_prem 
        ,audit_action 
    )
    select   old.sagitem 
            ,old.lis 
            ,old.auto_pol_seq
            ,old.auto_pol_number
            ,old.auto_insurer
            ,old.auto_insurer_name
            ,old.auto_effective_date
            ,old.auto_exp_date
            ,old.auto_any_auto_symbol
            ,old.auto_rating_mod
            ,old.auto_csl_limit
            ,old.auto_bi_limit
            ,old.auto_pd_limit
            ,old.auto_csl_ann_prem
            ,old.auto_bi_ann_prem
            ,old.pd_ann_prem 
            ,'D';
    return old;
end;
$$;
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_um_coverages_auto_info_d() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_um_coverages_auto_info_d() to rl_sagitta_x;
go 

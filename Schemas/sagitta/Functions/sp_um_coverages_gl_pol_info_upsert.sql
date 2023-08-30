create or replace function sagitta.sp_um_coverages_gl_pol_info_upsert() 
returns int 
language plpgsql 
as $$

declare rc int;

BEGIN
    insert into sagitta.um_coverages_gl_pol_info (
         sagitem 
        ,lis 
        ,gl_pol_seq_number
        ,gl_pol_number
        ,gl_claims_occur
        ,gl_insurer
        ,gl_insurer_name
        ,gl_effective_date
        ,gl_exp_date
        ,gl_rate_mode
        ,gl_each_occur_limit
        ,gl_gen_agg_amount
        ,gl_prod_compl_oper_limit
        ,gl_fire_damage_limit
        ,gl_med_exp_limit
        ,gl_pes_adv_inj_limit
        ,gl_prem_operations_ann_prem
        ,gl_products_ann_prem
        ,gl_other_ann_prem
    )
    select   sagitem 
            ,lis 
            ,gl_pol_seq_number
            ,gl_pol_number
            ,gl_claims_occur
            ,gl_insurer
            ,gl_insurer_name
            ,gl_effective_date
            ,gl_exp_date
            ,gl_rate_mode
            ,gl_each_occur_limit
            ,gl_gen_agg_amount
            ,gl_prod_compl_oper_limit
            ,gl_fire_damage_limit
            ,gl_med_exp_limit
            ,gl_pes_adv_inj_limit
            ,gl_prem_operations_ann_prem
            ,gl_products_ann_prem
            ,gl_other_ann_prem
    from    sagitta.stg_um_coverages_gl_pol_info
    on conflict (sagitem,lis) do update 
    set      gl_pol_seq_number              = excluded.gl_pol_seq_number
            ,gl_pol_number                  = excluded.gl_pol_number
            ,gl_claims_occur                = excluded.gl_claims_occur
            ,gl_insurer                     = excluded.gl_insurer
            ,gl_insurer_name                = excluded.gl_insurer_name
            ,gl_effective_date              = excluded.gl_effective_date
            ,gl_exp_date                    = excluded.gl_exp_date
            ,gl_rate_mode                   = excluded.gl_rate_mode
            ,gl_each_occur_limit            = excluded.gl_each_occur_limit
            ,gl_gen_agg_amount              = excluded.gl_gen_agg_amount
            ,gl_prod_compl_oper_limit       = excluded.gl_prod_compl_oper_limit
            ,gl_fire_damage_limit           = excluded.gl_fire_damage_limit
            ,gl_med_exp_limit               = excluded.gl_med_exp_limit
            ,gl_pes_adv_inj_limit           = excluded.gl_pes_adv_inj_limit
            ,gl_prem_operations_ann_prem    = excluded.gl_prem_operations_ann_prem
            ,gl_products_ann_prem           = excluded.gl_products_ann_prem
            ,gl_other_ann_prem              = excluded.gl_other_ann_prem
    where   (um_coverages_gl_pol_info.gl_pol_seq_number,um_coverages_gl_pol_info.gl_pol_number,um_coverages_gl_pol_info.gl_claims_occur,um_coverages_gl_pol_info.gl_insurer,um_coverages_gl_pol_info.gl_insurer_name,um_coverages_gl_pol_info.gl_effective_date,um_coverages_gl_pol_info.gl_exp_date,um_coverages_gl_pol_info.gl_rate_mode,um_coverages_gl_pol_info.gl_each_occur_limit,um_coverages_gl_pol_info.gl_gen_agg_amount,um_coverages_gl_pol_info.gl_prod_compl_oper_limit,um_coverages_gl_pol_info.gl_fire_damage_limit,um_coverages_gl_pol_info.gl_med_exp_limit,um_coverages_gl_pol_info.gl_pes_adv_inj_limit,um_coverages_gl_pol_info.gl_prem_operations_ann_prem,um_coverages_gl_pol_info.gl_products_ann_prem,um_coverages_gl_pol_info.gl_other_ann_prem) 
        is distinct from    (excluded.gl_pol_seq_number,excluded.gl_pol_number,excluded.gl_claims_occur,excluded.gl_insurer,excluded.gl_insurer_name,excluded.gl_effective_date,excluded.gl_exp_date,excluded.gl_rate_mode,excluded.gl_each_occur_limit,excluded.gl_gen_agg_amount,excluded.gl_prod_compl_oper_limit,excluded.gl_fire_damage_limit,excluded.gl_med_exp_limit,excluded.gl_pes_adv_inj_limit,excluded.gl_prem_operations_ann_prem,excluded.gl_products_ann_prem,excluded.gl_other_ann_prem); 

    get diagnostics rc = row_count;

    return rc;
end; 
$$;
go

/*** PERMISSIONS ***/
alter function sagitta.sp_um_coverages_gl_pol_info_upsert() owner to mj_admin;
go 

grant execute on function sagitta.sp_um_coverages_gl_pol_info_upsert() to rl_sagitta_x;
go 

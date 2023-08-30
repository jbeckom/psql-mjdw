create or replace function sagitta.tr_audit_um_coverages_gl_pol_info_u() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_um_coverages_gl_pol_info (
         sagitem 
        ,lis 
        ,old_gl_pol_seq_number
        ,new_gl_pol_seq_number
        ,old_gl_pol_number
        ,new_gl_pol_number
        ,old_gl_claims_occur
        ,new_gl_claims_occur
        ,old_gl_insurer
        ,new_gl_insurer
        ,old_gl_insurer_name
        ,new_gl_insurer_name
        ,old_gl_effective_date
        ,new_gl_effective_date
        ,old_gl_exp_date
        ,new_gl_exp_date
        ,old_gl_rate_mode
        ,new_gl_rate_mode
        ,old_gl_each_occur_limit
        ,new_gl_each_occur_limit
        ,old_gl_gen_agg_amount
        ,new_gl_gen_agg_amount
        ,old_gl_prod_compl_oper_limit
        ,new_gl_prod_compl_oper_limit
        ,old_gl_fire_damage_limit
        ,new_gl_fire_damage_limit
        ,old_gl_med_exp_limit
        ,new_gl_med_exp_limit
        ,old_gl_pes_adv_inj_limit
        ,new_gl_pes_adv_inj_limit
        ,old_gl_prem_operations_ann_prem
        ,new_gl_prem_operations_ann_prem
        ,old_gl_products_ann_prem
        ,new_gl_products_ann_prem
        ,old_gl_other_ann_prem
        ,new_gl_other_ann_prem
        ,audit_action 
    )
    select   old.sagitem 
            ,old.lis 
            ,old.gl_pol_seq_number
            ,new.gl_pol_seq_number
            ,old.gl_pol_number
            ,new.gl_pol_number
            ,old.gl_claims_occur
            ,new.gl_claims_occur
            ,old.gl_insurer
            ,new.gl_insurer
            ,old.gl_insurer_name
            ,new.gl_insurer_name
            ,old.gl_effective_date
            ,new.gl_effective_date
            ,old.gl_exp_date
            ,new.gl_exp_date
            ,old.gl_rate_mode
            ,new.gl_rate_mode
            ,old.gl_each_occur_limit
            ,new.gl_each_occur_limit
            ,old.gl_gen_agg_amount
            ,new.gl_gen_agg_amount
            ,old.gl_prod_compl_oper_limit
            ,new.gl_prod_compl_oper_limit
            ,old.gl_fire_damage_limit
            ,new.gl_fire_damage_limit
            ,old.gl_med_exp_limit
            ,new.gl_med_exp_limit
            ,old.gl_pes_adv_inj_limit
            ,new.gl_pes_adv_inj_limit
            ,old.gl_prem_operations_ann_prem
            ,new.gl_prem_operations_ann_prem
            ,old.gl_products_ann_prem
            ,new.gl_products_ann_prem
            ,old.gl_other_ann_prem
            ,new.gl_other_ann_prem
            ,'U'; 
    return old;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_um_coverages_gl_pol_info_u() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_um_coverages_gl_pol_info_u() to rl_sagitta_x;
go 
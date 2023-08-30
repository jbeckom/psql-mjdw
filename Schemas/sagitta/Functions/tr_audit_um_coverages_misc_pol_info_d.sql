create or replace function sagitta.tr_audit_um_coverages_misc_pol_info_d()
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_um_coverages_misc_pol_info(
         sagitem 
        ,lis 
        ,old_misc_pol_seq_number
        ,old_misc_pol_number
        ,old_misc_coverage_code
        ,old_misc_insurer
        ,old_misc_insurer_name
        ,old_misc_effective_date
        ,old_misc_exp_date
        ,old_misc_rate_mod
        ,old_misc_first_cov_info
        ,old_misc_first_cov_descr
        ,old_misc_first_cov_limit
        ,old_misc_second_cov_info
        ,old_misc_second_cov_descr
        ,old_misc_second_cov_limit
        ,old_acord_coverage_type
        ,audit_action 
    )
    select   old.sagitem 
            ,old.lis 
            ,old.misc_pol_seq_number
            ,old.misc_pol_number
            ,old.misc_coverage_code
            ,old.misc_insurer
            ,old.misc_insurer_name
            ,old.misc_effective_date
            ,old.misc_exp_date
            ,old.misc_rate_mod
            ,old.misc_first_cov_info
            ,old.misc_first_cov_descr
            ,old.misc_first_cov_limit
            ,old.misc_second_cov_info
            ,old.misc_second_cov_descr
            ,old.misc_second_cov_limit
            ,old.acord_coverage_type
            ,'D'; 
    return old;
end;
$$;
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_um_coverages_misc_pol_info_d() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_um_coverages_misc_pol_info_d() to rl_sagitta_x;
go 
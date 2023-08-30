create or replace function sagitta.tr_audit_um_coverages_misc_pol_info_u()
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_um_coverages_misc_pol_info(
         sagitem 
        ,lis 
        ,old_misc_pol_seq_number
        ,new_misc_pol_seq_number
        ,old_misc_pol_number
        ,new_misc_pol_number
        ,old_misc_coverage_code
        ,new_misc_coverage_code
        ,old_misc_insurer
        ,new_misc_insurer
        ,old_misc_insurer_name
        ,new_misc_insurer_name
        ,old_misc_effective_date
        ,new_misc_effective_date
        ,old_misc_exp_date
        ,new_misc_exp_date
        ,old_misc_rate_mod
        ,new_misc_rate_mod
        ,old_misc_first_cov_info
        ,new_misc_first_cov_info
        ,old_misc_first_cov_descr
        ,new_misc_first_cov_descr
        ,old_misc_first_cov_limit
        ,new_misc_first_cov_limit
        ,old_misc_second_cov_info
        ,new_misc_second_cov_info
        ,old_misc_second_cov_descr
        ,new_misc_second_cov_descr
        ,old_misc_second_cov_limit
        ,new_misc_second_cov_limit
        ,old_acord_coverage_type
        ,new_acord_coverage_type
        ,audit_action 
    )
    select   old.sagitem 
            ,old.lis 
            ,old.misc_pol_seq_number
            ,new.misc_pol_seq_number
            ,old.misc_pol_number
            ,new.misc_pol_number
            ,old.misc_coverage_code
            ,new.misc_coverage_code
            ,old.misc_insurer
            ,new.misc_insurer
            ,old.misc_insurer_name
            ,new.misc_insurer_name
            ,old.misc_effective_date
            ,new.misc_effective_date
            ,old.misc_exp_date
            ,new.misc_exp_date
            ,old.misc_rate_mod
            ,new.misc_rate_mod
            ,old.misc_first_cov_info
            ,new.misc_first_cov_info
            ,old.misc_first_cov_descr
            ,new.misc_first_cov_descr
            ,old.misc_first_cov_limit
            ,new.misc_first_cov_limit
            ,old.misc_second_cov_info
            ,new.misc_second_cov_info
            ,old.misc_second_cov_descr
            ,new.misc_second_cov_descr
            ,old.misc_second_cov_limit
            ,new.misc_second_cov_limit
            ,old.acord_coverage_type
            ,new.acord_coverage_type
            ,'U'; 
    return old;
end;
$$;
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_um_coverages_misc_pol_info_u() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_um_coverages_misc_pol_info_u() to rl_sagitta_x;
go 
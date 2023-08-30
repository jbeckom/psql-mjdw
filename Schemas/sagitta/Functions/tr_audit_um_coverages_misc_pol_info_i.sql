create or replace function sagitta.tr_audit_um_coverages_misc_pol_info_i()
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_um_coverages_misc_pol_info(
         sagitem 
        ,lis 
        ,new_misc_pol_seq_number
        ,new_misc_pol_number
        ,new_misc_coverage_code
        ,new_misc_insurer
        ,new_misc_insurer_name
        ,new_misc_effective_date
        ,new_misc_exp_date
        ,new_misc_rate_mod
        ,new_misc_first_cov_info
        ,new_misc_first_cov_descr
        ,new_misc_first_cov_limit
        ,new_misc_second_cov_info
        ,new_misc_second_cov_descr
        ,new_misc_second_cov_limit
        ,new_acord_coverage_type
        ,audit_action 
    )
    select   new.sagitem 
            ,new.lis 
            ,new.misc_pol_seq_number
            ,new.misc_pol_number
            ,new.misc_coverage_code
            ,new.misc_insurer
            ,new.misc_insurer_name
            ,new.misc_effective_date
            ,new.misc_exp_date
            ,new.misc_rate_mod
            ,new.misc_first_cov_info
            ,new.misc_first_cov_descr
            ,new.misc_first_cov_limit
            ,new.misc_second_cov_info
            ,new.misc_second_cov_descr
            ,new.misc_second_cov_limit
            ,new.acord_coverage_type
            ,'I'; 
    return new;
end;
$$;
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_um_coverages_misc_pol_info_i() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_um_coverages_misc_pol_info_i() to rl_sagitta_x;
go 
create or replace function sagitta.sp_um_coverages_misc_pol_info_upsert() 
returns int 
language plpgsql 
as $$ 

declare rc int;

begin 
    insert into sagitta.um_coverages_misc_pol_info(
         sagitem
        ,lis 
        ,misc_pol_seq_number
        ,misc_pol_number
        ,misc_coverage_code
        ,misc_insurer
        ,misc_insurer_name
        ,misc_effective_date
        ,misc_exp_date
        ,misc_rate_mod
        ,misc_first_cov_info
        ,misc_first_cov_descr
        ,misc_first_cov_limit
        ,misc_second_cov_info
        ,misc_second_cov_descr
        ,misc_second_cov_limit
        ,acord_coverage_type
    )
    select   sagitem
            ,lis 
            ,misc_pol_seq_number
            ,misc_pol_number
            ,misc_coverage_code
            ,misc_insurer
            ,misc_insurer_name
            ,misc_effective_date
            ,misc_exp_date
            ,misc_rate_mod
            ,misc_first_cov_info
            ,misc_first_cov_descr
            ,misc_first_cov_limit
            ,misc_second_cov_info
            ,misc_second_cov_descr
            ,misc_second_cov_limit
            ,acord_coverage_type
    from    sagitta.stg_um_coverages_misc_pol_info
    on conflict (sagitem,lis) do update 
    set      misc_pol_seq_number        = excluded.misc_pol_seq_number 
            ,misc_pol_number            = excluded.misc_pol_number 
            ,misc_coverage_code         = excluded.misc_coverage_code 
            ,misc_insurer               = excluded.misc_insurer 
            ,misc_insurer_name          = excluded.misc_insurer_name 
            ,misc_effective_date        = excluded.misc_effective_date 
            ,misc_exp_date              = excluded.misc_exp_date 
            ,misc_rate_mod              = excluded.misc_rate_mod 
            ,misc_first_cov_info        = excluded.misc_first_cov_info 
            ,misc_first_cov_descr       = excluded.misc_first_cov_descr 
            ,misc_first_cov_limit       = excluded.misc_first_cov_limit 
            ,misc_second_cov_info       = excluded.misc_second_cov_info 
            ,misc_second_cov_descr      = excluded.misc_second_cov_descr 
            ,misc_second_cov_limit      = excluded.misc_second_cov_limit 
            ,acord_coverage_type        = excluded.acord_coverage_type 
    where   (um_coverages_misc_pol_info.misc_pol_seq_number,um_coverages_misc_pol_info.misc_pol_number,um_coverages_misc_pol_info.misc_coverage_code,um_coverages_misc_pol_info.misc_insurer,um_coverages_misc_pol_info.misc_insurer_name,um_coverages_misc_pol_info.misc_effective_date,um_coverages_misc_pol_info.misc_exp_date,um_coverages_misc_pol_info.misc_rate_mod,um_coverages_misc_pol_info.misc_first_cov_info,um_coverages_misc_pol_info.misc_first_cov_descr,um_coverages_misc_pol_info.misc_first_cov_limit,um_coverages_misc_pol_info.misc_second_cov_info,um_coverages_misc_pol_info.misc_second_cov_descr,um_coverages_misc_pol_info.misc_second_cov_limit,um_coverages_misc_pol_info.acord_coverage_type) 
        is distinct from    (excluded.misc_pol_seq_number,excluded.misc_pol_number,excluded.misc_coverage_code,excluded.misc_insurer,excluded.misc_insurer_name,excluded.misc_effective_date,excluded.misc_exp_date,excluded.misc_rate_mod,excluded.misc_first_cov_info,excluded.misc_first_cov_descr,excluded.misc_first_cov_limit,excluded.misc_second_cov_info,excluded.misc_second_cov_descr,excluded.misc_second_cov_limit,excluded.acord_coverage_type); 

    get diagnostics rc = row_count;

    return rc;
end;
$$;
go

/*** PERMISSIONS ***/
alter function sagitta.sp_um_coverages_misc_pol_info_upsert() owner to mj_admin;
go 

grant execute on function sagitta.sp_um_coverages_misc_pol_info_upsert() to rl_sagitta_x;
go 

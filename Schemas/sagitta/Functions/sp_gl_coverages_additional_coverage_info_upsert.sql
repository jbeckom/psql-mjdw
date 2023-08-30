create or replace function sagitta.sp_gl_coverages_additional_coverage_info_upsert ()
returns int 
language plpgsql 
as $$ 

declare rc int;

begin 
    insert into sagitta.gl_coverages_additional_coverage_info (
         sagitem 
        ,lis 
        ,gl_coverage_cd
        ,hazard_number
        ,form_number
        ,edition_dt
        ,cov_1_limit 
        ,cov_2_limit
        ,deductible
        ,cov_1_type_deductible
        ,cov_1_basis_1_deductible
        ,cov_1_basis_2_deductible
        ,cov_rate
        ,premium_amt
        ,job_number
        ,num_one
        ,num_two
        ,type_dt
        ,dt
        ,coverage_desc
        ,coverage_2_deductible
        ,coverage_2_ded_type
        ,cov_2_basis_1_deductible
        ,cov_basis_2_deductible
        ,location_agency_id
        ,state_prov_cd
        ,line_1_remark_text
        ,line_2_remark_text
        ,building_num
    )
    select   sagitem 
            ,lis 
            ,gl_coverage_cd
            ,hazard_number
            ,form_number
            ,edition_dt
            ,cov_1_limit 
            ,cov_2_limit
            ,deductible
            ,cov_1_type_deductible
            ,cov_1_basis_1_deductible
            ,cov_1_basis_2_deductible
            ,cov_rate
            ,premium_amt
            ,job_number
            ,num_one
            ,num_two
            ,type_dt
            ,dt
            ,coverage_desc
            ,coverage_2_deductible
            ,coverage_2_ded_type
            ,cov_2_basis_1_deductible
            ,cov_basis_2_deductible
            ,location_agency_id
            ,state_prov_cd
            ,line_1_remark_text
            ,line_2_remark_text
            ,building_num
    from 	sagitta.stg_gl_coverages_additional_coverage_info
    on conflict (sagitem,lis) do update 
    set      gl_coverage_cd             = excluded.gl_coverage_cd
            ,hazard_number              = excluded.hazard_number
            ,form_number                = excluded.form_number
            ,edition_dt                 = excluded.edition_dt
            ,cov_1_limit                = excluded.cov_1_limit 
            ,cov_2_limit                = excluded.cov_2_limit
            ,deductible                 = excluded.deductible
            ,cov_1_type_deductible      = excluded.cov_1_type_deductible
            ,cov_1_basis_1_deductible   = excluded.cov_1_basis_1_deductible
            ,cov_1_basis_2_deductible   = excluded.cov_1_basis_2_deductible
            ,cov_rate                   = excluded.cov_rate
            ,premium_amt                = excluded.premium_amt
            ,job_number                 = excluded.job_number
            ,num_one                    = excluded.num_one
            ,num_two                    = excluded.num_two
            ,type_dt                    = excluded.type_dt
            ,dt                         = excluded.dt
            ,coverage_desc              = excluded.coverage_desc
            ,coverage_2_deductible      = excluded.coverage_2_deductible
            ,coverage_2_ded_type        = excluded.coverage_2_ded_type
            ,cov_2_basis_1_deductible   = excluded.cov_2_basis_1_deductible
            ,cov_basis_2_deductible     = excluded.cov_basis_2_deductible
            ,location_agency_id         = excluded.location_agency_id
            ,state_prov_cd              = excluded.state_prov_cd
            ,line_1_remark_text         = excluded.line_1_remark_text
            ,line_2_remark_text         = excluded.line_2_remark_text
            ,building_num               = excluded.building_num
    where   (gl_coverages_additional_coverage_info.gl_coverage_cd,gl_coverages_additional_coverage_info.hazard_number,gl_coverages_additional_coverage_info.form_number,gl_coverages_additional_coverage_info.edition_dt,gl_coverages_additional_coverage_info.cov_1_limit ,gl_coverages_additional_coverage_info.cov_2_limit,gl_coverages_additional_coverage_info.deductible,gl_coverages_additional_coverage_info.cov_1_type_deductible,gl_coverages_additional_coverage_info.cov_1_basis_1_deductible,gl_coverages_additional_coverage_info.cov_1_basis_2_deductible,gl_coverages_additional_coverage_info.cov_rate,gl_coverages_additional_coverage_info.premium_amt,gl_coverages_additional_coverage_info.job_number,gl_coverages_additional_coverage_info.num_one,gl_coverages_additional_coverage_info.num_two,gl_coverages_additional_coverage_info.type_dt,gl_coverages_additional_coverage_info.dt,gl_coverages_additional_coverage_info.coverage_desc,gl_coverages_additional_coverage_info.coverage_2_deductible,gl_coverages_additional_coverage_info.coverage_2_ded_type,gl_coverages_additional_coverage_info.cov_2_basis_1_deductible,gl_coverages_additional_coverage_info.cov_basis_2_deductible,gl_coverages_additional_coverage_info.location_agency_id,gl_coverages_additional_coverage_info.state_prov_cd,gl_coverages_additional_coverage_info.line_1_remark_text,gl_coverages_additional_coverage_info.line_2_remark_text,gl_coverages_additional_coverage_info.building_num) 
        is distinct from    (excluded.gl_coverage_cd,excluded.hazard_number,excluded.form_number,excluded.edition_dt,excluded.cov_1_limit ,excluded.cov_2_limit,excluded.deductible,excluded.cov_1_type_deductible,excluded.cov_1_basis_1_deductible,excluded.cov_1_basis_2_deductible,excluded.cov_rate,excluded.premium_amt,excluded.job_number,excluded.num_one,excluded.num_two,excluded.type_dt,excluded.dt,excluded.coverage_desc,excluded.coverage_2_deductible,excluded.coverage_2_ded_type,excluded.cov_2_basis_1_deductible,excluded.cov_basis_2_deductible,excluded.location_agency_id,excluded.state_prov_cd,excluded.line_1_remark_text,excluded.line_2_remark_text,excluded.building_num); 

    get diagnostics rc = row_count;

    return rc;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function sagitta.sp_gl_coverages_additional_coverage_info_upsert() owner to mj_admin;
go 

grant execute on function sagitta.sp_gl_coverages_additional_coverage_info_upsert() to rl_sagitta_x;
go 

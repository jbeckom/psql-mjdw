create or replace function sagitta.tr_audit_gl_coverages_additional_coverage_info_d() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_gl_coverages_additional_coverage_info (
         sagitem 
        ,lis 
        ,old_gl_coverage_cd
        ,old_hazard_number
        ,old_form_number
        ,old_edition_dt
        ,old_cov_1_limit 
        ,old_cov_2_limit
        ,old_deductible
        ,old_cov_1_type_deductible
        ,old_cov_1_basis_1_deductible
        ,old_cov_1_basis_2_deductible
        ,old_cov_rate
        ,old_premium_amt
        ,old_job_number
        ,old_num_one
        ,old_num_two
        ,old_type_dt
        ,old_dt
        ,old_coverage_desc
        ,old_coverage_2_deductible
        ,old_coverage_2_ded_type
        ,old_cov_2_basis_1_deductible
        ,old_cov_basis_2_deductible
        ,old_location_agency_id
        ,old_state_prov_cd
        ,old_line_1_remark_text
        ,old_line_2_remark_text
        ,old_building_num 
        ,audit_action 
    )
    select   old.sagitem 
            ,old.lis 
            ,old.gl_coverage_cd
            ,old.hazard_number
            ,old.form_number
            ,old.edition_dt
            ,old.cov_1_limit 
            ,old.cov_2_limit
            ,old.deductible
            ,old.cov_1_type_deductible
            ,old.cov_1_basis_1_deductible
            ,old.cov_1_basis_2_deductible
            ,old.cov_rate
            ,old.premium_amt
            ,old.job_number
            ,old.num_one
            ,old.num_two
            ,old.type_dt
            ,old.dt
            ,old.coverage_desc
            ,old.coverage_2_deductible
            ,old.coverage_2_ded_type
            ,old.cov_2_basis_1_deductible
            ,old.cov_basis_2_deductible
            ,old.location_agency_id
            ,old.state_prov_cd
            ,old.line_1_remark_text
            ,old.line_2_remark_text
            ,old.building_num
            ,'D';
    return old;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_gl_coverages_additional_coverage_info_d() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_gl_coverages_additional_coverage_info_d() to rl_sagitta_x;
go 

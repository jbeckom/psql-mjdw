create or replace function sagitta.tr_audit_gl_coverages_additional_coverage_info_u() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_gl_coverages_additional_coverage_info (
         sagitem 
        ,lis 
        ,old_gl_coverage_cd
        ,new_gl_coverage_cd
        ,old_hazard_number
        ,new_hazard_number
        ,old_form_number
        ,new_form_number
        ,old_edition_dt
        ,new_edition_dt
        ,old_cov_1_limit 
        ,new_cov_1_limit 
        ,old_cov_2_limit
        ,new_cov_2_limit
        ,old_deductible
        ,new_deductible
        ,old_cov_1_type_deductible
        ,new_cov_1_type_deductible
        ,old_cov_1_basis_1_deductible
        ,new_cov_1_basis_1_deductible
        ,old_cov_1_basis_2_deductible
        ,new_cov_1_basis_2_deductible
        ,old_cov_rate
        ,new_cov_rate
        ,old_premium_amt
        ,new_premium_amt
        ,old_job_number
        ,new_job_number
        ,old_num_one
        ,new_num_one
        ,old_num_two
        ,new_num_two
        ,old_type_dt
        ,new_type_dt
        ,old_dt
        ,new_dt
        ,old_coverage_desc
        ,new_coverage_desc
        ,old_coverage_2_deductible
        ,new_coverage_2_deductible
        ,old_coverage_2_ded_type
        ,new_coverage_2_ded_type
        ,old_cov_2_basis_1_deductible
        ,new_cov_2_basis_1_deductible
        ,old_cov_basis_2_deductible
        ,new_cov_basis_2_deductible
        ,old_location_agency_id
        ,new_location_agency_id
        ,old_state_prov_cd
        ,new_state_prov_cd
        ,old_line_1_remark_text
        ,new_line_1_remark_text
        ,old_line_2_remark_text
        ,new_line_2_remark_text
        ,old_building_num 
        ,new_building_num 
        ,audit_action 
    )
    select   old.sagitem 
            ,old.lis 
            ,old.gl_coverage_cd
            ,new.gl_coverage_cd
            ,old.hazard_number
            ,new.hazard_number
            ,old.form_number
            ,new.form_number
            ,old.edition_dt
            ,new.edition_dt
            ,old.cov_1_limit 
            ,new.cov_1_limit 
            ,old.cov_2_limit
            ,new.cov_2_limit
            ,old.deductible
            ,new.deductible
            ,old.cov_1_type_deductible
            ,new.cov_1_type_deductible
            ,old.cov_1_basis_1_deductible
            ,new.cov_1_basis_1_deductible
            ,old.cov_1_basis_2_deductible
            ,new.cov_1_basis_2_deductible
            ,old.cov_rate
            ,new.cov_rate
            ,old.premium_amt
            ,new.premium_amt
            ,old.job_number
            ,new.job_number
            ,old.num_one
            ,new.num_one
            ,old.num_two
            ,new.num_two
            ,old.type_dt
            ,new.type_dt
            ,old.dt
            ,new.dt
            ,old.coverage_desc
            ,new.coverage_desc
            ,old.coverage_2_deductible
            ,new.coverage_2_deductible
            ,old.coverage_2_ded_type
            ,new.coverage_2_ded_type
            ,old.cov_2_basis_1_deductible
            ,new.cov_2_basis_1_deductible
            ,old.cov_basis_2_deductible
            ,new.cov_basis_2_deductible
            ,old.location_agency_id
            ,new.location_agency_id
            ,old.state_prov_cd
            ,new.state_prov_cd
            ,old.line_1_remark_text
            ,new.line_1_remark_text
            ,old.line_2_remark_text
            ,new.line_2_remark_text
            ,old.building_num
            ,new.building_num 
            ,'U';
    return old;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_gl_coverages_additional_coverage_info_u() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_gl_coverages_additional_coverage_info_u() to rl_sagitta_x;
go 

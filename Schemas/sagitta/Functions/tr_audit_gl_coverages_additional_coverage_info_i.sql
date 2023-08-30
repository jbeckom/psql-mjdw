create or replace function sagitta.tr_audit_gl_coverages_additional_coverage_info_i() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_gl_coverages_additional_coverage_info (
         sagitem 
        ,lis 
        ,new_gl_coverage_cd
        ,new_hazard_number
        ,new_form_number
        ,new_edition_dt
        ,new_cov_1_limit 
        ,new_cov_2_limit
        ,new_deductible
        ,new_cov_1_type_deductible
        ,new_cov_1_basis_1_deductible
        ,new_cov_1_basis_2_deductible
        ,new_cov_rate
        ,new_premium_amt
        ,new_job_number
        ,new_num_one
        ,new_num_two
        ,new_type_dt
        ,new_dt
        ,new_coverage_desc
        ,new_coverage_2_deductible
        ,new_coverage_2_ded_type
        ,new_cov_2_basis_1_deductible
        ,new_cov_basis_2_deductible
        ,new_location_agency_id
        ,new_state_prov_cd
        ,new_line_1_remark_text
        ,new_line_2_remark_text
        ,new_building_num 
        ,audit_action 
    )
    select   new.sagitem 
            ,new.lis 
            ,new.gl_coverage_cd
            ,new.hazard_number
            ,new.form_number
            ,new.edition_dt
            ,new.cov_1_limit 
            ,new.cov_2_limit
            ,new.deductible
            ,new.cov_1_type_deductible
            ,new.cov_1_basis_1_deductible
            ,new.cov_1_basis_2_deductible
            ,new.cov_rate
            ,new.premium_amt
            ,new.job_number
            ,new.num_one
            ,new.num_two
            ,new.type_dt
            ,new.dt
            ,new.coverage_desc
            ,new.coverage_2_deductible
            ,new.coverage_2_ded_type
            ,new.cov_2_basis_1_deductible
            ,new.cov_basis_2_deductible
            ,new.location_agency_id
            ,new.state_prov_cd
            ,new.line_1_remark_text
            ,new.line_2_remark_text
            ,new.building_num
            ,'I';
    return new;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_gl_coverages_additional_coverage_info_i() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_gl_coverages_additional_coverage_info_i() to rl_sagitta_x;
go 

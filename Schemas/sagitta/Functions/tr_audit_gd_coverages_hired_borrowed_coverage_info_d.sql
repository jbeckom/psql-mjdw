create or replace function sagitta.tr_audit_gd_coverages_hired_borrowed_coverage_info_d() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_gd_coverages_hired_borrowed_coverage_info (
         sagitem 
        ,lis 
        ,old_hired_liability_class_cd 
        ,old_hired_liability_location_number 
        ,old_hired_liability_state_prov_cd 
        ,old_hired_liability_cost_amt 
        ,old_hired_liability_rate 
        ,old_hired_physical_damage_rate 
        ,old_if_any_rating_basis_ind 
        ,old_num_days 
        ,old_num_vehs 
        ,old_hired_comprehensive_deductible_amt 
        ,old_hired_specified_perils_deductible_amt 
        ,old_hired_collision_deductible_amt 
        ,audit_action 
    )
    select   OLD.sagitem 
            ,OLD.lis 
            ,OLD.hired_liability_class_cd 
            ,OLD.hired_liability_location_number 
            ,OLD.hired_liability_state_prov_cd 
            ,OLD.hired_liability_cost_amt 
            ,OLD.hired_liability_rate 
            ,OLD.hired_physical_damage_rate 
            ,OLD.if_any_rating_basis_ind 
            ,OLD.num_days 
            ,OLD.num_vehs 
            ,OLD.hired_comprehensive_deductible_amt 
            ,OLD.hired_specified_perils_deductible_amt 
            ,OLD.hired_collision_deductible_amt 
            ,'D' ;
    return old;
end;
$$;
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_gd_coverages_hired_borrowed_coverage_info_d() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_gd_coverages_hired_borrowed_coverage_info_d() to rl_sagitta_x;
go 
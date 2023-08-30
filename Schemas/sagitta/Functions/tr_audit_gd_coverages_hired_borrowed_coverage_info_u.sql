create or replace function sagitta.tr_audit_gd_coverages_hired_borrowed_coverage_info_u() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_gd_coverages_hired_borrowed_coverage_info (
         sagitem 
        ,lis 
        ,old_hired_liability_class_cd 
        ,new_hired_liability_class_cd 
        ,old_hired_liability_location_number 
        ,new_hired_liability_location_number 
        ,old_hired_liability_state_prov_cd 
        ,new_hired_liability_state_prov_cd 
        ,old_hired_liability_cost_amt 
        ,new_hired_liability_cost_amt 
        ,old_hired_liability_rate 
        ,new_hired_liability_rate 
        ,old_hired_physical_damage_rate 
        ,new_hired_physical_damage_rate 
        ,old_if_any_rating_basis_ind 
        ,new_if_any_rating_basis_ind 
        ,old_num_days 
        ,new_num_days 
        ,old_num_vehs 
        ,new_num_vehs 
        ,old_hired_comprehensive_deductible_amt 
        ,new_hired_comprehensive_deductible_amt 
        ,old_hired_specified_perils_deductible_amt 
        ,new_hired_specified_perils_deductible_amt 
        ,old_hired_collision_deductible_amt 
        ,new_hired_collision_deductible_amt 
        ,audit_action 
    )
    select   OLD.sagitem 
            ,OLD.lis 
            ,OLD.hired_liability_class_cd 
            ,NEW.hired_liability_class_cd 
            ,OLD.hired_liability_location_number 
            ,NEW.hired_liability_location_number 
            ,OLD.hired_liability_state_prov_cd 
            ,NEW.hired_liability_state_prov_cd 
            ,OLD.hired_liability_cost_amt 
            ,NEW.hired_liability_cost_amt 
            ,OLD.hired_liability_rate 
            ,NEW.hired_liability_rate 
            ,OLD.hired_physical_damage_rate 
            ,NEW.hired_physical_damage_rate 
            ,OLD.if_any_rating_basis_ind 
            ,NEW.if_any_rating_basis_ind 
            ,OLD.num_days 
            ,NEW.num_days 
            ,OLD.num_vehs 
            ,NEW.num_vehs 
            ,OLD.hired_comprehensive_deductible_amt 
            ,NEW.hired_comprehensive_deductible_amt 
            ,OLD.hired_specified_perils_deductible_amt 
            ,NEW.hired_specified_perils_deductible_amt 
            ,OLD.hired_collision_deductible_amt 
            ,NEW.hired_collision_deductible_amt 
            ,'U' ;
    return old;
end;
$$;
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_gd_coverages_hired_borrowed_coverage_info_u() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_gd_coverages_hired_borrowed_coverage_info_u() to rl_sagitta_x;
go 
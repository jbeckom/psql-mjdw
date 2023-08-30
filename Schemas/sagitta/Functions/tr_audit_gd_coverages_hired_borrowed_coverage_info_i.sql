create or replace function sagitta.tr_audit_gd_coverages_hired_borrowed_coverage_info_i() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_gd_coverages_hired_borrowed_coverage_info (
         sagitem 
        ,lis 
        ,new_hired_liability_class_cd 
        ,new_hired_liability_location_number 
        ,new_hired_liability_state_prov_cd 
        ,new_hired_liability_cost_amt 
        ,new_hired_liability_rate 
        ,new_hired_physical_damage_rate 
        ,new_if_any_rating_basis_ind 
        ,new_num_days 
        ,new_num_vehs 
        ,new_hired_comprehensive_deductible_amt 
        ,new_hired_specified_perils_deductible_amt 
        ,new_hired_collision_deductible_amt 
        ,audit_action 
    )
    select   NEW.sagitem 
            ,NEW.lis 
            ,NEW.hired_liability_class_cd 
            ,NEW.hired_liability_location_number 
            ,NEW.hired_liability_state_prov_cd 
            ,NEW.hired_liability_cost_amt 
            ,NEW.hired_liability_rate 
            ,NEW.hired_physical_damage_rate 
            ,NEW.if_any_rating_basis_ind 
            ,NEW.num_days 
            ,NEW.num_vehs 
            ,NEW.hired_comprehensive_deductible_amt 
            ,NEW.hired_specified_perils_deductible_amt 
            ,NEW.hired_collision_deductible_amt 
            ,'I' ;
    return new;
end;
$$;
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_gd_coverages_hired_borrowed_coverage_info_i() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_gd_coverages_hired_borrowed_coverage_info_i() to rl_sagitta_x;
go 
create table sagitta.audit_gd_coverages_hired_borrowed_coverage_info(
     sagitem                                            int             not null 
    ,lis                                                int             not null 
    ,old_hired_liability_class_cd                       TEXT            NULL
    ,new_hired_liability_class_cd                       TEXT            NULL
    ,old_hired_liability_location_number                TEXT            NULL
    ,new_hired_liability_location_number                TEXT            NULL
    ,old_hired_liability_state_prov_cd                  TEXT            NULL
    ,new_hired_liability_state_prov_cd                  TEXT            NULL
    ,old_hired_liability_cost_amt                       TEXT            NULL
    ,new_hired_liability_cost_amt                       TEXT            NULL
    ,old_hired_liability_rate                           TEXT            NULL
    ,new_hired_liability_rate                           TEXT            NULL
    ,old_hired_physical_damage_rate                     TEXT            NULL
    ,new_hired_physical_damage_rate                     TEXT            NULL
    ,old_if_any_rating_basis_ind                        TEXT            NULL
    ,new_if_any_rating_basis_ind                        TEXT            NULL
    ,old_num_days                                       TEXT            NULL
    ,new_num_days                                       TEXT            NULL
    ,old_num_vehs                                       TEXT            NULL
    ,new_num_vehs                                       TEXT            NULL
    ,old_hired_comprehensive_deductible_amt             TEXT            NULL
    ,new_hired_comprehensive_deductible_amt             TEXT            NULL
    ,old_hired_specified_perils_deductible_amt          TEXT            NULL
    ,new_hired_specified_perils_deductible_amt          TEXT            NULL
    ,old_hired_collision_deductible_amt                 TEXT            NULL
    ,new_hired_collision_deductible_amt                 TEXT            NULL
    ,audit_action                                       char(1)         not null 
    ,audit_user                                         text            not null            default current_user 
    ,audit_timestamp                                    timestamp       not null            default timezone('utc'::text, clock_timestamp()) 
    ,audit_id                                           bigint          not null            generated always as identity            primary key 
);
go 

/*** PERMISSIONS ***/
alter table sagitta.audit_gd_coverages_hired_borrowed_coverage_info owner to mj_admin;
go 

grant insert on sagitta.audit_gd_coverages_hired_borrowed_coverage_info to rl_sagitta_a;
go 
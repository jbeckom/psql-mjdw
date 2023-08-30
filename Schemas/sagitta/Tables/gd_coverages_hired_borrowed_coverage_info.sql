create table sagitta.gd_coverages_hired_borrowed_coverage_info(
     sagitem                                        int             not null 
    ,lis                                            int             not null 
    ,hired_liability_class_cd                       TEXT            NULL
    ,hired_liability_location_number                TEXT            NULL
    ,hired_liability_state_prov_cd                  TEXT            NULL
    ,hired_liability_cost_amt                       TEXT            NULL
    ,hired_liability_rate                           TEXT            NULL
    ,hired_physical_damage_rate                     TEXT            NULL
    ,if_any_rating_basis_ind                        TEXT            NULL
    ,num_days                                       TEXT            NULL
    ,num_vehs                                       TEXT            NULL
    ,hired_comprehensive_deductible_amt             TEXT            NULL
    ,hired_specified_perils_deductible_amt          TEXT            NULL
    ,hired_collision_deductible_amt                 TEXT            NULL
    ,constraint gd_coverages_hired_borrowed_coverage_info_pkey          primary key (sagitem,lis)
);
go 

/*** PERMISSIONS ***/
alter table sagitta.gd_coverages_hired_borrowed_coverage_info owner to mj_admin;
go 

grant select on sagitta.gd_coverages_hired_borrowed_coverage_info to rl_sagitta_r;
go 

grant insert on sagitta.gd_coverages_hired_borrowed_coverage_info to rl_sagitta_a;
go 

grant update on sagitta.gd_coverages_hired_borrowed_coverage_info to rl_sagitta_w;
go 

/*** TRIGGERS ***/
create trigger audit_d after delete on sagitta.gd_coverages_hired_borrowed_coverage_info for each row execute function sagitta.tr_audit_gd_coverages_hired_borrowed_coverage_info_d();
go 

create trigger audit_i after insert on sagitta.gd_coverages_hired_borrowed_coverage_info for each row execute function sagitta.tr_audit_gd_coverages_hired_borrowed_coverage_info_i();
go 

create trigger audit_u after update on sagitta.gd_coverages_hired_borrowed_coverage_info for each row when (old is distinct from new) execute function sagitta.tr_audit_gd_coverages_hired_borrowed_coverage_info_u();
go 
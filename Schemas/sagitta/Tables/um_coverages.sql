create table sagitta.um_coverages (
     sagitem                                int             not null 
    ,audit_staff_cd                         text            null 
    ,audit_entry_dt                         int             null 
    ,audit_time                             int             null 
    ,audit_cd                               text            null 
    ,audit_history_record_number            text            null 
    ,audit_program                          text            null 
    ,audit_effective_dt                     text            null 
    ,audit_change_agency_id                 text            null 
    ,policy_agency_id                       text            null 
    ,follow_umb_form                        text            null 
    ,follow_form_excess                     text            null 
    ,umbrella_excess                        text            null 
    ,liab_each_occur_limit                  text            null 
    ,liab_annual_aggregate                  text            null 
    ,retained_limit                         text            null 
    ,first_dollar_defense                   text            null 
    ,current_retro_date                     text            null 
    ,off_dt                                 text            null 
    ,desc_of_underlying_cov                 text            null 
    ,garagekeepers_coverage                 text            null 
    ,garagekeepers_exposure                 text            null 
    ,aircraft_pass_coverage                 text            null 
    ,aircraft_pass_exposure                 text            null 
    ,care_custody_coverage                  text            null 
    ,care_custody_exposure                  text            null 
    ,professional_coverage                  text            null 
    ,professional_exposure                  text            null 
    ,foreign_liab_coverage                  text            null 
    ,foreign_liab_exposure                  text            null 
    ,malpractice_coverage                   text            null 
    ,malpractive_exposure                   text            null 
    ,aircraft_liab_coverage                 text            null 
    ,aircraft_liab_exposure                 text            null 
    ,add_int_coverage                       text            null 
    ,add_int_exposure                       text            null 
    ,emp_benefit_coverage                   text            null 
    ,emp_benefit_exposure                   text            null 
    ,liquor_coverage                        text            null 
    ,liquor_exposure                        text            null 
    ,pollution_coverage                     text            null 
    ,pollution_exposure                     text            null 
    ,vendors_liab_coverage                  text            null 
    ,vendors_liab_exposure                  text            null 
    ,watercraft_coverage                    text            null 
    ,watercraft_exposure                    text            null 
    ,first_other_description                text            null 
    ,first_other_coverage                   text            null 
    ,first_other_exposure                   text            null 
    ,second_other_description               text            null 
    ,second_other_coverage                  text            null 
    ,second_other_exposure                  text            null 
    ,third_other_description                text            null 
    ,third_other_coverage                   text            null 
    ,third_other_exposure                   text            null 
    ,fourth_other_description               text            null 
    ,fourth_other_coverage                  text            null 
    ,fourth_other_exposure                  text            null 
    ,retro_coverage_yes_no_cd               text            null 
    ,retro_proposed_date                    text            null 
    ,constraint um_coverages_pkey primary key (sagitem)
);
GO 

/*** PERMISSIONS ***/
alter table sagitta.um_coverages owner to mj_admin;
go 

grant select on sagitta.um_coverages to rl_sagitta_r;
go 

grant insert on sagitta.um_coverages to rl_sagitta_a;
go 

grant update on sagitta.um_coverages to rl_sagitta_w;
go 

/*** TRIGGERS ***/
create trigger audit_d after delete on sagitta.um_coverages for each row execute function sagitta.tr_audit_um_coverages_d();
go 

create trigger audit_i after insert on sagitta.um_coverages for each row execute function sagitta.tr_audit_um_coverages_i();
go 

create trigger audit_u after update on sagitta.um_coverages for each row when (old is distinct from new) execute function sagitta.tr_audit_um_coverages_u();
go 
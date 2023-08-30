create or replace function sagitta.tr_audit_gd_coverages_non_owned_coverage_info_d() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_gd_coverages_non_owned_coverage_info ( 
         sagitem 
        ,lis 
        ,old_non_owned_class_cd 
        ,old_non_owned_location_number 
        ,old_non_owned_state_prov_cd 
        ,old_non_owned_group_type_cd 
        ,old_num_non_owned 
        ,old_non_owned_pct 
        ,old_social_service_agency_ind 
        ,old_non_owned_individual_yes_no_cd 
        ,audit_action 
    )
    select   OLD.sagitem 
            ,OLD.lis 
            ,OLD.non_owned_class_cd 
            ,OLD.non_owned_location_number 
            ,OLD.non_owned_state_prov_cd 
            ,OLD.non_owned_group_type_cd 
            ,OLD.num_non_owned 
            ,OLD.non_owned_pct 
            ,OLD.social_service_agency_ind 
            ,OLD.non_owned_individual_yes_no_cd 
            ,'D'; 
    return old;
end; 
$$;
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_gd_coverages_non_owned_coverage_info_d() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_gd_coverages_non_owned_coverage_info_d() to rl_sagitta_x;
go 

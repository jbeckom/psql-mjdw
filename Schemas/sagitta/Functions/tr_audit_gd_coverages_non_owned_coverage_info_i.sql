create or replace function sagitta.tr_audit_gd_coverages_non_owned_coverage_info_i() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_gd_coverages_non_owned_coverage_info ( 
         sagitem 
        ,lis 
        ,new_non_owned_class_cd 
        ,new_non_owned_location_number 
        ,new_non_owned_state_prov_cd 
        ,new_non_owned_group_type_cd 
        ,new_num_non_owned 
        ,new_non_owned_pct 
        ,new_social_service_agency_ind 
        ,new_non_owned_individual_yes_no_cd 
        ,audit_action 
    )
    select   NEW.sagitem 
            ,NEW.lis 
            ,NEW.non_owned_class_cd 
            ,NEW.non_owned_location_number 
            ,NEW.non_owned_state_prov_cd 
            ,NEW.non_owned_group_type_cd 
            ,NEW.num_non_owned 
            ,NEW.non_owned_pct 
            ,NEW.social_service_agency_ind 
            ,NEW.non_owned_individual_yes_no_cd 
            ,'I'; 
    return new;
end; 
$$;
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_gd_coverages_non_owned_coverage_info_i() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_gd_coverages_non_owned_coverage_info_i() to rl_sagitta_x;
go 

create or replace function sagitta.tr_audit_gd_coverages_doc_coverage_info_i() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_gd_coverages_doc_coverage_info (
         sagitem 
        ,lis 
        ,new_doc_class_cd 
        ,new_doc_location_number 
        ,new_state_prov_cd 
        ,new_rating_territory_desc 
        ,new_num_employees 
        ,new_num_individuals_covered 
        ,new_fin_resp_doc_cert_yes_no_cd 
        ,new_doc_driver_info 
        ,new_driver_1_number 
        ,new_driver_2_number 
        ,new_driver_3_number 
        ,new_driver_4_number 
        ,new_driver_5_number 
        ,new_driver_6_number 
        ,new_driver_7_number 
        ,new_driver_8_number 
        ,new_driver_9_number 
        ,audit_action 
    )
    select   NEW.sagitem 
            ,NEW.lis 
            ,NEW.doc_class_cd 
            ,NEW.doc_location_number 
            ,NEW.state_prov_cd 
            ,NEW.rating_territory_desc 
            ,NEW.num_employees 
            ,NEW.num_individuals_covered 
            ,NEW.fin_resp_doc_cert_yes_no_cd 
            ,NEW.doc_driver_info 
            ,NEW.driver_1_number 
            ,NEW.driver_2_number 
            ,NEW.driver_3_number 
            ,NEW.driver_4_number 
            ,NEW.driver_5_number 
            ,NEW.driver_6_number 
            ,NEW.driver_7_number 
            ,NEW.driver_8_number 
            ,NEW.driver_9_number 
            ,'I'; 
    return new;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_gd_coverages_doc_coverage_info_i() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_gd_coverages_doc_coverage_info_i() to rl_sagitta_x;
go 
create or replace function sagitta.tr_audit_gd_coverages_doc_coverage_info_d() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_gd_coverages_doc_coverage_info (
         sagitem 
        ,lis 
        ,old_doc_class_cd 
        ,old_doc_location_number 
        ,old_state_prov_cd 
        ,old_rating_territory_desc 
        ,old_num_employees 
        ,old_num_individuals_covered 
        ,old_fin_resp_doc_cert_yes_no_cd 
        ,old_doc_driver_info 
        ,old_driver_1_number 
        ,old_driver_2_number 
        ,old_driver_3_number 
        ,old_driver_4_number 
        ,old_driver_5_number 
        ,old_driver_6_number 
        ,old_driver_7_number 
        ,old_driver_8_number 
        ,old_driver_9_number 
        ,audit_action 
    )
    select   OLD.sagitem 
            ,OLD.lis 
            ,OLD.doc_class_cd 
            ,OLD.doc_location_number 
            ,OLD.state_prov_cd 
            ,OLD.rating_territory_desc 
            ,OLD.num_employees 
            ,OLD.num_individuals_covered 
            ,OLD.fin_resp_doc_cert_yes_no_cd 
            ,OLD.doc_driver_info 
            ,OLD.driver_1_number 
            ,OLD.driver_2_number 
            ,OLD.driver_3_number 
            ,OLD.driver_4_number 
            ,OLD.driver_5_number 
            ,OLD.driver_6_number 
            ,OLD.driver_7_number 
            ,OLD.driver_8_number 
            ,OLD.driver_9_number 
            ,'D'; 
    return old;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_gd_coverages_doc_coverage_info_d() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_gd_coverages_doc_coverage_info_d() to rl_sagitta_x;
go 
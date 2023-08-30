create or replace function sagitta.sp_gd_coverages_doc_coverage_info_upsert() 
returns int 
language plpgsql 
as $$ 

declare rc int;

begin 
	insert into sagitta.gd_coverages_doc_coverage_info (
		 sagitem 
        ,lis 
        ,doc_class_cd 
        ,doc_location_number 
        ,state_prov_cd 
        ,rating_territory_desc 
        ,num_employees 
        ,num_individuals_covered 
        ,fin_resp_doc_cert_yes_no_cd 
        ,doc_driver_info 
        ,driver_1_number 
        ,driver_2_number 
        ,driver_3_number 
        ,driver_4_number 
        ,driver_5_number 
        ,driver_6_number 
        ,driver_7_number 
        ,driver_8_number 
        ,driver_9_number 
	)
	select 	 sagitem 
			,lis 
			,doc_class_cd 
			,doc_location_number 
			,state_prov_cd 
			,rating_territory_desc 
			,num_employees 
			,num_individuals_covered 
			,fin_resp_doc_cert_yes_no_cd 
			,doc_driver_info 
			,driver_1_number 
			,driver_2_number 
			,driver_3_number 
			,driver_4_number 
			,driver_5_number 
			,driver_6_number 
			,driver_7_number 
			,driver_8_number 
			,driver_9_number 
	from 	sagitta.stg_gd_coverages_doc_coverage_info 
	on conflict (sagitem,lis) do update 
	set 	 doc_class_cd 					= excluded.doc_class_cd 
			,doc_location_number 			= excluded.doc_location_number 
			,state_prov_cd 					= excluded.state_prov_cd 
			,rating_territory_desc 			= excluded.rating_territory_desc 
			,num_employees 					= excluded.num_employees 
			,num_individuals_covered 		= excluded.num_individuals_covered 
			,fin_resp_doc_cert_yes_no_cd 	= excluded.fin_resp_doc_cert_yes_no_cd 
			,doc_driver_info 				= excluded.doc_driver_info 
			,driver_1_number 				= excluded.driver_1_number 
			,driver_2_number 				= excluded.driver_2_number 
			,driver_3_number 				= excluded.driver_3_number 
			,driver_4_number 				= excluded.driver_4_number 
			,driver_5_number 				= excluded.driver_5_number 
			,driver_6_number 				= excluded.driver_6_number 
			,driver_7_number 				= excluded.driver_7_number 
			,driver_8_number 				= excluded.driver_8_number 
			,driver_9_number 				= excluded.driver_9_number 
	where 	(gd_coverages_doc_coverage_info.doc_class_cd,gd_coverages_doc_coverage_info.doc_location_number,gd_coverages_doc_coverage_info.state_prov_cd,gd_coverages_doc_coverage_info.rating_territory_desc,gd_coverages_doc_coverage_info.num_employees,gd_coverages_doc_coverage_info.num_individuals_covered,gd_coverages_doc_coverage_info.fin_resp_doc_cert_yes_no_cd,gd_coverages_doc_coverage_info.doc_driver_info,gd_coverages_doc_coverage_info.driver_1_number,gd_coverages_doc_coverage_info.driver_2_number,gd_coverages_doc_coverage_info.driver_3_number,gd_coverages_doc_coverage_info.driver_4_number,gd_coverages_doc_coverage_info.driver_5_number,gd_coverages_doc_coverage_info.driver_6_number,gd_coverages_doc_coverage_info.driver_7_number,gd_coverages_doc_coverage_info.driver_8_number,gd_coverages_doc_coverage_info.driver_9_number) 
		is distinct from 	(excluded.doc_class_cd,excluded.doc_location_number,excluded.state_prov_cd,excluded.rating_territory_desc,excluded.num_employees,excluded.num_individuals_covered,excluded.fin_resp_doc_cert_yes_no_cd,excluded.doc_driver_info,excluded.driver_1_number,excluded.driver_2_number,excluded.driver_3_number,excluded.driver_4_number,excluded.driver_5_number,excluded.driver_6_number,excluded.driver_7_number,excluded.driver_8_number,excluded.driver_9_number); 

	get diagnostics rc = row_count;

	return rc;
end; 
$$; 
go 

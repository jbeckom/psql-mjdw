create or replace function sagitta.sp_gd_coverages_non_owned_coverage_info_upsert() 
returns int 
language plpgsql 
as $$ 

declare rc int;

begin 
	insert into sagitta.gd_coverages_non_owned_coverage_info (
		 sagitem 
        ,lis 
        ,non_owned_class_cd 
        ,non_owned_location_number 
        ,non_owned_state_prov_cd 
        ,non_owned_group_type_cd 
        ,num_non_owned 
        ,non_owned_pct 
        ,social_service_agency_ind 
        ,non_owned_individual_yes_no_cd 
	)
	select 	sagitem 
			,lis 
			,non_owned_class_cd 
			,non_owned_location_number 
			,non_owned_state_prov_cd 
			,non_owned_group_type_cd 
			,num_non_owned 
			,non_owned_pct 
			,social_service_agency_ind 
			,non_owned_individual_yes_no_cd 
	from 	sagitta.stg_gd_coverages_non_owned_coverage_info
	on conflict (sagitem,lis) do update 
	set 	 non_owned_class_cd 				= excluded.non_owned_class_cd 
			,non_owned_location_number 			= excluded.non_owned_location_number 
			,non_owned_state_prov_cd 			= excluded.non_owned_state_prov_cd 
			,non_owned_group_type_cd 			= excluded.non_owned_group_type_cd 
			,num_non_owned 						= excluded.num_non_owned 
			,non_owned_pct 						= excluded.non_owned_pct 
			,social_service_agency_ind 			= excluded.social_service_agency_ind 
			,non_owned_individual_yes_no_cd 	= excluded.non_owned_individual_yes_no_cd 
	where 	(gd_coverages_non_owned_coverage_info.non_owned_class_cd,gd_coverages_non_owned_coverage_info.non_owned_location_number,gd_coverages_non_owned_coverage_info.non_owned_state_prov_cd,gd_coverages_non_owned_coverage_info.non_owned_group_type_cd,gd_coverages_non_owned_coverage_info.num_non_owned,gd_coverages_non_owned_coverage_info.non_owned_pct,gd_coverages_non_owned_coverage_info.social_service_agency_ind,gd_coverages_non_owned_coverage_info.non_owned_individual_yes_no_cd) 
		is distinct from 	(excluded.non_owned_class_cd,excluded.non_owned_location_number,excluded.non_owned_state_prov_cd,excluded.non_owned_group_type_cd,excluded.num_non_owned,excluded.non_owned_pct,excluded.social_service_agency_ind,excluded.non_owned_individual_yes_no_cd); 

	get diagnostics rc = row_count;

	return rc;
end; 
$$;
go 

/*** PERMISSIONS ***/
alter function sagitta.sp_gd_coverages_non_owned_coverage_info_upsert() owner to mj_admin;
go 

grant execute on function sagitta.sp_gd_coverages_non_owned_coverage_info_upsert() to rl_sagitta_x;
go 

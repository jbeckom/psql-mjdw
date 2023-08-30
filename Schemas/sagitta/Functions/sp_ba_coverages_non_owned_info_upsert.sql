CREATE OR REPLACE FUNCTION sagitta.sp_ba_coverages_non_owned_info_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE rc int;

BEGIN 
	INSERT INTO sagitta.ba_coverages_non_owned_info (
		 sagitem 
		,lis 
		,non_owned_class_cd 
		,non_owned_location_agency_id 
		,non_owned_state_prov_cd 
		,non_owned_group_type_cd 
		,non_owned_num 
		,non_owned_pct 
		,non_owned_social_service_agency_yes_no_cd 
		,non_owned_individual_liabilityfor_employees_yes_no_cd 
	)
	SELECT 	 sagitem 
			,lis 
			,non_owned_class_cd 
			,non_owned_location_agency_id 
			,non_owned_state_prov_cd 
			,non_owned_group_type_cd 
			,non_owned_num 
			,non_owned_pct 
			,non_owned_social_service_agency_yes_no_cd 
			,non_owned_individual_liabilityfor_employees_yes_no_cd 
	FROM 	sagitta.stg_ba_coverages_non_owned_info 
	ON CONFLICT (sagitem,lis) DO UPDATE 
	SET 	 non_owned_class_cd 									= excluded.non_owned_class_cd 
			,non_owned_location_agency_id 							= excluded.non_owned_location_agency_id 
			,non_owned_state_prov_cd 								= excluded.non_owned_state_prov_cd 
			,non_owned_group_type_cd 								= excluded.non_owned_group_type_cd 
			,non_owned_num 											= excluded.non_owned_num 
			,non_owned_pct 											= excluded.non_owned_pct 
			,non_owned_social_service_agency_yes_no_cd 				= excluded.non_owned_social_service_agency_yes_no_cd 
			,non_owned_individual_liabilityfor_employees_yes_no_cd 	= excluded.non_owned_individual_liabilityfor_employees_yes_no_cd 
	WHERE 	(ba_coverages_non_owned_info.non_owned_class_cd,ba_coverages_non_owned_info.non_owned_location_agency_id,ba_coverages_non_owned_info.non_owned_state_prov_cd,ba_coverages_non_owned_info.non_owned_group_type_cd,ba_coverages_non_owned_info.non_owned_num,ba_coverages_non_owned_info.non_owned_pct,ba_coverages_non_owned_info.non_owned_social_service_agency_yes_no_cd,ba_coverages_non_owned_info.non_owned_individual_liabilityfor_employees_yes_no_cd) 
		IS DISTINCT FROM 	(excluded.non_owned_class_cd,excluded.non_owned_location_agency_id,excluded.non_owned_state_prov_cd,excluded.non_owned_group_type_cd,excluded.non_owned_num,excluded.non_owned_pct,excluded.non_owned_social_service_agency_yes_no_cd,excluded.non_owned_individual_liabilityfor_employees_yes_no_cd); 
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO;

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_ba_coverages_non_owned_info_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_ba_coverages_non_owned_info_upsert() TO rl_sagitta_x;
GO 

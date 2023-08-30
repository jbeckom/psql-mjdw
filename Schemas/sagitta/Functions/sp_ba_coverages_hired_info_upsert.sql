CREATE OR REPLACE FUNCTION sagitta.sp_ba_coverages_hired_info_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE rc int;

BEGIN 
	INSERT INTO sagitta.ba_coverages_hired_info (
		 sagitem 
		,lis 
		,hired_liability_class_cd 
		,hired_location_agency_id 
		,hired_state_prov_cd 
		,hired_liability_cost_amt 
		,hired_liability_rate 
		,hired_physical_damage_rate 
		,hired_liability_minimum_yes_no_cd 
		,hired_num_days 
		,hired_num_vehs 
		,hired_comprehensive_deductible_amt 
		,hired_specified_perils_deductible_amt 
		,hired_collision_deductible_amt 
	)
	SELECT 	 sagitem 
			,lis 
			,hired_liability_class_cd 
			,hired_location_agency_id 
			,hired_state_prov_cd 
			,hired_liability_cost_amt 
			,hired_liability_rate 
			,hired_physical_damage_rate 
			,hired_liability_minimum_yes_no_cd 
			,hired_num_days 
			,hired_num_vehs 
			,hired_comprehensive_deductible_amt 
			,hired_specified_perils_deductible_amt 
			,hired_collision_deductible_amt 
	FROM 	sagitta.stg_ba_coverages_hired_info 
	ON CONFLICT (sagitem,lis) DO UPDATE 
	SET 	 hired_liability_class_cd 				= excluded.hired_liability_class_cd 
			,hired_location_agency_id 				= excluded.hired_location_agency_id 
			,hired_state_prov_cd 					= excluded.hired_state_prov_cd 
			,hired_liability_cost_amt 				= excluded.hired_liability_cost_amt 
			,hired_liability_rate 					= excluded.hired_liability_rate 
			,hired_physical_damage_rate 			= excluded.hired_physical_damage_rate 
			,hired_liability_minimum_yes_no_cd 		= excluded.hired_liability_minimum_yes_no_cd 
			,hired_num_days 						= excluded.hired_num_days 
			,hired_num_vehs 						= excluded.hired_num_vehs 
			,hired_comprehensive_deductible_amt 	= excluded.hired_comprehensive_deductible_amt 
			,hired_specified_perils_deductible_amt 	= excluded.hired_specified_perils_deductible_amt 
			,hired_collision_deductible_amt 		= excluded.hired_collision_deductible_amt 
	WHERE 	(ba_coverages_hired_info.hired_liability_class_cd,ba_coverages_hired_info.hired_location_agency_id,ba_coverages_hired_info.hired_state_prov_cd,ba_coverages_hired_info.hired_liability_cost_amt,ba_coverages_hired_info.hired_liability_rate,ba_coverages_hired_info.hired_physical_damage_rate,ba_coverages_hired_info.hired_liability_minimum_yes_no_cd,ba_coverages_hired_info.hired_num_days,ba_coverages_hired_info.hired_num_vehs,ba_coverages_hired_info.hired_comprehensive_deductible_amt,ba_coverages_hired_info.hired_specified_perils_deductible_amt,ba_coverages_hired_info.hired_collision_deductible_amt) 
		IS DISTINCT FROM 	(excluded.hired_liability_class_cd,excluded.hired_location_agency_id,excluded.hired_state_prov_cd,excluded.hired_liability_cost_amt,excluded.hired_liability_rate,excluded.hired_physical_damage_rate,excluded.hired_liability_minimum_yes_no_cd,excluded.hired_num_days,excluded.hired_num_vehs,excluded.hired_comprehensive_deductible_amt,excluded.hired_specified_perils_deductible_amt,excluded.hired_collision_deductible_amt); 
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_ba_coverages_hired_info_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_ba_coverages_hired_info_upsert() TO rl_sagitta_x;
GO 

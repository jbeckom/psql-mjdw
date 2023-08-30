CREATE OR REPLACE FUNCTION sagitta.sp_cp_coverages_location_specific_coverage_info_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$ 

DECLARE rc int;

BEGIN 
	INSERT INTO sagitta.cp_coverages_location_specific_coverage_info (
		 sagitem 
		,lis 
		,building_number 
		,subject_insurance_cd 
		,subject_insurance_desc 
		,insurance_amt 
		,blanket_number 
		,loss_cause_cd 
		,coinsurance_pct 
		,inflation_guard_pct 
		,valuation_type_cd 
		,agreed_value_id 
		,deductible_symbol 
		,deductible 
		,deductible_type_cd 
		,deductible_type_desc 
		,deductible_basic_cd 
		,premium_amt 
		,building_desc 
		,start_dt 
		,end_dt 
		,second_value_format_cd 
		,second_value_amt 
		,off_premises_power_dep_property_commercial_name 
		,off_premises_power_dep_property_addr 
		,off_premises_power_dep_property_addr_2 
		,off_premises_power_dep_property_city 
		,off_premises_power_dep_property_postal_code 
		,off_premises_power_dep_property_postal_extension_code 
		,off_premises_power_dep_property_county 
		,off_premises_power_dep_property_state_prov_cd 
		,off_premises_power_dep_property_country 
	)
	SELECT 	 sagitem 
			,lis 
			,building_number 
			,subject_insurance_cd 
			,subject_insurance_desc 
			,insurance_amt 
			,blanket_number 
			,loss_cause_cd 
			,coinsurance_pct 
			,inflation_guard_pct 
			,valuation_type_cd 
			,agreed_value_id 
			,deductible_symbol 
			,deductible 
			,deductible_type_cd 
			,deductible_type_desc 
			,deductible_basic_cd 
			,premium_amt 
			,building_desc 
			,start_dt 
			,end_dt 
			,second_value_format_cd 
			,second_value_amt 
			,off_premises_power_dep_property_commercial_name 
			,off_premises_power_dep_property_addr 
			,off_premises_power_dep_property_addr_2 
			,off_premises_power_dep_property_city 
			,off_premises_power_dep_property_postal_code 
			,off_premises_power_dep_property_postal_extension_code 
			,off_premises_power_dep_property_county 
			,off_premises_power_dep_property_state_prov_cd 
			,off_premises_power_dep_property_country 
	FROM 	sagitta.stg_cp_coverages_location_specific_coverage_info
	ON CONFLICT (sagitem,lis) DO UPDATE 
	SET 	 building_number 										= excluded.building_number 
			,subject_insurance_cd 									= excluded.subject_insurance_cd 
			,subject_insurance_desc 								= excluded.subject_insurance_desc 
			,insurance_amt 											= excluded.insurance_amt 
			,blanket_number 										= excluded.blanket_number 
			,loss_cause_cd 											= excluded.loss_cause_cd 
			,coinsurance_pct 										= excluded.coinsurance_pct 
			,inflation_guard_pct 									= excluded.inflation_guard_pct 
			,valuation_type_cd 										= excluded.valuation_type_cd 
			,agreed_value_id 										= excluded.agreed_value_id 
			,deductible_symbol 										= excluded.deductible_symbol 
			,deductible 											= excluded.deductible 
			,deductible_type_cd 									= excluded.deductible_type_cd 
			,deductible_type_desc 									= excluded.deductible_type_desc 
			,deductible_basic_cd 									= excluded.deductible_basic_cd 
			,premium_amt 											= excluded.premium_amt 
			,building_desc 											= excluded.building_desc 
			,start_dt 												= excluded.start_dt 
			,end_dt 												= excluded.end_dt 
			,second_value_format_cd 								= excluded.second_value_format_cd 
			,second_value_amt 										= excluded.second_value_amt 
			,off_premises_power_dep_property_commercial_name 		= excluded.off_premises_power_dep_property_commercial_name 
			,off_premises_power_dep_property_addr 					= excluded.off_premises_power_dep_property_addr 
			,off_premises_power_dep_property_addr_2 				= excluded.off_premises_power_dep_property_addr_2 
			,off_premises_power_dep_property_city 					= excluded.off_premises_power_dep_property_city 
			,off_premises_power_dep_property_postal_code 			= excluded.off_premises_power_dep_property_postal_code 
			,off_premises_power_dep_property_postal_extension_code 	= excluded.off_premises_power_dep_property_postal_extension_code 
			,off_premises_power_dep_property_county 				= excluded.off_premises_power_dep_property_county 
			,off_premises_power_dep_property_state_prov_cd 			= excluded.off_premises_power_dep_property_state_prov_cd 
			,off_premises_power_dep_property_country 				= excluded.off_premises_power_dep_property_country  
	WHERE 	(cp_coverages_location_specific_coverage_info.building_number,cp_coverages_location_specific_coverage_info.subject_insurance_cd,cp_coverages_location_specific_coverage_info.subject_insurance_desc,cp_coverages_location_specific_coverage_info.insurance_amt,cp_coverages_location_specific_coverage_info.blanket_number,cp_coverages_location_specific_coverage_info.loss_cause_cd,cp_coverages_location_specific_coverage_info.coinsurance_pct,cp_coverages_location_specific_coverage_info.inflation_guard_pct,cp_coverages_location_specific_coverage_info.valuation_type_cd,cp_coverages_location_specific_coverage_info.agreed_value_id,cp_coverages_location_specific_coverage_info.deductible_symbol,cp_coverages_location_specific_coverage_info.deductible,cp_coverages_location_specific_coverage_info.deductible_type_cd,cp_coverages_location_specific_coverage_info.deductible_type_desc,cp_coverages_location_specific_coverage_info.deductible_basic_cd,cp_coverages_location_specific_coverage_info.premium_amt,cp_coverages_location_specific_coverage_info.building_desc,cp_coverages_location_specific_coverage_info.start_dt,cp_coverages_location_specific_coverage_info.end_dt,cp_coverages_location_specific_coverage_info.second_value_format_cd,cp_coverages_location_specific_coverage_info.second_value_amt,cp_coverages_location_specific_coverage_info.off_premises_power_dep_property_commercial_name,cp_coverages_location_specific_coverage_info.off_premises_power_dep_property_addr,cp_coverages_location_specific_coverage_info.off_premises_power_dep_property_addr_2,cp_coverages_location_specific_coverage_info.off_premises_power_dep_property_city,cp_coverages_location_specific_coverage_info.off_premises_power_dep_property_postal_code,cp_coverages_location_specific_coverage_info.off_premises_power_dep_property_postal_extension_code,cp_coverages_location_specific_coverage_info.off_premises_power_dep_property_county,cp_coverages_location_specific_coverage_info.off_premises_power_dep_property_state_prov_cd,cp_coverages_location_specific_coverage_info.off_premises_power_dep_property_country) 
		IS DISTINCT FROM 	(excluded.building_number,excluded.subject_insurance_cd,excluded.subject_insurance_desc,excluded.insurance_amt,excluded.blanket_number,excluded.loss_cause_cd,excluded.coinsurance_pct,excluded.inflation_guard_pct,excluded.valuation_type_cd,excluded.agreed_value_id,excluded.deductible_symbol,excluded.deductible,excluded.deductible_type_cd,excluded.deductible_type_desc,excluded.deductible_basic_cd,excluded.premium_amt,excluded.building_desc,excluded.start_dt,excluded.end_dt,excluded.second_value_format_cd,excluded.second_value_amt,excluded.off_premises_power_dep_property_commercial_name,excluded.off_premises_power_dep_property_addr,excluded.off_premises_power_dep_property_addr_2,excluded.off_premises_power_dep_property_city,excluded.off_premises_power_dep_property_postal_code,excluded.off_premises_power_dep_property_postal_extension_code,excluded.off_premises_power_dep_property_county,excluded.off_premises_power_dep_property_state_prov_cd,excluded.off_premises_power_dep_property_country); 
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc; 
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_cp_coverages_location_specific_coverage_info_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_cp_coverages_location_specific_coverage_info_upsert() TO rl_sagitta_x;
GO 

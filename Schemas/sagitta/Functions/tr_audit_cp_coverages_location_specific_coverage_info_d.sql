CREATE OR REPLACE FUNCTION sagitta.tr_audit_cp_coverages_location_specific_coverage_info_d() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$ 

BEGIN 
	INSERT INTO sagitta.audit_cp_coverages_location_specific_coverage_info (
		 sagitem 
		,lis 
		,old_building_number 
		,old_subject_insurance_cd 
		,old_subject_insurance_desc 
		,old_insurance_amt 
		,old_blanket_number 
		,old_loss_cause_cd 
		,old_coinsurance_pct 
		,old_inflation_guard_pct 
		,old_valuation_type_cd 
		,old_agreed_value_id 
		,old_deductible_symbol 
		,old_deductible 
		,old_deductible_type_cd 
		,old_deductible_type_desc 
		,old_deductible_basic_cd 
		,old_premium_amt 
		,old_building_desc 
		,old_start_dt 
		,old_end_dt 
		,old_second_value_format_cd 
		,old_second_value_amt 
		,old_off_premises_power_dep_property_commercial_name 
		,old_off_premises_power_dep_property_addr 
		,old_off_premises_power_dep_property_addr_2 
		,old_off_premises_power_dep_property_city 
		,old_off_premises_power_dep_property_postal_code 
		,old_off_premises_power_dep_property_postal_extension_code 
		,old_off_premises_power_dep_property_county 
		,old_off_premises_power_dep_property_state_prov_cd 
		,old_off_premises_power_dep_property_country 
		,audit_action 
	)
	SELECT 	 OLD.sagitem 
			,OLD.lis 
			,OLD.building_number 
			,OLD.subject_insurance_cd 
			,OLD.subject_insurance_desc 
			,OLD.insurance_amt 
			,OLD.blanket_number 
			,OLD.loss_cause_cd 
			,OLD.coinsurance_pct 
			,OLD.inflation_guard_pct 
			,OLD.valuation_type_cd 
			,OLD.agreed_value_id 
			,OLD.deductible_symbol 
			,OLD.deductible 
			,OLD.deductible_type_cd 
			,OLD.deductible_type_desc 
			,OLD.deductible_basic_cd 
			,OLD.premium_amt 
			,OLD.building_desc 
			,OLD.start_dt 
			,OLD.end_dt 
			,OLD.second_value_format_cd 
			,OLD.second_value_amt 
			,OLD.off_premises_power_dep_property_commercial_name 
			,OLD.off_premises_power_dep_property_addr 
			,OLD.off_premises_power_dep_property_addr_2 
			,OLD.off_premises_power_dep_property_city 
			,OLD.off_premises_power_dep_property_postal_code 
			,OLD.off_premises_power_dep_property_postal_extension_code 
			,OLD.off_premises_power_dep_property_county 
			,OLD.off_premises_power_dep_property_state_prov_cd 
			,OLD.off_premises_power_dep_property_country 
			,'I'; 
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_cp_coverages_location_specific_coverage_info_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_cp_coverages_location_specific_coverage_info_d() TO rl_sagitta_x;
GO 

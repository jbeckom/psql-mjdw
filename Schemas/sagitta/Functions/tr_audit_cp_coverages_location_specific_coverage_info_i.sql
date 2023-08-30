CREATE OR REPLACE FUNCTION sagitta.tr_audit_cp_coverages_location_specific_coverage_info_i() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$ 

BEGIN 
	INSERT INTO sagitta.audit_cp_coverages_location_specific_coverage_info (
		 sagitem 
		,lis 
		,new_building_number 
		,new_subject_insurance_cd 
		,new_subject_insurance_desc 
		,new_insurance_amt 
		,new_blanket_number 
		,new_loss_cause_cd 
		,new_coinsurance_pct 
		,new_inflation_guard_pct 
		,new_valuation_type_cd 
		,new_agreed_value_id 
		,new_deductible_symbol 
		,new_deductible 
		,new_deductible_type_cd 
		,new_deductible_type_desc 
		,new_deductible_basic_cd 
		,new_premium_amt 
		,new_building_desc 
		,new_start_dt 
		,new_end_dt 
		,new_second_value_format_cd 
		,new_second_value_amt 
		,new_off_premises_power_dep_property_commercial_name 
		,new_off_premises_power_dep_property_addr 
		,new_off_premises_power_dep_property_addr_2 
		,new_off_premises_power_dep_property_city 
		,new_off_premises_power_dep_property_postal_code 
		,new_off_premises_power_dep_property_postal_extension_code 
		,new_off_premises_power_dep_property_county 
		,new_off_premises_power_dep_property_state_prov_cd 
		,new_off_premises_power_dep_property_country 
		,audit_action 
	)
	SELECT 	 NEW.sagitem 
			,NEW.lis 
			,NEW.building_number 
			,NEW.subject_insurance_cd 
			,NEW.subject_insurance_desc 
			,NEW.insurance_amt 
			,NEW.blanket_number 
			,NEW.loss_cause_cd 
			,NEW.coinsurance_pct 
			,NEW.inflation_guard_pct 
			,NEW.valuation_type_cd 
			,NEW.agreed_value_id 
			,NEW.deductible_symbol 
			,NEW.deductible 
			,NEW.deductible_type_cd 
			,NEW.deductible_type_desc 
			,NEW.deductible_basic_cd 
			,NEW.premium_amt 
			,NEW.building_desc 
			,NEW.start_dt 
			,NEW.end_dt 
			,NEW.second_value_format_cd 
			,NEW.second_value_amt 
			,NEW.off_premises_power_dep_property_commercial_name 
			,NEW.off_premises_power_dep_property_addr 
			,NEW.off_premises_power_dep_property_addr_2 
			,NEW.off_premises_power_dep_property_city 
			,NEW.off_premises_power_dep_property_postal_code 
			,NEW.off_premises_power_dep_property_postal_extension_code 
			,NEW.off_premises_power_dep_property_county 
			,NEW.off_premises_power_dep_property_state_prov_cd 
			,NEW.off_premises_power_dep_property_country 
			,'I'; 
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_cp_coverages_location_specific_coverage_info_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_cp_coverages_location_specific_coverage_info_i() TO rl_sagitta_x;
GO 

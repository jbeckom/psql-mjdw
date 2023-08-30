CREATE OR REPLACE FUNCTION sagitta.tr_audit_eq_coverages_i() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$ 

BEGIN 
	INSERT INTO sagitta.audit_eq_coverages (
		 sagitem 
		,new_audit_staff_cd 
		,new_audit_entry_dt 
		,new_audit_time_ind 
		,new_audit_cd 
		,new_audit_history_record_number 
		,new_audit_program 
		,new_audit_effective_dt 
		,new_audit_change_agency_id 
		,new_policy_agency_id 
		,new_property_at_acquired_locations 
		,new_property_covered_at_all_locations 
		,new_property_in_transit 
		,new_prop_not_at_your_premises_not_on_schedule 
		,new_ded_flat_dollar_amt 
		,new_ded_percentage_of_equipment_value 
		,new_ded_percentage_minimum 
		,new_ded_percentage_maximum 
		,new_ded_annual_aggregate 
		,new_catastrophe_limit_per_event_accident 
		,new_eq_flood_catastrophe_loss_amt 
		,new_equipment_blanket_amt 
		,new_equipment_coins_pct 
		,new_off_dt 
		,new_schedule_type 
		,new_location_no 
		,new_building_no 
		,new_building_desc 
		,new_reporting 
		,new_reporting_deposit_premium 
		,new_reporting_minimum_ann_premium 
		,new_reporting_reporting_period 
		,new_reporting_adjustment_period 
		,new_reporting_first_prem_base 
		,new_reporting_second_prem_base 
		,new_reporting_third_prem_base 
		,new_reporting_first_rate 
		,new_reporting_second_rate 
		,new_non_reporting 
		,new_non_reporting_first_rate 
		,new_non_reporting_rate 
		,new_non_reporting_premium 
		,new_aoi_seq_no 
		,audit_action 
	)
	SELECT 	 NEW.sagitem 
			,NEW.audit_staff_cd 
			,NEW.audit_entry_dt 
			,NEW.audit_time_ind 
			,NEW.audit_cd 
			,NEW.audit_history_record_number 
			,NEW.audit_program 
			,NEW.audit_effective_dt 
			,NEW.audit_change_agency_id 
			,NEW.policy_agency_id 
			,NEW.property_at_acquired_locations 
			,NEW.property_covered_at_all_locations 
			,NEW.property_in_transit 
			,NEW.prop_not_at_your_premises_not_on_schedule 
			,NEW.ded_flat_dollar_amt 
			,NEW.ded_percentage_of_equipment_value 
			,NEW.ded_percentage_minimum 
			,NEW.ded_percentage_maximum 
			,NEW.ded_annual_aggregate 
			,NEW.catastrophe_limit_per_event_accident 
			,NEW.eq_flood_catastrophe_loss_amt 
			,NEW.equipment_blanket_amt 
			,NEW.equipment_coins_pct 
			,NEW.off_dt 
			,NEW.schedule_type 
			,NEW.location_no 
			,NEW.building_no 
			,NEW.building_desc 
			,NEW.reporting 
			,NEW.reporting_deposit_premium 
			,NEW.reporting_minimum_ann_premium 
			,NEW.reporting_reporting_period 
			,NEW.reporting_adjustment_period 
			,NEW.reporting_first_prem_base 
			,NEW.reporting_second_prem_base 
			,NEW.reporting_third_prem_base 
			,NEW.reporting_first_rate 
			,NEW.reporting_second_rate 
			,NEW.non_reporting 
			,NEW.non_reporting_first_rate 
			,NEW.non_reporting_rate 
			,NEW.non_reporting_premium 
			,NEW.aoi_seq_no 
			,'I';
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_eq_coverages_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_eq_coverages_i() TO rl_sagitta_x;
GO 

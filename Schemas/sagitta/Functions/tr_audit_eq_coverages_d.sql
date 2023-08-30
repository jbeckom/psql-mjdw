CREATE OR REPLACE FUNCTION sagitta.tr_audit_eq_coverages_d() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$ 

BEGIN 
	INSERT INTO sagitta.audit_eq_coverages (
		 sagitem 
		,old_audit_staff_cd 
		,old_audit_entry_dt 
		,old_audit_time_ind 
		,old_audit_cd 
		,old_audit_history_record_number 
		,old_audit_program 
		,old_audit_effective_dt 
		,old_audit_change_agency_id 
		,old_policy_agency_id 
		,old_property_at_acquired_locations 
		,old_property_covered_at_all_locations 
		,old_property_in_transit 
		,old_prop_not_at_your_premises_not_on_schedule 
		,old_ded_flat_dollar_amt 
		,old_ded_percentage_of_equipment_value 
		,old_ded_percentage_minimum 
		,old_ded_percentage_maximum 
		,old_ded_annual_aggregate 
		,old_catastrophe_limit_per_event_accident 
		,old_eq_flood_catastrophe_loss_amt 
		,old_equipment_blanket_amt 
		,old_equipment_coins_pct 
		,old_off_dt 
		,old_schedule_type 
		,old_location_no 
		,old_building_no 
		,old_building_desc 
		,old_reporting 
		,old_reporting_deposit_premium 
		,old_reporting_minimum_ann_premium 
		,old_reporting_reporting_period 
		,old_reporting_adjustment_period 
		,old_reporting_first_prem_base 
		,old_reporting_second_prem_base 
		,old_reporting_third_prem_base 
		,old_reporting_first_rate 
		,old_reporting_second_rate 
		,old_non_reporting 
		,old_non_reporting_first_rate 
		,old_non_reporting_rate 
		,old_non_reporting_premium 
		,old_aoi_seq_no 
		,audit_action 
	)
	SELECT 	 OLD.sagitem 
			,OLD.audit_staff_cd 
			,OLD.audit_entry_dt 
			,OLD.audit_time_ind 
			,OLD.audit_cd 
			,OLD.audit_history_record_number 
			,OLD.audit_program 
			,OLD.audit_effective_dt 
			,OLD.audit_change_agency_id 
			,OLD.policy_agency_id 
			,OLD.property_at_acquired_locations 
			,OLD.property_covered_at_all_locations 
			,OLD.property_in_transit 
			,OLD.prop_not_at_your_premises_not_on_schedule 
			,OLD.ded_flat_dollar_amt 
			,OLD.ded_percentage_of_equipment_value 
			,OLD.ded_percentage_minimum 
			,OLD.ded_percentage_maximum 
			,OLD.ded_annual_aggregate 
			,OLD.catastrophe_limit_per_event_accident 
			,OLD.eq_flood_catastrophe_loss_amt 
			,OLD.equipment_blanket_amt 
			,OLD.equipment_coins_pct 
			,OLD.off_dt 
			,OLD.schedule_type 
			,OLD.location_no 
			,OLD.building_no 
			,OLD.building_desc 
			,OLD.reporting 
			,OLD.reporting_deposit_premium 
			,OLD.reporting_minimum_ann_premium 
			,OLD.reporting_reporting_period 
			,OLD.reporting_adjustment_period 
			,OLD.reporting_first_prem_base 
			,OLD.reporting_second_prem_base 
			,OLD.reporting_third_prem_base 
			,OLD.reporting_first_rate 
			,OLD.reporting_second_rate 
			,OLD.non_reporting 
			,OLD.non_reporting_first_rate 
			,OLD.non_reporting_rate 
			,OLD.non_reporting_premium 
			,OLD.aoi_seq_no 
			,'D';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_eq_coverages_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_eq_coverages_d() TO rl_sagitta_x;
GO 

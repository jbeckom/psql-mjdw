CREATE OR REPLACE FUNCTION sagitta.sp_eq_coverages_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$ 

DECLARE rc int;

BEGIN 
	INSERT INTO sagitta.eq_coverages (
		 sagitem 
		,audit_staff_cd 
		,audit_entry_dt 
		,audit_time_ind 
		,audit_cd 
		,audit_history_record_number 
		,audit_program 
		,audit_effective_dt 
		,audit_change_agency_id 
		,policy_agency_id 
		,property_at_acquired_locations 
		,property_covered_at_all_locations 
		,property_in_transit 
		,prop_not_at_your_premises_not_on_schedule 
		,ded_flat_dollar_amt 
		,ded_percentage_of_equipment_value 
		,ded_percentage_minimum 
		,ded_percentage_maximum 
		,ded_annual_aggregate 
		,catastrophe_limit_per_event_accident 
		,eq_flood_catastrophe_loss_amt 
		,equipment_blanket_amt 
		,equipment_coins_pct 
		,off_dt 
		,schedule_type 
		,location_no 
		,building_no 
		,building_desc 
		,reporting 
		,reporting_deposit_premium 
		,reporting_minimum_ann_premium 
		,reporting_reporting_period 
		,reporting_adjustment_period 
		,reporting_first_prem_base 
		,reporting_second_prem_base 
		,reporting_third_prem_base 
		,reporting_first_rate 
		,reporting_second_rate 
		,non_reporting 
		,non_reporting_first_rate 
		,non_reporting_rate 
		,non_reporting_premium 
		,aoi_seq_no 
	)
	SELECT 	 sagitem 
			,audit_staff_cd 
			,audit_entry_dt 
			,audit_time_ind 
			,audit_cd 
			,audit_history_record_number 
			,audit_program 
			,audit_effective_dt 
			,audit_change_agency_id 
			,policy_agency_id 
			,property_at_acquired_locations 
			,property_covered_at_all_locations 
			,property_in_transit 
			,prop_not_at_your_premises_not_on_schedule 
			,ded_flat_dollar_amt 
			,ded_percentage_of_equipment_value 
			,ded_percentage_minimum 
			,ded_percentage_maximum 
			,ded_annual_aggregate 
			,catastrophe_limit_per_event_accident 
			,eq_flood_catastrophe_loss_amt 
			,equipment_blanket_amt 
			,equipment_coins_pct 
			,off_dt 
			,schedule_type 
			,location_no 
			,building_no 
			,building_desc 
			,reporting 
			,reporting_deposit_premium 
			,reporting_minimum_ann_premium 
			,reporting_reporting_period 
			,reporting_adjustment_period 
			,reporting_first_prem_base 
			,reporting_second_prem_base 
			,reporting_third_prem_base 
			,reporting_first_rate 
			,reporting_second_rate 
			,non_reporting 
			,non_reporting_first_rate 
			,non_reporting_rate 
			,non_reporting_premium 
			,aoi_seq_no 
	FROM 	sagitta.stg_eq_coverages 
	ON CONFLICT (sagitem) DO UPDATE 
	SET 	 audit_staff_cd 								= excluded.audit_staff_cd 
			,audit_entry_dt 								= excluded.audit_entry_dt 
			,audit_time_ind 								= excluded.audit_time_ind 
			,audit_cd 										= excluded.audit_cd 
			,audit_history_record_number 					= excluded.audit_history_record_number 
			,audit_program 									= excluded.audit_program 
			,audit_effective_dt 							= excluded.audit_effective_dt 
			,audit_change_agency_id 						= excluded.audit_change_agency_id 
			,policy_agency_id 								= excluded.policy_agency_id 
			,property_at_acquired_locations 				= excluded.property_at_acquired_locations 
			,property_covered_at_all_locations 				= excluded.property_covered_at_all_locations 
			,property_in_transit 							= excluded.property_in_transit 
			,prop_not_at_your_premises_not_on_schedule 		= excluded.prop_not_at_your_premises_not_on_schedule 
			,ded_flat_dollar_amt 							= excluded.ded_flat_dollar_amt 
			,ded_percentage_of_equipment_value 				= excluded.ded_percentage_of_equipment_value 
			,ded_percentage_minimum 						= excluded.ded_percentage_minimum 
			,ded_percentage_maximum 						= excluded.ded_percentage_maximum 
			,ded_annual_aggregate 							= excluded.ded_annual_aggregate 
			,catastrophe_limit_per_event_accident 			= excluded.catastrophe_limit_per_event_accident 
			,eq_flood_catastrophe_loss_amt 					= excluded.eq_flood_catastrophe_loss_amt 
			,equipment_blanket_amt 							= excluded.equipment_blanket_amt 
			,equipment_coins_pct 							= excluded.equipment_coins_pct 
			,off_dt 										= excluded.off_dt 
			,schedule_type 									= excluded.schedule_type 
			,location_no 									= excluded.location_no 
			,building_no 									= excluded.building_no 
			,building_desc 									= excluded.building_desc 
			,reporting 										= excluded.reporting 
			,reporting_deposit_premium 						= excluded.reporting_deposit_premium 
			,reporting_minimum_ann_premium 					= excluded.reporting_minimum_ann_premium 
			,reporting_reporting_period 					= excluded.reporting_reporting_period 
			,reporting_adjustment_period 					= excluded.reporting_adjustment_period 
			,reporting_first_prem_base 						= excluded.reporting_first_prem_base 
			,reporting_second_prem_base 					= excluded.reporting_second_prem_base 
			,reporting_third_prem_base 						= excluded.reporting_third_prem_base 
			,reporting_first_rate 							= excluded.reporting_first_rate 
			,reporting_second_rate 							= excluded.reporting_second_rate 
			,non_reporting 									= excluded.non_reporting 
			,non_reporting_first_rate 						= excluded.non_reporting_first_rate 
			,non_reporting_rate 							= excluded.non_reporting_rate 
			,non_reporting_premium 							= excluded.non_reporting_premium 
			,aoi_seq_no 									= excluded.aoi_seq_no 
	WHERE 	(eq_coverages.audit_staff_cd,eq_coverages.audit_entry_dt,eq_coverages.audit_time_ind,eq_coverages.audit_cd,eq_coverages.audit_history_record_number,eq_coverages.audit_program,eq_coverages.audit_effective_dt,eq_coverages.audit_change_agency_id,eq_coverages.policy_agency_id,eq_coverages.property_at_acquired_locations,eq_coverages.property_covered_at_all_locations,eq_coverages.property_in_transit,eq_coverages.prop_not_at_your_premises_not_on_schedule,eq_coverages.ded_flat_dollar_amt,eq_coverages.ded_percentage_of_equipment_value,eq_coverages.ded_percentage_minimum,eq_coverages.ded_percentage_maximum,eq_coverages.ded_annual_aggregate,eq_coverages.catastrophe_limit_per_event_accident,eq_coverages.eq_flood_catastrophe_loss_amt,eq_coverages.equipment_blanket_amt,eq_coverages.equipment_coins_pct,eq_coverages.off_dt,eq_coverages.schedule_type,eq_coverages.location_no,eq_coverages.building_no,eq_coverages.building_desc,eq_coverages.reporting,eq_coverages.reporting_deposit_premium,eq_coverages.reporting_minimum_ann_premium,eq_coverages.reporting_reporting_period,eq_coverages.reporting_adjustment_period,eq_coverages.reporting_first_prem_base,eq_coverages.reporting_second_prem_base,eq_coverages.reporting_third_prem_base,eq_coverages.reporting_first_rate,eq_coverages.reporting_second_rate,eq_coverages.non_reporting,eq_coverages.non_reporting_first_rate,eq_coverages.non_reporting_rate,eq_coverages.non_reporting_premium,eq_coverages.aoi_seq_no) 
		IS DISTINCT FROM 	(excluded.audit_staff_cd,excluded.audit_entry_dt,excluded.audit_time_ind,excluded.audit_cd,excluded.audit_history_record_number,excluded.audit_program,excluded.audit_effective_dt,excluded.audit_change_agency_id,excluded.policy_agency_id,excluded.property_at_acquired_locations,excluded.property_covered_at_all_locations,excluded.property_in_transit,excluded.prop_not_at_your_premises_not_on_schedule,excluded.ded_flat_dollar_amt,excluded.ded_percentage_of_equipment_value,excluded.ded_percentage_minimum,excluded.ded_percentage_maximum,excluded.ded_annual_aggregate,excluded.catastrophe_limit_per_event_accident,excluded.eq_flood_catastrophe_loss_amt,excluded.equipment_blanket_amt,excluded.equipment_coins_pct,excluded.off_dt,excluded.schedule_type,excluded.location_no,excluded.building_no,excluded.building_desc,excluded.reporting,excluded.reporting_deposit_premium,excluded.reporting_minimum_ann_premium,excluded.reporting_reporting_period,excluded.reporting_adjustment_period,excluded.reporting_first_prem_base,excluded.reporting_second_prem_base,excluded.reporting_third_prem_base,excluded.reporting_first_rate,excluded.reporting_second_rate,excluded.non_reporting,excluded.non_reporting_first_rate,excluded.non_reporting_rate,excluded.non_reporting_premium,excluded.aoi_seq_no); 
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_eq_coverages_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_eq_coverages_upsert() TO rl_sagitta_x;
GO 

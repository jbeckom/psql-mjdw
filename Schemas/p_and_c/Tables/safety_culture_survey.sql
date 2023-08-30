DROP TABLE IF EXISTS p_and_c.safety_culture_survey;
GO

CREATE TABLE p_and_c.safety_culture_survey (
	client varchar(4096) NULL,
	respondent_id int8 NULL,
	start_date timestamp NULL,
	end_date timestamp NULL,
	language varchar(4096) NULL,
	demo1 varchar(4096) NULL,
	demo2 varchar(4096) NULL,
	demo3 varchar(4096) NULL,
	demo4 varchar(4096) NULL,
	demo5 varchar(4096) NULL,
	demo6 varchar(4096) NULL,
	"i_believe_senior_management_is_committed" varchar(4096) NULL,
	"i_believe_senior_management_places" varchar(4096) NULL,
	"i_believe_senior_management_provides" varchar(4096) NULL,
	"i_believe_my_direct_supervisor_supports_a_high" varchar(4096) NULL,
	"i_believe_my_direct_supervisor_incorporates_safety" varchar(4096) NULL,
	"i_believe_my_direct_supervisor_cares_more" varchar(4096) NULL,
	"i_believe_company_management_at_all_levels" varchar(4096) NULL,
	"i_was_trained_effectively_on_the_company_safety" varchar(4096) NULL,
	"i_know_who_to_ask_when_i_have_safety_concerns" varchar(4096) NULL,
	"i_am_required_to_report_any_injury" varchar(4096) NULL,
	"i_report_all_near_miss" varchar(4096) NULL,
	"when_a_serious_injury_occurs" varchar(4096) NULL,
	"i_am_aware_of_our_return_to_work" varchar(4096) NULL,
	"i_am_provided_with_all_the_necessary" varchar(4096) NULL,
	"housekeeping_in_my_work_area_is_generally" varchar(4096) NULL,
	"the_pace_of_my_work_allows_me_to_work_safely" varchar(4096) NULL,
	"drug_and_or_alcohol_use_is_not_a_concern" varchar(4096) NULL,
	"walking_and_working_surfaces" varchar(4096) NULL,
	"language_barriers_are_not_a_safety_concern" varchar(4096) NULL,
	"manual_material_handling_equipment" varchar(4096) NULL,
	"the_lighting_in_my_work_area_is_adequate" varchar(4096) NULL,
	"i_was_given_effective_safety_orientation" varchar(4096) NULL,
	"i_am_given_safety_training_throughout_the_year" varchar(4096) NULL,
	"the_training_i_receive_helps_me" varchar(4096) NULL,
	"i_have_been_trained_on_how_to_respond" varchar(4096) NULL,
	"i_know_where_to_go_for_first_aid" varchar(4096) NULL,
	"my_co_workers_are_regularly_engaged" varchar(4096) NULL,
	"i_am_comfortable_voicing_any_safety_concerns" varchar(4096) NULL,
	"i_feel_like_my_co_workers_around_me" varchar(4096) NULL,
	"i_am_comfortable_taking_the_time" varchar(4096) NULL,
	"i_believe_that_i_have_shared_ownership" varchar(4096) NULL,
	"i_feel_comfortable_stopping_my_work" varchar(4096) NULL,
	"safety_policies_procedures" varchar(4096) NULL,
	"personal_protective_equipment_ppe_policy" varchar(4096) NULL,
	"accident_reporting" varchar(4096) NULL,
	"drug_free_workplace_policy" varchar(4096) NULL,
	"alcohol_free_workplace_policy" varchar(4096) NULL,
	"safety_policies" varchar(4096) NULL,
	"drug_alcohol_free_workplace_policies" varchar(4096) NULL,
	"housekeeping_procedures" varchar(4096) NULL,
	"safety_audits" varchar(4096) NULL,
	"return_to_work_modified_duty_program" varchar(4096) NULL,
	"i_have_received_effective_training_of_our_companys_fleet" varchar(4096) NULL,
	"i_understand_the_state_laws" varchar(4096) NULL,
	"i_have_the_proper_training_to_safely_operate_a_heavy" varchar(4096) NULL,
	"i_understand_the_requirement_to_report_any_driving" varchar(4096) NULL,
	"i_am_aware_of_our_companys_safety_protocol_to" varchar(4096) NULL,
	"i_always_wear_a_seat_belt" varchar(4096) NULL,
	"i_always_complete_and_properly_document" varchar(4096) NULL,
	"i_do_not_feel_pressured_to_respond_to_any" varchar(4096) NULL,
	"i_understand_the_importance_of_our_vehicle_telematics" varchar(4096) NULL,
	"the_timeliness_expectations_of_my_route" varchar(4096) NULL,
	"the_heavy_commercial_vehicles_i_operate" varchar(4096) NULL,
	"if_stopped_for_a_dot_roadside_inspection" varchar(4096) NULL,
	"as_a_driver_required_to_keep_electronic_logs" varchar(4096) NULL,
	"custom1" varchar(4096) NULL,
	"custom2" varchar(4096) NULL,
	"custom3" varchar(4096) NULL,
	"custom4" varchar(4096) NULL,
	"custom5" varchar(4096) NULL,
	"custom6" varchar(4096) NULL,
	"custom7" varchar(4096) NULL,
	"hazard1" varchar(4096) NULL,
	"hazard2" varchar(4096) NULL,
	"hazard3" varchar(4096) NULL,
	"what_is_the_single_biggest_thing" varchar(4096) NULL,
	"please_provide_any_additional_comments" varchar(4096) NULL,
	client_id varchar(256) NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.safety_culture_survey OWNER TO mj_admin;
GO

Grant select on table p_and_c.safety_culture_survey to rl_pc_data_analyst;
GO

Grant select on table p_and_c.safety_culture_survey to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.safety_culture_survey to rpauser;
GO
GRANT SELECT ON p_and_c.safety_culture_survey to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.safety_culture_survey to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.safety_culture_survey to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.safety_culture_survey to rl_p_and_c_d;
GO
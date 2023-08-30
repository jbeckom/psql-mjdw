CREATE TABLE p_and_c.tiqs_sov (
	client varchar(512) NULL,
	named_insured varchar(512) NULL,
	department varchar(512) NULL,
	location_number varchar(512) NULL,
	building_number varchar(512) NULL,
	"name" varchar(512) NULL,
	client_location_code varchar(512) NULL,
	address varchar(512) NULL,
	city varchar(512) NULL,
	state varchar(512) NULL,
	zip_code varchar(512) NULL,
	county varchar(512) NULL,
	country varchar(512) NULL,
	building varchar(512) NULL,
	service_equipment varchar(512) NULL,
	fixed_equipment varchar(512) NULL,
	trash_compactor varchar(512) NULL,
	detached_sign_fence varchar(512) NULL,
	garages_and_carports varchar(512) NULL,
	playground varchar(512) NULL,
	pool varchar(512) NULL,
	outdoor_fireplace varchar(512) NULL,
	tennis_courts varchar(512) NULL,
	exercise_room varchar(512) NULL,
	fences varchar(512) NULL,
	bins varchar(512) NULL,
	paved_surfaces varchar(512) NULL,
	tenants_improvements_betterments varchar(512) NULL,
	misc_business_personal_property varchar(512) NULL,
	mobile_equipment varchar(512) NULL,
	personal_property_of_others varchar(512) NULL,
	computer_hardware_software varchar(512) NULL,
	golf_carts varchar(512) NULL,
	furniture_fixtures varchar(512) NULL,
	model_furniture varchar(512) NULL,
	avg_finished_inventory varchar(512) NULL,
	max_finished_inventory varchar(512) NULL,
	avg_raw_inventory varchar(512) NULL,
	max_raw_inventory varchar(512) NULL,
	avg_inventory_outside_in_the_open varchar(512) NULL,
	max_inventory_outside_in_the_open varchar(512) NULL,
	avg_purchased_inventory varchar(512) NULL,
	max_purchased_inventory varchar(512) NULL,
	avg_parts_inventory varchar(512) NULL,
	max_parts_inventory varchar(512) NULL,
	avg_property_of_others varchar(512) NULL,
	max_property_of_others varchar(512) NULL,
	avg_products_on_consignment varchar(512) NULL,
	max_products_on_consignment varchar(512) NULL,
	average_stock_inventory varchar(512) NULL,
	max_stock_inventory varchar(512) NULL,
	business_income varchar(512) NULL,
	extra_expense varchar(512) NULL,
	bi_actual_loss_sustained varchar(512) NULL,
	bi_included varchar(512) NULL,
	building_owner varchar(512) NULL,
	building_status varchar(512) NULL,
	construction_type varchar(512) NULL,
	ibc_occupancy_building_function varchar(512) NULL,
	atc_occupancy_building_function varchar(512) NULL,
	year_built varchar(512) NULL,
	sq_ft varchar(512) NULL,
	acreage varchar(512) NULL,
	number_of_stories varchar(512) NULL,
	height_ft_ varchar(512) NULL,
	number_of_units varchar(512) NULL,
	sprinklered varchar(512) NULL,
	protection_class varchar(512) NULL,
	fire_alarm varchar(512) NULL,
	security_alarm varchar(512) NULL,
	roof_type varchar(512) NULL,
	flood_zone varchar(512) NULL,
	electrical_updates varchar(512) NULL,
	hvac_updates varchar(512) NULL,
	roof_updates varchar(512) NULL,
	plumbing_updates varchar(512) NULL,
	distance_to_fire_dept_mi_ varchar(512) NULL,
	distance_to_salt_water_mi_ varchar(512) NULL,
	distance_to_body_of_water_mi_ varchar(512) NULL,
	headcount varchar(512) NULL,
	estimated_start_date_of_project_ varchar(512) NULL,
	estimated_end_date_of_project varchar(512) NULL,
	estimated_term_of_project_months_ varchar(512) NULL,
	type_of_project varchar(512) NULL,
	completed_value varchar(512) NULL,
	hard_costs varchar(512) NULL,
	property_in_transit varchar(512) NULL,
	property_in_storage varchar(512) NULL,
	soft_costs varchar(512) NULL,
	delay_loss_of_rents varchar(512) NULL,
	delay_loss_of_earnings varchar(512) NULL,
	hot_work varchar(512) NULL,
	"security" varchar(512) NULL,
	valuation varchar(512) NULL,
	notes varchar(512) NULL,
	dependent_bi varchar(512) NULL,
	rents varchar(512) NULL,
	garage_rents varchar(512) NULL,
	total_building_machinery_equipment varchar(512) NULL,
	total_bpp_contents varchar(512) NULL,
	client_location_id varchar(512) NULL,
	id varchar(512) NULL,
	uploaded_at date NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.tiqs_sov OWNER TO mj_admin;
GO

Grant select on table p_and_c.tiqs_sov to rl_pc_data_analyst;
GO

Grant update, insert, select on table p_and_c.tiqs_sov to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.tiqs_sov to rpauser;
GO
GRANT SELECT ON p_and_c.tiqs_sov to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.tiqs_sov to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.tiqs_sov to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.tiqs_sov to rl_p_and_c_d;
GO
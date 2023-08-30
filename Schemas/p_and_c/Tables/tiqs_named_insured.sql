CREATE TABLE p_and_c.tiqs_named_insured (
	client varchar(512) NULL,
	named_insured varchar(512) NULL,
	fein varchar(512) NULL,
	ownership_ varchar(512) NULL,
	description varchar(4096) NULL,
	commercial_property varchar(512) NULL,
	general_liability varchar(512) NULL,
	commercial_automobile varchar(512) NULL,
	workers_compensation varchar(512) NULL,
	umbrella_excess varchar(512) NULL,
	inland_marine varchar(512) NULL,
	management_practices_liability varchar(512) NULL,
	cyber varchar(512) NULL,
	add_plus_medical varchar(512) NULL,
	agency_service_fee varchar(512) NULL,
	aircraft_liability varchar(512) NULL,
	animal_mortality varchar(512) NULL,
	assigned_risk_work_comp varchar(512) NULL,
	boiler_and_machinery varchar(512) NULL,
	bond_maintenance varchar(512) NULL,
	bond_misc_needs_release varchar(512) NULL,
	bond_misc_continuous varchar(512) NULL,
	bond_notary varchar(512) NULL,
	bond_performance varchar(512) NULL,
	bond_subdivision varchar(512) NULL,
	builder_s_risk varchar(512) NULL,
	business_owners varchar(512) NULL,
	comm_property_excess varchar(512) NULL,
	comm_umb_excess_liab varchar(512) NULL,
	comm_excess_liability varchar(512) NULL,
	commercial_package varchar(512) NULL,
	comm_umbrella varchar(512) NULL,
	contingent_auto_liability varchar(512) NULL,
	contingent_bus_income varchar(512) NULL,
	credit_insurance_comm varchar(512) NULL,
	crime varchar(512) NULL,
	difference_in_conditions varchar(512) NULL,
	earthquake_commercial varchar(512) NULL,
	earthquake_excess varchar(512) NULL,
	employment_practices_liab varchar(512) NULL,
	equipment_floater varchar(512) NULL,
	errors_and_omissions varchar(512) NULL,
	events varchar(512) NULL,
	excess_crime varchar(512) NULL,
	excess_management_prac_li varchar(512) NULL,
	farm_owners_commercial varchar(512) NULL,
	fidelity_bonds varchar(512) NULL,
	fiduciary varchar(512) NULL,
	financial_package varchar(512) NULL,
	flood_commercial varchar(512) NULL,
	flood_excess varchar(512) NULL,
	foreign_commercial_package varchar(512) NULL,
	foreign_liability varchar(512) NULL,
	garage_liability varchar(512) NULL,
	group_travel_accident varchar(512) NULL,
	hull_p_i_combined varchar(512) NULL,
	indiv_travel_accident varchar(512) NULL,
	inland_marine_personal varchar(512) NULL,
	kidnap_ransom_extortion varchar(512) NULL,
	liquor_liability varchar(512) NULL,
	marine_excess_liability varchar(512) NULL,
	member_accident varchar(512) NULL,
	motor_carrier_contingent varchar(512) NULL,
	motor_truck_cargo varchar(512) NULL,
	occupational_accident varchar(512) NULL,
	ocean_marine varchar(512) NULL,
	owner_operator_liability varchar(512) NULL,
	owner_operator_phys_dmg varchar(512) NULL,
	owners_protective_liablty varchar(512) NULL,
	passenger_accident varchar(512) NULL,
	personal_umbrella varchar(512) NULL,
	pollution_liability varchar(512) NULL,
	product_liability varchar(512) NULL,
	product_liability_exces varchar(512) NULL,
	product_recall varchar(512) NULL,
	professional_liab_non_med varchar(512) NULL,
	professional_liab_excess varchar(512) NULL,
	professional_liab_medical varchar(512) NULL,
	railroad_car_coverage varchar(512) NULL,
	railroad_protective_liab varchar(512) NULL,
	risk_services_fee varchar(512) NULL,
	surety_bonds varchar(512) NULL,
	tail_coverage varchar(512) NULL,
	terrorism varchar(512) NULL,
	truckers varchar(512) NULL,
	truckers_auto_liability varchar(512) NULL,
	truckers_physical_damage varchar(512) NULL,
	wind varchar(512) NULL,
	workers_compensation_excess varchar(512) NULL,
	stock_throughput varchar(512) NULL,
	hired_non_owned_auto varchar(512) NULL,
	edp varchar(512) NULL,
	excess_umbrella varchar(512) NULL,
	excess_d_o varchar(512) NULL,
	additional_information varchar(512) NULL,
	ammunition_storage varchar(512) NULL,
	id_fraud varchar(512) NULL,
	notes varchar(512) NULL,
	id varchar(512) NULL,
	uploaded_at date NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.tiqs_named_insured OWNER TO mj_admin;
GO

Grant select on table p_and_c.tiqs_named_insured to rl_pc_data_analyst;
GO

Grant update, insert, select on table p_and_c.tiqs_named_insured to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.tiqs_named_insured to rpauser;
GO
GRANT SELECT ON p_and_c.tiqs_named_insured to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.tiqs_named_insured to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.tiqs_named_insured to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.tiqs_named_insured to rl_p_and_c_d;
GO
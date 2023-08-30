CREATE TABLE p_and_c.elilill_mv_collision_tracker (
	incident_number int4 NOT NULL,
	date_time_reported timestamp NOT NULL,
	date_time_incident timestamp NOT NULL,
	"month" varchar(12) NOT NULL,
	day_of_week varchar(12) NOT NULL,
	state_of_incident varchar(2) NULL,
	employee_name varchar(64) NOT NULL,
	employee_id int4 NOT NULL,
	registered_with_copilot varchar(3) NULL,
	copilot_notes varchar(256) NULL,
	violation varchar(256) NULL,
	business_unit varchar(64) NOT NULL,
	supervisor varchar(64) NOT NULL,
	area_leader varchar(64) NULL,
	years_as_a_driver int4 NULL,
	truce_connected varchar(64) NULL,
	collision_code varchar(64) NOT NULL,
	collision_type varchar(64) NOT NULL,
	element_description varchar(2048) NOT NULL,
	traveling_speed varchar(3) NOT NULL,
	unit_number varchar(7) NULL,
	vehicle_type varchar(64) NULL,
	journey_purpose varchar(16) NOT NULL,
	phone_handling varchar(16) NOT NULL,
	airbag_deployed varchar(3) NOT NULL,
	ee_injured varchar(16) NOT NULL,
	life_near_miss varchar(16) NOT NULL,
	life_near_miss_criteria varchar(256) NULL,
	uploaded_at date NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.elilill_mv_collision_tracker OWNER TO mj_admin;
GO

Grant select on table p_and_c.elilill_mv_collision_tracker to rl_pc_data_analyst;
GO

Grant select on table p_and_c.elilill_mv_collision_tracker to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.elilill_mv_collision_tracker to rpauser;
GO

GRANT SELECT ON p_and_c.elilill_mv_collision_tracker to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.elilill_mv_collision_tracker to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.elilill_mv_collision_tracker to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.elilill_mv_collision_tracker to rl_p_and_c_d;
GO
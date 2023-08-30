CREATE TABLE p_and_c.tiqs_pollution (
	client varchar(512) NULL,
	entity varchar(512) NULL,
	storage_tank_number_0 varchar(512) NULL,
	storage_tank_id varchar(512) NULL,
	tank_type varchar(512) NULL,
	installation_date varchar(512) NULL,
	tank_secondary_containment varchar(512) NULL,
	piping_secondary_containment varchar(512) NULL,
	automotive_overfill_or_spill_detection varchar(512) NULL,
	electronic_leak_detection varchar(512) NULL,
	capacity_in_gallons varchar(512) NULL,
	"content" varchar(512) NULL,
	description_of_other_content varchar(512) NULL,
	address varchar(512) NULL,
	city varchar(512) NULL,
	state varchar(512) NULL,
	zip_code varchar(512) NULL,
	county varchar(512) NULL,
	country varchar(512) NULL,
	testing_method varchar(512) NULL,
	notes varchar(512) NULL,
	retro_date varchar(512) NULL,
	id varchar(512) NULL,
	uploaded_at date NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.tiqs_pollution OWNER TO mj_admin;
GO

Grant select on table p_and_c.tiqs_pollution to rl_pc_data_analyst;
GO

Grant update, insert, select on table p_and_c.tiqs_pollution to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.tiqs_pollution to rpauser;
GO
GRANT SELECT ON p_and_c.tiqs_pollution to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.tiqs_pollution to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.tiqs_pollution to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.tiqs_pollution to rl_p_and_c_d;
GO
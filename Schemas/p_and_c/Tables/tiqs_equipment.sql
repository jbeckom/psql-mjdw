CREATE TABLE p_and_c.tiqs_equipment (
	client varchar(512) NULL,
	insured_number varchar(512) NULL,
	location_number varchar(512) NULL,
	named_insured varchar(512) NULL,
	department varchar(512) NULL,
	category varchar(512) NULL,
	"type" varchar(512) NULL,
	description varchar(512) NULL,
	serial_number varchar(512) NULL,
	"year" varchar(512) NULL,
	manufacturer varchar(512) NULL,
	model_series varchar(512) NULL,
	value varchar(512) NULL,
	address varchar(512) NULL,
	city varchar(512) NULL,
	state varchar(512) NULL,
	zipcode varchar(512) NULL,
	country varchar(512) NULL,
	additional_interest varchar(512) NULL,
	additional_interest_address varchar(512) NULL,
	interest_type varchar(512) NULL,
	ownership_name varchar(512) NULL,
	notes varchar(512) NULL,
	cost_new varchar(512) NULL,
	id varchar(512) NULL,
	uploaded_at date NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.tiqs_equipment OWNER TO mj_admin;
GO

Grant select on table p_and_c.tiqs_equipment to rl_pc_data_analyst;
GO

Grant update, insert, select on table p_and_c.tiqs_equipment to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.tiqs_equipment to rpauser;
GO
GRANT SELECT ON p_and_c.tiqs_equipment to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.tiqs_equipment to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.tiqs_equipment to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.tiqs_equipment to rl_p_and_c_d;
GO
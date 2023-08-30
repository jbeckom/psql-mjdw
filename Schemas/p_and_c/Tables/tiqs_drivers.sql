CREATE TABLE p_and_c.tiqs_drivers (
	client varchar(512) NULL,
	first_name varchar(512) NULL,
	middle_initial varchar(512) NULL,
	last_name varchar(512) NULL,
	license_number varchar(512) NULL,
	license_type varchar(512) NULL,
	date_of_birth varchar(512) NULL,
	state varchar(512) NULL,
	country varchar(512) NULL,
	date_of_hire varchar(512) NULL,
	number_of_years_driving varchar(512) NULL,
	notes varchar(512) NULL,
	status varchar(512) NULL,
	id varchar(512) NULL,
	uploaded_at date NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.tiqs_drivers OWNER TO mj_admin;
GO

Grant select on table p_and_c.tiqs_drivers to rl_pc_data_analyst;
GO

Grant update, insert, select on table p_and_c.tiqs_drivers to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.tiqs_drivers to rpauser;
GO
GRANT SELECT ON p_and_c.tiqs_drivers to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.tiqs_drivers to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.tiqs_drivers to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.tiqs_drivers to rl_p_and_c_d;
GO
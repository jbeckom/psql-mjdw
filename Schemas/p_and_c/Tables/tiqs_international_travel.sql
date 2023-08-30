CREATE TABLE p_and_c.tiqs_international_travel (
	client varchar(512) NULL,
	country_traveled_to varchar(512) NULL,
	average_stay varchar(512) NULL,
	number_of_trips varchar(512) NULL,
	number_of_employees_traveling varchar(512) NULL,
	number_of_international_auto_rentals varchar(512) NULL,
	purpose_of_visit varchar(512) NULL,
	id varchar(512) NULL,
	uploaded_at date NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.tiqs_international_travel OWNER TO mj_admin;
GO

Grant select on table p_and_c.tiqs_international_travel to rl_pc_data_analyst;
GO

Grant update, insert, select on table p_and_c.tiqs_international_travel to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.tiqs_international_travel to rpauser;
GO
GRANT SELECT ON p_and_c.tiqs_international_travel to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.tiqs_international_travel to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.tiqs_international_travel to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.tiqs_international_travel to rl_p_and_c_d;
GO
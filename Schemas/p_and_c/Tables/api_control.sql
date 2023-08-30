CREATE TABLE p_and_c.api_control (
	"group" varchar(256) NOT NULL,
	api varchar(1024) NOT NULL,
	query_parameters varchar(1024) NOT NULL,
	q_parameter_values varchar(1024) NOT NULL,
	active bool NOT NULL,
	auth_token varchar(256) NOT NULL,
	path_parameters varchar(256) NULL,
	p_parameter_values varchar(256) NULL,
	db_table varchar(256) NULL,
	db_headers varchar(16384) NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.api_control OWNER TO mj_admin;
GO

Grant select on table p_and_c.api_control to rl_pc_data_analyst;
GO

Grant update, insert, select on table p_and_c.api_control to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.api_control to rpauser;
GO
GRANT SELECT ON p_and_c.api_control to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.api_control to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.api_control to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.api_control to rl_p_and_c_d;
GO
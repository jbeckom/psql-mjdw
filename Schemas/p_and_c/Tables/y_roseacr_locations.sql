CREATE TABLE p_and_c.y_roseacr_locations (
	code varchar(16) NOT NULL,
	farm_type varchar(64) NOT NULL,
	farm varchar(64) NOT NULL,
	department varchar(64) NOT NULL,
	CONSTRAINT y_roseacr_locations_pkey PRIMARY KEY (code)
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.y_roseacr_locations OWNER TO mj_admin;
GO

Grant update, insert, select on table p_and_c.y_roseacr_locations to rl_pc_data_analyst;
GO

Grant select on table p_and_c.y_roseacr_locations to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.y_roseacr_locations to rpauser;
GO
GRANT SELECT ON p_and_c.y_roseacr_locations to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.y_roseacr_locations to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.y_roseacr_locations to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.y_roseacr_locations to rl_p_and_c_d;
GO
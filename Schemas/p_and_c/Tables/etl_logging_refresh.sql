CREATE TABLE p_and_c.etl_logging_refresh (
	query varchar(256) NULL,
	success bool NULL,
	end_time timestamp NULL,
	error_message varchar(256) NULL,
	start_time timestamp NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.etl_logging_refresh OWNER TO mj_admin;
GO

Grant select on table p_and_c.etl_logging_refresh to rl_pc_data_analyst;
GO

Grant update, insert, select on table p_and_c.etl_logging_refresh to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.etl_logging_refresh to rpauser;
GO
GRANT SELECT ON p_and_c.etl_logging_refresh to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.etl_logging_refresh to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.etl_logging_refresh to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.etl_logging_refresh to rl_p_and_c_d;
GO
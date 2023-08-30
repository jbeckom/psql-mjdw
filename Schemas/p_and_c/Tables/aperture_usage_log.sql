CREATE TABLE p_and_c.aperture_usage_log (
	user_id varchar(128) NOT NULL,
	access_date timestamptz(0) NOT NULL,
	report varchar(256) NOT NULL,
	dataset varchar(128) NOT NULL,
	consumption_method varchar(256) NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.aperture_usage_log OWNER TO mj_admin;
GO

Grant select on table p_and_c.aperture_usage_log to rl_pc_data_analyst;
GO

Grant update, insert, select on table p_and_c.aperture_usage_log to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.aperture_usage_log to rpauser;
GO
GRANT SELECT ON p_and_c.aperture_usage_log to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.aperture_usage_log to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.aperture_usage_log to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.aperture_usage_log to rl_p_and_c_d;
GO
CREATE TABLE p_and_c.coverage_codes (
	coverage_code text NULL,
	coverage_name text NULL,
	coverage_alias text NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.coverage_codes OWNER TO mj_admin;
GO

Grant update, insert, select on table p_and_c.coverage_codes to rl_pc_data_analyst;
GO

Grant select on table p_and_c.coverage_codes to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.coverage_codes to rpauser;
GO
GRANT SELECT ON p_and_c.coverage_codes to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.coverage_codes to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.coverage_codes to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.coverage_codes to rl_p_and_c_d;
GO
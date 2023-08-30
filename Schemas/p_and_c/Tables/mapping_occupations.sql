CREATE TABLE p_and_c.mapping_occupations (
	carrier_occupation varchar(256) NULL,
	occupation varchar(256) NOT NULL,
	client_id varchar(256) NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.mapping_occupations OWNER TO mj_admin;
GO

Grant update, insert, select on table p_and_c.mapping_occupations to rl_pc_data_analyst;
GO

Grant select on table p_and_c.mapping_occupations to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.mapping_occupations to rpauser;
GO
GRANT SELECT ON p_and_c.mapping_occupations to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.mapping_occupations to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.mapping_occupations to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.mapping_occupations to rl_p_and_c_d;
GO
CREATE TABLE p_and_c.mapping_injury_codes (
	carrier_injury_code varchar(256) NOT NULL,
	injury_code int4 NULL,
	CONSTRAINT mapping_injury_codes_pkey PRIMARY KEY (carrier_injury_code)
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.mapping_injury_codes OWNER TO mj_admin;
GO

Grant update, insert, select on table p_and_c.mapping_injury_codes to rl_pc_data_analyst;
GO

Grant select on table p_and_c.mapping_injury_codes to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.mapping_injury_codes to rpauser;
GO
GRANT SELECT ON p_and_c.mapping_injury_codes to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.mapping_injury_codes to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.mapping_injury_codes to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.mapping_injury_codes to rl_p_and_c_d;
GO
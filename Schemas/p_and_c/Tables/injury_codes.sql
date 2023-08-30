CREATE TABLE p_and_c.injury_codes (
	id int4 NOT NULL,
	"type" varchar(256) NULL,
	CONSTRAINT injury_codes_pkey PRIMARY KEY (id)
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.injury_codes OWNER TO mj_admin;
GO

Grant select on table p_and_c.injury_codes to rl_pc_data_analyst;
GO

Grant select on table p_and_c.injury_codes to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.injury_codes to rpauser;
GO
GRANT SELECT ON p_and_c.injury_codes to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.injury_codes to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.injury_codes to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.injury_codes to rl_p_and_c_d;
GO
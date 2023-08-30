CREATE TABLE p_and_c.mapping_litigation (
	carrier_litigation varchar(256) NOT NULL,
	litigation varchar(256) NULL,
	CONSTRAINT mapping_litigation_pkey PRIMARY KEY (carrier_litigation)
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.mapping_litigation OWNER TO mj_admin;
GO

Grant update, insert, select on table p_and_c.mapping_litigation to rl_pc_data_analyst;
GO

Grant select on table p_and_c.mapping_litigation to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.mapping_litigation to rpauser;
GO
GRANT SELECT ON p_and_c.mapping_litigation to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.mapping_litigation to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.mapping_litigation to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.mapping_litigation to rl_p_and_c_d;
GO
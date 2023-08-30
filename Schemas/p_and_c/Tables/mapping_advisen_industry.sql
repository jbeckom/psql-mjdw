DROP Table if exists p_and_c.mapping_advisen_industry CASCADE;
GO

CREATE TABLE p_and_c.mapping_advisen_industry (
	industry_id varchar(4) NULL,
	advisen_industry varchar(256) NULL,
	CONSTRAINT mapping_advisen_industry_pkey PRIMARY KEY (industry_id)
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.mapping_advisen_industry OWNER TO mj_admin;
GO

Grant update, insert, select on table p_and_c.mapping_advisen_industry to rl_pc_data_analyst;
GO

Grant select on table p_and_c.mapping_advisen_industry to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.mapping_advisen_industry to rpauser;
GO
GRANT SELECT ON p_and_c.mapping_advisen_industry to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.mapping_advisen_industry to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.mapping_advisen_industry to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.mapping_advisen_industry to rl_p_and_c_d;
GO
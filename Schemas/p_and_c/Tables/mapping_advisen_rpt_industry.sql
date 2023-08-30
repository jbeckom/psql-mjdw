CREATE TABLE p_and_c.mapping_advisen_rpt_industry (
	advisen_rpt_industry varchar(256) NOT NULL,
	sic_id_2 bpchar(2) NOT NULL,
	sic_category_id varchar(1) NOT NULL,
	CONSTRAINT mapping_advisen_rpt_industry_pkey PRIMARY KEY (advisen_rpt_industry)
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.mapping_advisen_rpt_industry OWNER TO mj_admin;
GO

Grant update, insert, select on table p_and_c.mapping_advisen_rpt_industry to rl_pc_data_analyst;
GO

Grant select on table p_and_c.mapping_advisen_rpt_industry to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.mapping_advisen_rpt_industry to rpauser;
GO
GRANT SELECT ON p_and_c.mapping_advisen_rpt_industry to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.mapping_advisen_rpt_industry to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.mapping_advisen_rpt_industry to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.mapping_advisen_rpt_industry to rl_p_and_c_d;
GO
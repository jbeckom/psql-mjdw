CREATE TABLE p_and_c.benchmarking_assurex (
	primary_industry_type varchar(256) NOT NULL,
	secondary_industry_type varchar(256) NOT NULL,
	title varchar(256) NOT NULL,
	category varchar(256) NOT NULL,
	sub_category varchar(256) NULL,
	value varchar(256) NOT NULL,
	report_year varchar(256) NOT NULL,
	uploaded_at varchar(256) NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.benchmarking_assurex OWNER TO mj_admin;
GO

Grant update, insert, select on table p_and_c.benchmarking_assurex to rl_pc_data_analyst;
GO

Grant select on table p_and_c.benchmarking_assurex to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.benchmarking_assurex to rpauser;
GO

GRANT SELECT ON p_and_c.benchmarking_assurex to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.benchmarking_assurex to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.benchmarking_assurex to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.benchmarking_assurex to rl_p_and_c_d;
GO
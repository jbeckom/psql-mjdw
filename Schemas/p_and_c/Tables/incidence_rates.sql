CREATE TABLE p_and_c.incidence_rates (
	naics bpchar(6) NULL,
	headcount_min int4 NULL,
	headcount_max int4 NULL,
	mean numeric(18,1) NULL,
	first_quartile numeric(18,1) NULL,
	median numeric(18,1) NULL,
	third_quartile numeric(18,1) NULL,
	"year" numeric NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.incidence_rates OWNER TO mj_admin;
GO

Grant update, insert, select on table p_and_c.incidence_rates to rl_pc_data_analyst;
GO

Grant select on table p_and_c.incidence_rates to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.incidence_rates to rpauser;
GO
GRANT SELECT ON p_and_c.incidence_rates to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.incidence_rates to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.incidence_rates to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.incidence_rates to rl_p_and_c_d;
GO
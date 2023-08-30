CREATE TABLE p_and_c.mapping_months (
	full_month varchar(256) NOT NULL,
	abbreviation varchar(256) NOT NULL,
	num_order int4 NOT NULL,
	mm_format varchar(2) NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.mapping_months OWNER TO mj_admin;
GO

Grant update, insert, select on table p_and_c.mapping_months to rl_pc_data_analyst;
GO

Grant select on table p_and_c.mapping_months to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.mapping_months to rpauser;
GO
GRANT SELECT ON p_and_c.mapping_months to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.mapping_months to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.mapping_months to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.mapping_months to rl_p_and_c_d;
GO
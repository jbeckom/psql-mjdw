CREATE TABLE p_and_c.revenue (
	client_id text NOT NULL,
	policy_start_date date NOT NULL,
	revenue numeric(18) NOT NULL,
	audited bool NOT NULL,
	uploaded_at timestamp NOT NULL,
	unit_override varchar(256) NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.revenue OWNER TO mj_admin;
GO

Grant update, insert, select on table p_and_c.revenue to rl_pc_data_analyst;
GO

Grant select on table p_and_c.revenue to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.revenue to rpauser;
GO
GRANT SELECT ON p_and_c.revenue to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.revenue to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.revenue to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.revenue to rl_p_and_c_d;
GO
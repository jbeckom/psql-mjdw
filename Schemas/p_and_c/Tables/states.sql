CREATE TABLE p_and_c.states (
	"name" text NOT NULL,
	code bpchar(2) NOT NULL,
	monopolistic bool NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.states OWNER TO mj_admin;
GO

Grant select on table p_and_c.states to rl_pc_data_analyst;
GO

Grant select on table p_and_c.states to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.states to rpauser;
GO
GRANT SELECT ON p_and_c.states to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.states to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.states to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.states to rl_p_and_c_d;
GO
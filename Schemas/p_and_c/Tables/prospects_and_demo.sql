CREATE TABLE p_and_c.prospects_and_demo (
	id text NOT NULL,
	"name" text NOT NULL,
	industry_id int4 NOT NULL,
	logo_url text NOT NULL,
	CONSTRAINT prospects_and_demo_pkey PRIMARY KEY (id)
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.prospects_and_demo OWNER TO mj_admin;
GO

Grant update, insert, select on table p_and_c.prospects_and_demo to rl_pc_data_analyst;
GO

Grant select on table p_and_c.prospects_and_demo to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.prospects_and_demo to rpauser;
GO
GRANT SELECT ON p_and_c.prospects_and_demo to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.prospects_and_demo to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.prospects_and_demo to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.prospects_and_demo to rl_p_and_c_d;
GO
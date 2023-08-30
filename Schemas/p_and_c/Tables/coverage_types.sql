CREATE TABLE p_and_c.coverage_types (
	id varchar(50) NOT NULL,
	"name" varchar(50) NOT NULL,
	CONSTRAINT coverage_types_pkey PRIMARY KEY (id)
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.coverage_types OWNER TO mj_admin;
GO

Grant update, insert, select on table p_and_c.coverage_types to rl_pc_data_analyst;
GO

Grant select on table p_and_c.coverage_types to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.coverage_types to rpauser;
GO
GRANT SELECT ON p_and_c.coverage_types to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.coverage_types to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.coverage_types to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.coverage_types to rl_p_and_c_d;
GO
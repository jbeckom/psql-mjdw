CREATE TABLE p_and_c.mapping_supervisors (
	"location" varchar(256) NULL,
	supervisor varchar(256) NOT NULL,
	client_id varchar(256) NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.mapping_supervisors OWNER TO mj_admin;
GO

Grant update, insert, select on table p_and_c.mapping_supervisors to rl_pc_data_analyst;
GO

Grant select on table p_and_c.mapping_supervisors to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.mapping_supervisors to rpauser;
GO
GRANT SELECT ON p_and_c.mapping_supervisors to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.mapping_supervisors to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.mapping_supervisors to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.mapping_supervisors to rl_p_and_c_d;
GO
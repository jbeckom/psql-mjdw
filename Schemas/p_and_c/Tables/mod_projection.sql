CREATE TABLE p_and_c.mod_projection (
	client_id varchar(256) NOT NULL,
	projected_mod_eff_date varchar(256) NOT NULL,
	projected_mod varchar(256) NOT NULL,
	valued_as_of varchar(256) NOT NULL,
	uploaded_at varchar(256) NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.mod_projection OWNER TO mj_admin;
GO

Grant update, insert, select on table p_and_c.mod_projection to rl_pc_data_analyst;
GO

Grant select on table p_and_c.mod_projection to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.mod_projection to rpauser;
GO
GRANT SELECT ON p_and_c.mod_projection to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.mod_projection to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.mod_projection to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.mod_projection to rl_p_and_c_d;
GO
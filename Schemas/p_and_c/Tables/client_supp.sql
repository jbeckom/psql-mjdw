CREATE TABLE p_and_c.client_supp (
	client_id varchar(256) NOT NULL,
	logo_url text NULL,
	large_loss int4 NULL,
	very_large_loss int4 NULL,
	aperture_email varchar(256) NULL,
	active bool NULL,
	sic_code varchar(8) NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.client_supp OWNER TO mj_admin;
GO

Grant update, insert, select on table p_and_c.client_supp to rl_pc_data_analyst;
GO

Grant select on table p_and_c.client_supp to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.client_supp to rpauser;
GO
GRANT SELECT ON p_and_c.client_supp to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.client_supp to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.client_supp to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.client_supp to rl_p_and_c_d;
GO
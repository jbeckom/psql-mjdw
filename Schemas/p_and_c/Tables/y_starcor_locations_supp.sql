CREATE TABLE p_and_c.y_starcor_locations_supp (
	client_id varchar(10) NOT NULL,
	"location" varchar(32) NULL,
	brand varchar(32) NULL,
	store varchar(32) NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.y_starcor_locations_supp OWNER TO mj_admin;
GO

Grant update, insert, select on table p_and_c.y_starcor_locations_supp to rl_pc_data_analyst;
GO

Grant select on table p_and_c.y_starcor_locations_supp to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.y_starcor_locations_supp to rpauser;
GO
GRANT SELECT ON p_and_c.y_starcor_locations_supp to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.y_starcor_locations_supp to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.y_starcor_locations_supp to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.y_starcor_locations_supp to rl_p_and_c_d;
GO
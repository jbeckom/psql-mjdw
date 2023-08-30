CREATE TABLE p_and_c.mapping_subsidiary_locations (
	"location" text NULL,
	subsidiary_id int4 NULL,
	client_id varchar(256) NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.mapping_subsidiary_locations OWNER TO mj_admin;
GO

Grant update, insert, select on table p_and_c.mapping_subsidiary_locations to rl_pc_data_analyst;
GO

Grant select on table p_and_c.mapping_subsidiary_locations to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.mapping_subsidiary_locations to rpauser;
GO
GRANT SELECT ON p_and_c.mapping_subsidiary_locations to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.mapping_subsidiary_locations to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.mapping_subsidiary_locations to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.mapping_subsidiary_locations to rl_p_and_c_d;
GO
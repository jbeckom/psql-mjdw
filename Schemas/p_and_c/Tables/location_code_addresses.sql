CREATE TABLE p_and_c.location_code_addresses (
	client_id varchar(256) NULL,
	"location" varchar(256) NULL,
	address varchar(256) NULL,
	city varchar(256) NULL,
	state varchar(256) NULL,
	zip varchar(256) NULL,
	country varchar(256) NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.location_code_addresses OWNER TO mj_admin;
GO

Grant select on table p_and_c.location_code_addresses to rl_pc_data_analyst;
GO

Grant select on table p_and_c.location_code_addresses to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.location_code_addresses to rpauser;
GO
GRANT SELECT ON p_and_c.location_code_addresses to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.location_code_addresses to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.location_code_addresses to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.location_code_addresses to rl_p_and_c_d;
GO
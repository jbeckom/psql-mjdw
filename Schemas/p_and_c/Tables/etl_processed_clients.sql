CREATE TABLE p_and_c.etl_processed_clients (
	client_name varchar(256) NULL,
	client_id varchar(256) NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.etl_processed_clients OWNER TO mj_admin;
GO

Grant update, insert, select on table p_and_c.etl_processed_clients to rl_pc_data_analyst;
GO

Grant select on table p_and_c.etl_processed_clients to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.etl_processed_clients to rpauser;
GO
GRANT SELECT ON p_and_c.etl_processed_clients to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.etl_processed_clients to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.etl_processed_clients to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.etl_processed_clients to rl_p_and_c_d;
GO
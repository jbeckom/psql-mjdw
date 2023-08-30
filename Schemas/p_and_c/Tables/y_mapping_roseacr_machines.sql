CREATE TABLE p_and_c.y_mapping_roseacr_machines (
	claim_number varchar(1000) NOT NULL,
	machine varchar(256) NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.y_mapping_roseacr_machines OWNER TO mj_admin;
GO

Grant update, insert, select on table p_and_c.y_mapping_roseacr_machines to rl_pc_data_analyst;
GO

Grant select on table p_and_c.y_mapping_roseacr_machines to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.y_mapping_roseacr_machines to rpauser;
GO
GRANT SELECT ON p_and_c.y_mapping_roseacr_machines to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.y_mapping_roseacr_machines to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.y_mapping_roseacr_machines to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.y_mapping_roseacr_machines to rl_p_and_c_d;
GO
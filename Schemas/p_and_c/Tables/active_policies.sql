DROP TABLE p_and_c.active_policies CASCADE;
GO

CREATE TABLE p_and_c.active_policies (
	client_id varchar(15) NOT NULL,
	policy_start_date date NOT NULL,
	policy_end_date date NOT NULL,
	coverage_type_id varchar(15) NOT NULL,
	policy_number varchar(100) NOT NULL,
	carrier_id varchar(15) NOT NULL,
	rmc_id varchar(15) NULL,
	ce_id varchar(15) NULL,
	rts_id varchar(15) NULL,
	cc_id varchar(15) NULL,
	classification varchar(15) NULL,
	uploaded_at date NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.active_policies OWNER TO mj_admin;
GO

Grant select on table p_and_c.active_policies to rl_pc_data_analyst;
GO

Grant select,insert on table p_and_c.active_policies to rl_pc_rpa_developer;
GO

Grant select,insert,update,delete on table p_and_c.active_policies to rpauser;
GO
GRANT SELECT ON p_and_c.active_policies to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.active_policies to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.active_policies to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.active_policies to rl_p_and_c_d;
GO
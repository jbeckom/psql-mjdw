CREATE TABLE p_and_c.mapping_policies (
	carrier_policy_number varchar(4096) NOT NULL,
	policy_id int8 NOT NULL,
	CONSTRAINT mapping_policies_temp_pkey PRIMARY KEY (carrier_policy_number)
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.mapping_policies OWNER TO mj_admin;
GO

Grant update, insert, select on table p_and_c.mapping_policies to rl_pc_data_analyst;
GO

Grant select on table p_and_c.mapping_policies to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.mapping_policies to rpauser;
GO
GRANT SELECT ON p_and_c.mapping_policies to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.mapping_policies to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.mapping_policies to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.mapping_policies to rl_p_and_c_d;
GO
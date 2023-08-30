CREATE TABLE p_and_c.lim_ded_mod_override (
	policy_id int8 NULL,
	occurrence_type_id int4 NULL,
	aggregate_type_id int4 NULL,
	value numeric NULL,
	loss_type_id int4 NULL,
	policy_id_suff int4 NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.lim_ded_mod_override OWNER TO mj_admin;
GO

Grant update, insert, select on table p_and_c.lim_ded_mod_override to rl_pc_data_analyst;
GO

Grant select on table p_and_c.lim_ded_mod_override to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.lim_ded_mod_override to rpauser;
GO
GRANT SELECT ON p_and_c.lim_ded_mod_override to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.lim_ded_mod_override to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.lim_ded_mod_override to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.lim_ded_mod_override to rl_p_and_c_d;
GO
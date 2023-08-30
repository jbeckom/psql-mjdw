CREATE TABLE p_and_c.loss_types (
	id int4 NOT NULL,
	coverage_type_major text NULL,
	coverage_type_minor text NULL,
	coverage_type_detailed text NULL,
	deductible_type text NULL,
	CONSTRAINT loss_types_pkey PRIMARY KEY (id)
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.loss_types OWNER TO mj_admin;
GO

Grant update, insert, select on table p_and_c.loss_types to rl_pc_data_analyst;
GO

Grant select on table p_and_c.loss_types to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.loss_types to rpauser;
GO
GRANT SELECT ON p_and_c.loss_types to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.loss_types to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.loss_types to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.loss_types to rl_p_and_c_d;
GO
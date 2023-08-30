CREATE TABLE p_and_c.gl_exposures (
	policy_id int8 NULL,
	location_number int4 NULL,
	description text NULL,
	address text NULL,
	city text NULL,
	state bpchar(2) NULL,
	zip bpchar(5) NULL,
	gl_exposure_class bpchar(5) NULL,
	gl_basis_id bpchar(1) NULL,
	gl_basis_units varchar(256) NULL,
	exposure numeric(18) NULL,
	notes text NULL,
	audited bool NULL,
	uploaded_at timestamp NULL,
	do_not_include bool NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.gl_exposures OWNER TO mj_admin;
GO

Grant update, insert, select on table p_and_c.gl_exposures to rl_pc_data_analyst;
GO

Grant select on table p_and_c.gl_exposures to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.gl_exposures to rpauser;
GO
GRANT SELECT ON p_and_c.gl_exposures to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.gl_exposures to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.gl_exposures to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.gl_exposures to rl_p_and_c_d;
GO
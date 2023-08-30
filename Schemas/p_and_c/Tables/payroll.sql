CREATE TABLE p_and_c.payroll (
	policy_id int8 NULL,
	state bpchar(2) NULL,
	city text NULL,
	zip bpchar(5) NULL,
	class_code bpchar(4) NULL,
	payroll numeric(18) NULL,
	audited bool NULL,
	employee_headcount_full_time numeric(18) NULL,
	employee_headcount_part_time numeric(18) NULL,
	employee_headcount_temp numeric(18) NULL,
	subsidiary_id int4 NULL,
	uploaded_at timestamp NULL,
	do_not_include bool NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.payroll OWNER TO mj_admin;
GO

Grant update, insert, select on table p_and_c.payroll to rl_pc_data_analyst;
GO

Grant select on table p_and_c.payroll to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.payroll to rpauser;
GO
GRANT SELECT ON p_and_c.payroll to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.payroll to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.payroll to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.payroll to rl_p_and_c_d;
GO
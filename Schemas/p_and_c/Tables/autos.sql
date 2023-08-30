CREATE TABLE p_and_c.autos (
	policy_id int8 NULL,
	"year" bpchar(4) NULL,
	make text NULL,
	model text NULL,
	vin text NULL,
	city text NULL,
	state bpchar(2) NULL,
	zip bpchar(5) NULL,
	class_code varchar(5) NULL,
	liab bool NULL,
	med_pay bool NULL,
	um bool NULL,
	comp_deduct numeric(18) NULL,
	collision_deduct numeric(18) NULL,
	cost_new numeric(18) NULL,
	uploaded_at timestamp NULL,
	do_not_include bool NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.autos OWNER TO mj_admin;
GO

Grant update, insert, select on table p_and_c.autos to rl_pc_data_analyst;
GO

Grant select on table p_and_c.autos to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.autos to rpauser;
GO


GRANT SELECT ON p_and_c.autos to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.autos to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.autos to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.autos to rl_p_and_c_d;
GO
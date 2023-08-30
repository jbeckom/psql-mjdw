CREATE TABLE p_and_c.elilill_nets (
	"Year" int4 NOT NULL,
	"ID" varchar(5) NOT NULL,
	"Percent" numeric(4,2) NOT NULL,
	"Period" varchar(256) NULL,
	"NETS Collisions" int4 NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.elilill_nets OWNER TO mj_admin;
GO

Grant select on table p_and_c.elilill_nets to rl_pc_data_analyst;
GO

Grant select on table p_and_c.elilill_nets to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.elilill_nets to rpauser;
GO

GRANT SELECT ON p_and_c.elilill_nets to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.elilill_nets to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.elilill_nets to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.elilill_nets to rl_p_and_c_d;
GO
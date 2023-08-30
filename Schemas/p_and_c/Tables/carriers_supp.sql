CREATE TABLE p_and_c.carriers_supp (
	id varchar(256) NOT NULL,
	"name" varchar(256) NOT NULL,
	alias varchar(256) NOT NULL,
	CONSTRAINT carriers_supp_pkey PRIMARY KEY (id)
);
go

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.carriers_supp OWNER TO mj_admin;
GO

Grant update, insert, select on table p_and_c.carriers_supp to rl_pc_data_analyst;
GO

Grant select on table p_and_c.carriers_supp to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.carriers_supp to rpauser;
GO


GRANT SELECT ON p_and_c.carriers_supp to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.carriers_supp to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.carriers_supp to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.carriers_supp to rl_p_and_c_d;
GO
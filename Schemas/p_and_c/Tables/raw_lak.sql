CREATE TABLE p_and_c.raw_lak (
	"name" varchar(256) NULL,
	cov_type varchar(256) NULL,
	"policy" varchar(256) NULL,
	policy_start_date varchar(256) NULL,
	claim varchar(256) NULL,
	"no" varchar(256) NULL,
	"date" varchar(256) NULL,
	"operator" varchar(256) NULL,
	age varchar(256) NULL,
	description varchar(256) NULL,
	"type" varchar(256) NULL,
	stat varchar(256) NULL,
	reserve varchar(256) NULL,
	payment varchar(256) NULL,
	filename varchar(256) NULL,
	uploaded_at date NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_lak OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_lak to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_lak to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_lak to rpauser;
GO
GRANT SELECT ON p_and_c.raw_lak to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_lak to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_lak to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_lak to rl_p_and_c_d;
GO
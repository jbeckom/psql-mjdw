CREATE TABLE p_and_c.raw_1000002 (
	"LOB" varchar(256) NULL,
	"Type" varchar(256) NULL,
	"Div." varchar(256) NULL,
	"Dept." varchar(256) NULL,
	"Date of Loss" varchar(256) NULL,
	"Claim Number" varchar(256) NULL,
	"Claimant" varchar(256) NULL,
	"Description" varchar(4096) NULL,
	"ST" varchar(256) NULL,
	"Reserves" varchar(256) NULL,
	"Paid" varchar(256) NULL,
	"Collection" varchar(256) NULL,
	"Incurred" varchar(256) NULL,
	filename varchar(256) NOT NULL,
	uploaded_at varchar(256) NOT NULL,
	policy_year varchar(256) NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_1000002 OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_1000002 to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_1000002 to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_1000002 to rpauser;
GO
GRANT SELECT ON p_and_c.raw_1000002 to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_1000002 to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_1000002 to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_1000002 to rl_p_and_c_d;
GO
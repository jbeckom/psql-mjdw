CREATE TABLE p_and_c.raw_fcci (
	"Claim Number" varchar(256) NOT NULL,
	"Claimant Name" varchar(256) NOT NULL,
	"Policyholder Name" varchar(256) NOT NULL,
	"Policy" varchar(256) NOT NULL,
	"Date of Accident" varchar(256) NOT NULL,
	"Paid" varchar(256) NOT NULL,
	"Paid Expenses" varchar(256) NOT NULL,
	"Total Recoveries" varchar(256) NOT NULL,
	"Incurred" varchar(256) NOT NULL,
	"Status" varchar(256) NOT NULL,
	filename varchar(256) NOT NULL,
	uploaded_at date NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_fcci OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_fcci to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_fcci to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_fcci to rpauser;
GO
GRANT SELECT ON p_and_c.raw_fcci to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_fcci to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_fcci to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_fcci to rl_p_and_c_d;
GO
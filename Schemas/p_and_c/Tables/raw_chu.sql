CREATE TABLE p_and_c.raw_chu (
	"Insured" varchar(256) NULL,
	"Policy #" varchar(256) NULL,
	"Policy Term" varchar(256) NULL,
	"Policy Type" varchar(256) NULL,
	"Writing Company" varchar(256) NULL,
	"Claim Reference #" varchar(256) NULL,
	"Claim/Occurrence #" varchar(256) NULL,
	"Claim Type" varchar(256) NULL,
	"Claim Status" varchar(256) NULL,
	"Claimant #" varchar(256) NULL,
	"Claimant Name" varchar(256) NULL,
	"Loss Description" varchar(4096) NULL,
	"Loss Location" varchar(256) NULL,
	"Loss Date" varchar(256) NULL,
	"Reported Date" varchar(256) NULL,
	"Close Date" varchar(256) NULL,
	"Loss Reserve" varchar(256) NULL,
	"Expense Reserve" varchar(256) NULL,
	"Losses Paid" varchar(256) NULL,
	"Expenses Paid" varchar(256) NULL,
	"Losses and Expenses Paid" varchar(256) NULL,
	"Deductible Amount" varchar(256) NULL,
	"Recovery" varchar(256) NULL,
	"Total Incurred" varchar(256) NULL,
	file_name varchar(256) NULL,
	uploaded_at varchar(256) NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_chu OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_chu to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_chu to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_chu to rpauser;
GO
GRANT SELECT ON p_and_c.raw_chu to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_chu to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_chu to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_chu to rl_p_and_c_d;
GO
CREATE TABLE p_and_c.raw_cna (
	"Account Number" varchar(256) NOT NULL,
	"Policy Number" varchar(256) NOT NULL,
	"Product" varchar(256) NOT NULL,
	"Eff - Exp Dates" varchar(256) NOT NULL,
	"Location Code" varchar(256) NOT NULL,
	"Claim Number" varchar(256) NOT NULL,
	"Claimant Name" varchar(256) NOT NULL,
	"Status" varchar(256) NOT NULL,
	"Loss/Injury Date" varchar(256) NOT NULL,
	"Report Date" varchar(256) NOT NULL,
	"Notice Date" varchar(256) NOT NULL,
	"Paid Loss" varchar(256) NOT NULL,
	"Paid Indemnity" varchar(256) NOT NULL,
	"Paid Medical" varchar(256) NOT NULL,
	"Paid Liability" varchar(256) NOT NULL,
	"Paid Expenses" varchar(256) NOT NULL,
	"Reserves" varchar(256) NOT NULL,
	"Recovery" varchar(256) NOT NULL,
	"Net Incurred" varchar(256) NOT NULL,
	"Deduct" varchar(256) NOT NULL,
	"Gross Incurred" varchar(256) NOT NULL,
	"Accident Type" varchar(256) NULL,
	"Accident State" varchar(256) NOT NULL,
	"Account Name" varchar(256) NULL,
	"Agency Name" varchar(256) NULL,
	"Body Part" varchar(256) NULL,
	"Claim Office" varchar(256) NULL,
	"Claimant Nature" varchar(256) NULL,
	"Claimant Source" varchar(256) NULL,
	"Loss Description" varchar(256) NOT NULL,
	"Driver Name" varchar(256) NULL,
	"Insured Nature" varchar(256) NULL,
	"Insured Source" varchar(256) NULL,
	"Primary Producer" varchar(256) NULL,
	"Secondary Producer" varchar(256) NULL,
	"ALC" varchar(256) NOT NULL,
	deskcode varchar(256) NOT NULL,
	"Claim Specialist" varchar(256) NULL,
	filename varchar(256) NOT NULL,
	uploaded_at date NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_cna OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_cna to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_cna to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_cna to rpauser;
GO
GRANT SELECT ON p_and_c.raw_cna to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_cna to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_cna to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_cna to rl_p_and_c_d;
GO
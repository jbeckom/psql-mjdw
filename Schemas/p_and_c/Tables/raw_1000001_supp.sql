CREATE TABLE p_and_c.raw_1000001_supp (
	"Loc Descrip Lvl3" varchar(256) NULL,
	"Claim Number" varchar(256) NULL,
	"Claimant" varchar(256) NULL,
	"Carrier" varchar(256) NULL,
	"Accident Date" varchar(256) NULL,
	"Report Date" varchar(256) NULL,
	"Close Date" varchar(256) NULL,
	"Activity Date" varchar(256) NULL,
	"Coverage" varchar(256) NULL,
	"State Cd" varchar(256) NULL,
	"Status" varchar(256) NULL,
	"Litigation" varchar(256) NULL,
	"Location" varchar(256) NULL,
	"Cause/Hazard" varchar(256) NULL,
	"Nature" varchar(256) NULL,
	"Part" varchar(256) NULL,
	"Policy Number" varchar(256) NULL,
	"Claimant Hire Date" varchar(256) NULL,
	"Cov Loss Type Desc" varchar(256) NULL,
	"Adjuster Name" varchar(256) NULL,
	"Description" varchar(256) NULL,
	"Ind/Pd/Cmpr Paid" varchar(256) NULL,
	"Ind/Pd/Cmpr Outstanding" varchar(256) NULL,
	"Ind/Pd/Cmpr Incurred" varchar(256) NULL,
	"Med/Bi/Coll Paid" varchar(256) NULL,
	"Med/Bi/Coll Outstanding" varchar(256) NULL,
	"Med/Bi/Coll Incurred" varchar(256) NULL,
	"Expense Paid" varchar(256) NULL,
	"Expense Outstanding" varchar(256) NULL,
	"Expense Incurred" varchar(256) NULL,
	"Recovery Paid" varchar(256) NULL,
	"Recovery Outstanding" varchar(256) NULL,
	"Recovery Incurred" varchar(256) NULL,
	"Paid" varchar(256) NULL,
	"Outstanding" varchar(256) NULL,
	"Incurred" varchar(256) NULL,
	filename varchar(256) NULL,
	uploaded_at varchar(256) NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_1000001_supp OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_1000001_supp to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_1000001_supp to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_1000001_supp to rpauser;
GO
GRANT SELECT ON p_and_c.raw_1000001_supp to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_1000001_supp to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_1000001_supp to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_1000001_supp to rl_p_and_c_d;
GO
CREATE TABLE p_and_c.raw_1000006_quincy (
	"Policy Year" varchar(256) NOT NULL,
	"Coverage Major" varchar(256) NOT NULL,
	"Coverage Minor" varchar(256) NOT NULL,
	"Hierarchy Location Level 2" varchar(256) NOT NULL,
	"Hierarchy Location Level 3" varchar(256) NULL,
	"Hierarchy Location Level 4" varchar(256) NULL,
	"Incident Name" varchar(256) NOT NULL,
	"Claim Number" varchar(256) NOT NULL,
	"Claim Status" varchar(256) NOT NULL,
	"Date of Loss" varchar(256) NOT NULL,
	"Date Closed" varchar(256) NOT NULL,
	"Date Reported To Insured" varchar(256) NOT NULL,
	"Date Reported to TPA" varchar(256) NOT NULL,
	"Employee Lag" varchar(256) NOT NULL,
	"Employer Lag" varchar(256) NOT NULL,
	"Total Lag" varchar(256) NOT NULL,
	"Jurisdiction" varchar(256) NOT NULL,
	"Claimant Name" varchar(256) NOT NULL,
	"Claimant Gender" varchar(256) NULL,
	"Occupation" varchar(256) NULL,
	"Accident Description" varchar(4096) NOT NULL,
	"Cause" varchar(256) NOT NULL,
	"Injury" varchar(256) NULL,
	"Body Part" varchar(256) NULL,
	"Date Claimant Born" varchar(256) NOT NULL,
	"Date Hired" varchar(256) NOT NULL,
	"Adjuster: Full Name" varchar(256) NOT NULL,
	"Expense Paid" varchar(256) NOT NULL,
	"Indemnity Paid" varchar(256) NOT NULL,
	"Legal Paid" varchar(256) NOT NULL,
	"Medical Paid" varchar(256) NOT NULL,
	"Expense Balance" varchar(256) NOT NULL,
	"Indemnity Balance" varchar(256) NOT NULL,
	"Legal Balance" varchar(256) NOT NULL,
	"Medical Balance" varchar(256) NOT NULL,
	"Expense Recovery" varchar(256) NOT NULL,
	"Indemnity Recovery" varchar(256) NOT NULL,
	"Legal Recovery" varchar(256) NOT NULL,
	"Medical Recovery" varchar(256) NOT NULL,
	"Expense Incurred" varchar(256) NOT NULL,
	"Indemnity Incurred" varchar(256) NOT NULL,
	"Legal Incurred" varchar(256) NOT NULL,
	"Medical Incurred" varchar(256) NOT NULL,
	"Total Paid" varchar(256) NOT NULL,
	"Total Balance" varchar(256) NOT NULL,
	"Total Recovery" varchar(256) NOT NULL,
	"Total Incurred" varchar(256) NOT NULL,
	"Month Prior Incurred" varchar(256) NOT NULL,
	"Incurred Change" varchar(256) NOT NULL,
	filename varchar(256) NOT NULL,
	uploaded_at date NOT NULL,
	"Policy Number" varchar(256) NULL,
	"Month Prior Paid" varchar(256) NULL,
	"Paid Change" varchar(256) NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_1000006_quincy OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_1000006_quincy to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_1000006_quincy to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_1000006_quincy to rpauser;
GO
GRANT SELECT ON p_and_c.raw_1000006_quincy to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_1000006_quincy to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_1000006_quincy to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_1000006_quincy to rl_p_and_c_d;
GO
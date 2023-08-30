CREATE TABLE p_and_c.raw_bh (
	"Insured Name" varchar(256) NOT NULL,
	"AsOf" varchar(256) NOT NULL,
	"Policy Number" varchar(256) NOT NULL,
	"Policy Inception Date" varchar(256) NOT NULL,
	"Policy Expiration Date" varchar(256) NOT NULL,
	"Insurer" varchar(256) NOT NULL,
	"Claim Number" varchar(256) NOT NULL,
	"Claimant First Name" varchar(256) NOT NULL,
	"Claimant Middle Name" varchar(256) NULL,
	"Claimant Last Name" varchar(256) NOT NULL,
	"Loss Date" varchar(256) NOT NULL,
	"Claim Status" varchar(256) NOT NULL,
	"Claim Type" varchar(256) NOT NULL,
	"Risk State" varchar(256) NOT NULL,
	"Jurisdiction" varchar(256) NOT NULL,
	"Gender" varchar(256) NOT NULL,
	"Claimant Birth Date" varchar(256) NOT NULL,
	"Claimant Age" varchar(256) NOT NULL,
	"Claimant Hire Date" varchar(256) NULL,
	"Years Employed" varchar(256) NULL,
	"Occupation Desc" varchar(256) NOT NULL,
	"Average Weekly Wage" varchar(256) NOT NULL,
	"Class Code" varchar(256) NOT NULL,
	"Closed Date" varchar(256) NULL,
	"Reopened Date" varchar(256) NULL,
	"Litigated" varchar(256) NOT NULL,
	"Date Reported To Insurer" varchar(256) NOT NULL,
	"Days To Report" varchar(256) NOT NULL,
	"Date Employer Informed" varchar(256) NOT NULL,
	"Reporting Lag" varchar(256) NOT NULL,
	"Claims Professional" varchar(256) NOT NULL,
	"Reporting Location Desc" varchar(256) NULL,
	"Reporting Location Address1" varchar(256) NULL,
	"Reporting Location Address2" varchar(256) NULL,
	"Reporting Location City" varchar(256) NULL,
	"Reporting Location State" varchar(256) NULL,
	"Reporting Location Zip Code" varchar(256) NULL,
	"Injury Location Desc" varchar(256) NULL,
	"Injury Location Address1" varchar(256) NULL,
	"Injury Location Address2" varchar(256) NULL,
	"Injury Location City" varchar(256) NULL,
	"Injury Location State" varchar(256) NULL,
	"Injury Location Zip Code" varchar(256) NULL,
	"Reporting Group OrgID" varchar(256) NULL,
	"Reporting Group Code Path" varchar(256) NULL,
	"Reporting Group 1" varchar(256) NULL,
	"Reporting Group 1 Code" varchar(256) NULL,
	"Reporting Group 2" varchar(256) NULL,
	"Reporting Group 2 Code" varchar(256) NULL,
	"Employee ID" varchar(256) NULL,
	"Injury Cause Desc" varchar(256) NOT NULL,
	"Nature Of Injury Desc" varchar(256) NOT NULL,
	"Body Part Desc" varchar(256) NOT NULL,
	"How Injury Occurred" varchar(2048) NOT NULL,
	"Injury Desc" varchar(2048) NOT NULL,
	"Activity" varchar(2048) NULL,
	"Work Start Time" varchar(256) NULL,
	"Time of Incident" varchar(256) NULL,
	"PD Rating" varchar(256) NOT NULL,
	"Medical Incurred" varchar(256) NOT NULL,
	"Medical Paid" varchar(256) NOT NULL,
	"TD Incurred" varchar(256) NOT NULL,
	"TD Paid" varchar(256) NOT NULL,
	"PD Incurred" varchar(256) NOT NULL,
	"PD Paid" varchar(256) NOT NULL,
	"VR Incurred" varchar(256) NOT NULL,
	"VR Paid" varchar(256) NOT NULL,
	"Expense Incurred" varchar(256) NOT NULL,
	"Expense Paid" varchar(256) NOT NULL,
	"Total Gross Incurred" varchar(256) NOT NULL,
	"Total Outstanding Reserve" varchar(256) NOT NULL,
	"Total Gross Paid" varchar(256) NOT NULL,
	"Total Recoveries" varchar(256) NOT NULL,
	"Third Party Recoveries" varchar(256) NOT NULL,
	"Deductible Reimbursed" varchar(256) NOT NULL,
	"Deductible Amount" varchar(256) NOT NULL,
	"Deductible Type" varchar(256) NULL,
	filename varchar(256) NOT NULL,
	uploaded_at date NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_bh OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_bh to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_bh to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_bh to rpauser;
GO
GRANT SELECT ON p_and_c.raw_bh to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_bh to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_bh to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_bh to rl_p_and_c_d;
GO
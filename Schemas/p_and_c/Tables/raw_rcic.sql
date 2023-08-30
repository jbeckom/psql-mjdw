CREATE TABLE p_and_c.raw_rcic (
	"Black Lung Y/N" varchar(256) NULL,
	"Carrier Name" varchar(256) NULL,
	"Claim Cause" varchar(256) NULL,
	"Claim Description" varchar(4096) NULL,
	"Claim Location State" varchar(256) NULL,
	"Claim Number" varchar(256) NULL,
	"Claim Status" varchar(256) NULL,
	"Claim Type" varchar(256) NULL,
	"Claimant Age" varchar(256) NULL,
	"Claimant Date Of Birth" varchar(256) NULL,
	"Claimant Name" varchar(256) NULL,
	"Claimant Gender" varchar(256) NULL,
	"Claimant Occupation" varchar(256) NULL,
	"Claimant Shift" varchar(256) NULL,
	"Claimant Source" varchar(256) NULL,
	"Claimant Supervisor" varchar(256) NULL,
	"Class Description" varchar(256) NULL,
	"Client Location" varchar(256) NULL,
	"Client Location City/State" varchar(256) NULL,
	"Client Location Codes" varchar(256) NULL,
	"Client Name" varchar(256) NULL,
	"Date Closed" varchar(256) NULL,
	"Date of Hire" varchar(256) NULL,
	"Date of Loss" varchar(256) NULL,
	"Date Reported" varchar(256) NULL,
	"Day of Week" varchar(256) NULL,
	"Deductible" varchar(256) NULL,
	"Experience in Job" varchar(256) NULL,
	"Incurred Indemnity" varchar(256) NULL,
	"Incurred Medical" varchar(256) NULL,
	"Incurred Total" varchar(256) NULL,
	"Injury Type" varchar(256) NULL,
	"Line of Coverage" varchar(256) NULL,
	"Lag Days" varchar(256) NULL,
	"Location on Body" varchar(256) NULL,
	"Mining Experience" varchar(256) NULL,
	"Paid Expense" varchar(256) NULL,
	"Paid Indemnity" varchar(256) NULL,
	"Paid Loss" varchar(256) NULL,
	"Paid Medical" varchar(256) NULL,
	"Paid Total" varchar(256) NULL,
	"Policy Eff Date" varchar(256) NULL,
	"Policy Exp Date" varchar(256) NULL,
	"Policy Number" varchar(256) NULL,
	"Reimbursed Total" varchar(256) NULL,
	"Reserve Indemnity" varchar(256) NULL,
	"Reserve Medical" varchar(256) NULL,
	"Reserve Total" varchar(256) NULL,
	"Severity Description" varchar(256) NULL,
	"Subrogation" varchar(256) NULL,
	file_name varchar(256) NOT NULL,
	uploaded_at varchar(256) NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_rcic OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_rcic to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_rcic to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_rcic to rpauser;
GO
GRANT SELECT ON p_and_c.raw_rcic to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_rcic to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_rcic to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_rcic to rl_p_and_c_d;
GO
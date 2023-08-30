CREATE TABLE p_and_c.raw_rcic_gl (
	"Black Lung Y/N" varchar(256) NOT NULL,
	"Carrier Name" varchar(256) NOT NULL,
	"Claim Cause" varchar(256) NULL,
	"Claim Description" varchar(256) NULL,
	"Claim Location State" varchar(256) NOT NULL,
	"Claim Number" varchar(256) NOT NULL,
	"Claim Status" varchar(256) NOT NULL,
	"Claim Type" varchar(256) NULL,
	"Claimant Age" varchar(256) NULL,
	"Claimant Date Of Birth" varchar(256) NULL,
	"Claimant Name" varchar(256) NOT NULL,
	"Claimant Gender" varchar(256) NULL,
	"Claimant Occupation" varchar(256) NULL,
	"Claimant Shift" varchar(256) NULL,
	"Claimant Source" varchar(256) NOT NULL,
	"Claimant Supervisor" varchar(256) NULL,
	"Class Description" varchar(256) NULL,
	"Client Location" varchar(256) NULL,
	"Client Location City/State" varchar(256) NOT NULL,
	"Client Location Codes" varchar(256) NULL,
	"Client Name" varchar(256) NOT NULL,
	"Date Closed" varchar(256) NULL,
	"Date of Hire" varchar(256) NULL,
	"Date of Loss" varchar(256) NOT NULL,
	"Date Reported" varchar(256) NOT NULL,
	"Day of Week" varchar(256) NOT NULL,
	"Deductible" varchar(256) NULL,
	"Experience in Job" varchar(256) NULL,
	"Incurred Bod Injury" varchar(256) NOT NULL,
	"Incurred Prop Damage" varchar(256) NOT NULL,
	"Incurred Total" varchar(256) NOT NULL,
	"Injury Type" varchar(256) NOT NULL,
	"Line Of Coverage" varchar(256) NOT NULL,
	"Lag Days" varchar(256) NOT NULL,
	"Location on Body" varchar(256) NULL,
	"Mining Experience" varchar(256) NULL,
	"Paid Bodily Injury" varchar(256) NOT NULL,
	"Paid Property Damage" varchar(256) NOT NULL,
	"Paid Loss" varchar(256) NOT NULL,
	"Paid Expense" varchar(256) NOT NULL,
	"Paid Total" varchar(256) NOT NULL,
	"Policy Eff Date" varchar(256) NOT NULL,
	"Policy Exp Date" varchar(256) NOT NULL,
	"Policy Number" varchar(256) NOT NULL,
	"Reimbursed Total" varchar(256) NOT NULL,
	"Reserve BI" varchar(256) NOT NULL,
	"Reserve PD" varchar(256) NOT NULL,
	"Reserve Total" varchar(256) NOT NULL,
	"Severity Description" varchar(256) NOT NULL,
	filename varchar(256) NOT NULL,
	uploaded_at date NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_rcic_gl OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_rcic_gl to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_rcic_gl to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_rcic_gl to rpauser;
GO
GRANT SELECT ON p_and_c.raw_rcic_gl to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_rcic_gl to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_rcic_gl to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_rcic_gl to rl_p_and_c_d;
GO
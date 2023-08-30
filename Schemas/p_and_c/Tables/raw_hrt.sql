CREATE TABLE p_and_c.raw_hrt (
	"Claim Number" varchar(256) NULL,
	"Claimant" varchar(256) NULL,
	"Claim Type" varchar(256) NULL,
	"Status" varchar(256) NULL,
	"Jurisdiction State" varchar(256) NULL,
	"Class Code" varchar(256) NULL,
	"Occupation" varchar(256) NULL,
	"Location Number" varchar(256) NULL,
	"Department" varchar(256) NULL,
	"Cause" varchar(256) NULL,
	"Body Part" varchar(256) NULL,
	"Nature of Injury" varchar(256) NULL,
	"Claim Adjuster" varchar(4096) NULL,
	"Claimant Age" varchar(256) NULL,
	"Birth Date" varchar(256) NULL,
	"Hire Date" varchar(256) NULL,
	"Date of Injury" varchar(256) NULL,
	"Days to Report" varchar(256) NULL,
	"Paid Medical" varchar(256) NULL,
	"Paid Indemnity" varchar(256) NULL,
	"Paid Legal/Expense" varchar(256) NULL,
	"O/S Medical" varchar(256) NULL,
	"O/S Indemnity" varchar(256) NULL,
	"O/S Legal/Expense" varchar(256) NULL,
	"Incurred Medical" varchar(256) NULL,
	"Incurred Indemnity" varchar(256) NULL,
	"Incurred Legal/Expense" varchar(256) NULL,
	"Total Paid" varchar(256) NULL,
	"Total Outstanding" varchar(4096) NULL,
	"Total Incurred" varchar(256) NULL,
	"Loss Description" varchar(4096) NULL,
	"Client" varchar(256) NULL,
	"Carrier Policy Effective Date" varchar(256) NULL,
	file_name varchar(256) NULL,
	uploaded_at varchar(256) NULL,
	"Carrier Policy Number" varchar(256) NULL,
	subrogation varchar(256) NULL,
	"Incurred Recovery" varchar(256) NULL,
	"Detail Cause" varchar(256) NULL,
	"Employment Address" varchar(256) NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_hrt OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_hrt to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_hrt to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_hrt to rpauser;
GO
GRANT SELECT ON p_and_c.raw_hrt to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_hrt to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_hrt to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_hrt to rl_p_and_c_d;
GO